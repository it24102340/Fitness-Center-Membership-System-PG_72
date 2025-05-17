package com.fitness.service;

import com.fitness.model.Member;
import com.fitness.model.MembershipPlan;
import com.fitness.repository.MemberRepository;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class MembershipService {
    private final MemberRepository memberRepository;
    private MembershipPlanService membershipPlanService;

    public MembershipService(String memberFilePath) {
        this.memberRepository = new MemberRepository(memberFilePath);
    }

    public void setMembershipPlanService(MembershipPlanService membershipPlanService) {
        this.membershipPlanService = membershipPlanService;
        this.memberRepository.setMembershipPlanService(membershipPlanService);
    }

    public Member subscribe(String firstName, String lastName, String email, String phone, 
                          LocalDate dateOfBirth, String address, MembershipPlan plan) {
        Member member = new Member();
        member.setFirstName(firstName);
        member.setLastName(lastName);
        member.setEmail(email);
        member.setPhone(phone);
        member.setDateOfBirth(dateOfBirth);
        member.setAddress(address);
        member.setCurrentPlan(plan);
        member.setJoinDate(LocalDate.now());
        member.setStatus("ACTIVE");
        
        if (plan != null && plan.getDurationInMonths() != null) {
            member.setExpiryDate(LocalDate.now().plusMonths(plan.getDurationInMonths()));
        }
        
        System.out.println("[DEBUG] Registering member: " + firstName + " " + lastName + ", Email: " + email + ", Plan: " + (plan != null ? plan.getName() : "None"));
        memberRepository.save(member);
        return member;
    }

    public Member upgradePlan(Long memberId, MembershipPlan newPlan) {
        Optional<Member> memberOpt = memberRepository.findAll().stream()
            .filter(m -> m.getId().equals(memberId))
            .findFirst();
            
        if (memberOpt.isPresent()) {
            Member member = memberOpt.get();
            member.setCurrentPlan(newPlan);
            if (newPlan != null && newPlan.getDurationInMonths() != null) {
                member.setExpiryDate(LocalDate.now().plusMonths(newPlan.getDurationInMonths()));
            }
            memberRepository.save(member);
            return member;
        }
        return null;
    }

    public List<Member> getAllMembers() {
        return memberRepository.findAll();
    }

    public Optional<Member> getMemberByEmail(String email) {
        return memberRepository.findByEmail(email);
    }

    public void saveMember(Member member) {
        memberRepository.save(member);
    }

    public void deleteMember(String email) {
        memberRepository.delete(email);
    }

    public boolean isMemberActive(String email) {
        return memberRepository.findByEmail(email)
                .map(member -> "active".equalsIgnoreCase(member.getStatus()))
                .orElse(false);
    }

    public void updateMembershipStatuses() {
        LocalDate now = LocalDate.now();
        List<Member> members = memberRepository.findAll();
        
        members.stream()
            .filter(m -> m.getExpiryDate() != null && 
                        m.getExpiryDate().isBefore(now) && 
                        "ACTIVE".equalsIgnoreCase(m.getStatus()))
            .forEach(member -> {
                member.setStatus("EXPIRED");
                memberRepository.save(member);
            });
    }
} 