package com.fitness;

import com.fitness.model.Member;
import com.fitness.model.MembershipPlan;
import com.fitness.service.MembershipPlanService;
import com.fitness.service.MembershipService;

import java.time.LocalDate;

public class DemoUpgrade {
    public static void main(String[] args) {
        // NOTE: For demo purposes, this should be run in a servlet context to resolve the real path.
        String memberFilePath = "src/main/webapp/WEB-INF/data/members.csv";
        MembershipPlanService planService = new MembershipPlanService();
        MembershipService memberService = new MembershipService(memberFilePath);
        memberService.setMembershipPlanService(planService);

        // Get Basic and Premium plans
        MembershipPlan basic = planService.getAllPlans().stream()
            .filter(p -> "Basic".equalsIgnoreCase(p.getName()))
            .findFirst().orElse(null);
        MembershipPlan premium = planService.getAllPlans().stream()
            .filter(p -> "Premium".equalsIgnoreCase(p.getName()))
            .findFirst().orElse(null);

        if (basic == null || premium == null) {
            System.out.println("Basic or Premium plan not found. Please check your plans data.");
            return;
        }

        // Register a member to Basic
        Member member = memberService.subscribe(
            "John", "Doe", "john.doe@example.com", "1234567890",
            LocalDate.of(2000, 1, 1), "123 Main St", basic
        );
        System.out.println("Registered member: " + member);

        // Upgrade to Premium
        Member upgraded = memberService.upgradePlan(member.getId(), premium);
        System.out.println("Upgraded member: " + upgraded);
    }
} 