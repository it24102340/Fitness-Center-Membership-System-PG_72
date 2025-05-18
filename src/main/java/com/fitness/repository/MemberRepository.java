package com.fitness.repository;

import com.fitness.model.Member;
import com.fitness.model.MembershipPlan;
import com.fitness.service.MembershipPlanService;
import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class MemberRepository {
    private final String filePath;
    private static final String CSV_HEADER = "id,firstName,lastName,email,phone,dateOfBirth,address,planId,planType,joinDate,expiryDate,status";
    private MembershipPlanService membershipPlanService;

    public MemberRepository(String filePath) {
        this.filePath = filePath;
        System.out.println("MemberRepository using file: " + new File(filePath).getAbsolutePath());
        createFileIfNotExists();
    }

    public void setMembershipPlanService(MembershipPlanService membershipPlanService) {
        this.membershipPlanService = membershipPlanService;
    }

    private void createFileIfNotExists() {
        File file = new File(filePath);
        if (!file.exists()) {
            try {
                if (file.getParentFile() != null) file.getParentFile().mkdirs();
                try (PrintWriter writer = new PrintWriter(new FileWriter(file))) {
                    writer.println(CSV_HEADER);
                }
            } catch (IOException e) {
                System.err.println("Failed to create members.csv at " + file.getAbsolutePath());
                e.printStackTrace();
                throw new RuntimeException("Failed to create members.csv", e);
            }
        }
    }

    public List<Member> findAll() {
        List<Member> members = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            boolean isFirstLine = true;
            while ((line = reader.readLine()) != null) {
                if (isFirstLine) {
                    isFirstLine = false;
                    continue;
                }
                String[] data = line.split(",", -1);
                if (data.length >= 12) {
                    Member member = new Member();
                    member.setId(Long.parseLong(data[0]));
                    member.setFirstName(data[1]);
                    member.setLastName(data[2]);
                    member.setEmail(data[3]);
                    member.setPhone(data[4]);
                    member.setDateOfBirth(LocalDate.parse(data[5]));
                    member.setAddress(data[6]);
                    MembershipPlan plan = null;
                    if ((data[7] != null && !data[7].isEmpty()) || (data[8] != null && !data[8].isEmpty())) {
                        plan = new MembershipPlan();
                        if (data[7] != null && !data[7].isEmpty()) {
                            try {
                                plan.setId(Long.parseLong(data[7]));
                            } catch (NumberFormatException e) {
                                plan.setId(null);
                            }
                        }
                        if (data[8] != null && !data[8].isEmpty()) {
                            plan.setPlanType(data[8]);
                        }
                        if (membershipPlanService != null && plan.getId() != null) {
                            MembershipPlan fullPlan = membershipPlanService.getPlanById(plan.getId());
                            if (fullPlan != null) {
                                plan.setName(fullPlan.getName());
                                plan.setDescription(fullPlan.getDescription());
                                plan.setPrice(fullPlan.getPrice());
                                plan.setDurationInMonths(fullPlan.getDurationInMonths());
                                plan.setActive(fullPlan.isActive());
                                plan.setFeatures(fullPlan.getFeatures());
                            }
                        }
                    }
                    member.setCurrentPlan(plan);
                    member.setJoinDate(LocalDate.parse(data[9]));
                    member.setExpiryDate(LocalDate.parse(data[10]));
                    member.setStatus(data[11]);
                    members.add(member);
                }
            }
        } catch (IOException e) {
            System.err.println("Failed to read members.csv at " + new File(filePath).getAbsolutePath());
            e.printStackTrace();
            throw new RuntimeException("Failed to read members.csv", e);
        }
        System.out.println("[DEBUG] Loaded " + members.size() + " members from " + new File(filePath).getAbsolutePath());
        for (Member m : members) {
            System.out.println("[DEBUG] Member: ID=" + m.getId() + ", Email=" + m.getEmail() + ", PlanId=" + (m.getCurrentPlan() != null ? m.getCurrentPlan().getId() : "None") + ", PlanType=" + (m.getCurrentPlan() != null ? m.getCurrentPlan().getPlanType() : "None"));
        }
        return members;
    }

    public Optional<Member> findByEmail(String email) {
        System.out.println("[DEBUG] Looking up member by email: " + email);
        return findAll().stream()
                .filter(member -> member.getEmail().equalsIgnoreCase(email))
                .findFirst();
    }

    public Optional<Member> findById(Long id) {
        System.out.println("[DEBUG] Looking up member by ID: " + id);
        return findAll().stream()
                .filter(member -> member.getId() != null && member.getId().equals(id))
                .findFirst();
    }

    public void save(Member member) {
        List<Member> members = findAll();
        boolean exists = false;
        for (int i = 0; i < members.size(); i++) {
            if (members.get(i).getId() != null && members.get(i).getId().equals(member.getId())) {
                members.set(i, member);
                exists = true;
                break;
            }
        }
        if (!exists) {
            // Generate new ID if member is new
            long newId = members.stream()
                    .mapToLong(m -> m.getId() != null ? m.getId() : 0)
                    .max()
                    .orElse(0) + 1;
            member.setId(newId);
            members.add(member);
        }
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
            writer.println(CSV_HEADER);
            for (Member m : members) {
                writer.println(String.join(",",
                    m.getId() != null ? m.getId().toString() : "",
                    m.getFirstName(),
                    m.getLastName(),
                    m.getEmail(),
                    m.getPhone(),
                    m.getDateOfBirth() != null ? m.getDateOfBirth().toString() : "",
                    m.getAddress(),
                    m.getCurrentPlan() != null && m.getCurrentPlan().getId() != null ? m.getCurrentPlan().getId().toString() : "",
                    m.getCurrentPlan() != null && m.getCurrentPlan().getPlanType() != null ? m.getCurrentPlan().getPlanType() : "",
                    m.getJoinDate() != null ? m.getJoinDate().toString() : "",
                    m.getExpiryDate() != null ? m.getExpiryDate().toString() : "",
                    m.getStatus()
                ));
            }
        } catch (IOException e) {
            System.err.println("Failed to save member to file at " + new File(filePath).getAbsolutePath());
            e.printStackTrace();
            throw new RuntimeException("Failed to save member to file", e);
        }
    }

    public void delete(String email) {
        List<Member> members = findAll();
        members.removeIf(member -> member.getEmail().equalsIgnoreCase(email));
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
            writer.println(CSV_HEADER);
            for (Member m : members) {
                writer.println(String.join(",",
                    m.getId() != null ? m.getId().toString() : "",
                    m.getFirstName(),
                    m.getLastName(),
                    m.getEmail(),
                    m.getPhone(),
                    m.getDateOfBirth() != null ? m.getDateOfBirth().toString() : "",
                    m.getAddress(),
                    m.getCurrentPlan() != null && m.getCurrentPlan().getId() != null ? m.getCurrentPlan().getId().toString() : "",
                    m.getCurrentPlan() != null && m.getCurrentPlan().getPlanType() != null ? m.getCurrentPlan().getPlanType() : "",
                    m.getJoinDate() != null ? m.getJoinDate().toString() : "",
                    m.getExpiryDate() != null ? m.getExpiryDate().toString() : "",
                    m.getStatus()
                ));
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to delete member from file", e);
        }
    }
} 