package com.fitness.service;

import com.fitness.model.Member;
import com.fitness.model.MembershipPlan;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.io.*;
import java.nio.file.*;
import java.util.stream.Collectors;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class MembershipService {
    private static final String MEMBER_FILE = "src/main/webapp/WEB-INF/data/members.csv";
    private MembershipPlanService membershipPlanService;

    @Autowired
    public void setMembershipPlanService(MembershipPlanService membershipPlanService) {
        this.membershipPlanService = membershipPlanService;
    }

    public Member subscribe(String firstName, String lastName, String email, String phone, 
                          LocalDate dateOfBirth, String address, MembershipPlan plan) {
        List<Member> members = getAllMembersFromFile();
        long newId = members.stream().mapToLong(m -> m.getId() != null ? m.getId() : 0).max().orElse(0) + 1;
        Member member = new Member(firstName, lastName, email, phone, dateOfBirth, address,
                                 plan, LocalDate.now(), 
                                 LocalDate.now().plusMonths(plan.getDurationInMonths()));
        member.setId(newId);
        member.setStatus("ACTIVE");
        member.addMembershipHistory(plan, member.getMembershipStartDate(), member.getMembershipEndDate());
        saveMemberToFile(member);
        return member;
    }

    public Member upgradePlan(Long memberId, MembershipPlan newPlan) {
        List<Member> members = getAllMembersFromFile();
        for (int i = 0; i < members.size(); i++) {
            Member member = members.get(i);
            if (member.getId().equals(memberId)) {
                LocalDate newStartDate = LocalDate.now();
                LocalDate newEndDate = newStartDate.plusMonths(newPlan.getDurationInMonths());
                member.addMembershipHistory(newPlan, newStartDate, newEndDate);
                member.setCurrentPlan(newPlan);
                member.setMembershipStartDate(newStartDate);
                member.setMembershipEndDate(newEndDate);
                members.set(i, member);
                writeAllMembers(members);
                return member;
            }
        }
        return null;
    }

    public List<Member> getAllMembers() {
        return getAllMembersFromFile();
    }

    public Member getMemberById(Long id) {
        return getAllMembersFromFile().stream()
            .filter(m -> m.getId().equals(id))
            .findFirst()
            .orElse(null);
    }

    public void updateMembershipStatuses() {
        LocalDate now = LocalDate.now();
        List<Member> expiredMembers = getAllMembersFromFile().stream()
            .filter(m -> m.getMembershipEndDate().isBefore(now) && m.getStatus().equalsIgnoreCase("ACTIVE"))
            .collect(Collectors.toList());
        
        expiredMembers.forEach(member -> {
            member.setStatus("EXPIRED");
            saveMemberToFile(member);
        });
    }

    public void saveMemberToFile(Member member) {
        List<Member> members = getAllMembersFromFile();
        boolean updated = false;
        for (int i = 0; i < members.size(); i++) {
            if (members.get(i).getId() != null && members.get(i).getId().equals(member.getId())) {
                members.set(i, member);
                updated = true;
                break;
            }
        }
        if (!updated) {
            members.add(member);
        }
        writeAllMembers(members);
    }

    public List<Member> getAllMembersFromFile() {
        List<Member> members = new ArrayList<>();
        try (BufferedReader reader = Files.newBufferedReader(Paths.get(MEMBER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 11) {
                    Member m = new Member();
                    m.setId(Long.parseLong(parts[0]));
                    m.setFirstName(parts[1]);
                    m.setLastName(parts[2]);
                    m.setEmail(parts[3]);
                    m.setPhone(parts[4]);
                    m.setDateOfBirth(LocalDate.parse(parts[5]));
                    m.setAddress(parts[6]);
                    MembershipPlan plan = null;
                    if (membershipPlanService != null) {
                        plan = membershipPlanService.getAllPlans().stream()
                            .filter(p -> p.getName().equals(parts[7]))
                            .findFirst().orElse(null);
                    }
                    if (plan == null) {
                        plan = new MembershipPlan();
                        plan.setId(-1L);
                        plan.setName(parts[7]);
                        plan.setDescription("N/A");
                        plan.setPrice(java.math.BigDecimal.ZERO);
                        plan.setDurationInMonths(1);
                        plan.setPlanType("BASIC");
                    }
                    m.setCurrentPlan(plan);
                    m.setMembershipStartDate(LocalDate.parse(parts[8]));
                    m.setMembershipEndDate(LocalDate.parse(parts[9]));
                    m.setStatus(parts[10]);
                    members.add(m);
                }
            }
        } catch (IOException e) {
            // File may not exist yet
        }
        return members;
    }

    public Member findMemberByEmail(String email) {
        return getAllMembersFromFile().stream()
            .filter(m -> m.getEmail().equalsIgnoreCase(email))
            .findFirst().orElse(null);
    }

    private void writeAllMembers(List<Member> members) {
        try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(MEMBER_FILE), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING)) {
            for (Member member : members) {
                writer.write(String.join(",",
                    member.getId() != null ? member.getId().toString() : "",
                    member.getFirstName(),
                    member.getLastName(),
                    member.getEmail(),
                    member.getPhone(),
                    member.getDateOfBirth().toString(),
                    member.getAddress(),
                    member.getCurrentPlan().getName(),
                    member.getMembershipStartDate().toString(),
                    member.getMembershipEndDate().toString(),
                    member.getStatus()
                ));
                writer.newLine();
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to write members to file", e);
        }
    }
} 