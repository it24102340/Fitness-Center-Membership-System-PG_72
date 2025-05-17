package com.fitness.service;

import com.fitness.model.MembershipPlan;
import java.io.*;
import java.nio.file.*;
import java.util.stream.Collectors;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class MembershipPlanService {
    private static final String PLAN_FILE = "src/main/webapp/WEB-INF/data/plans.csv";

    public List<MembershipPlan> getAllPlans() {
        List<MembershipPlan> plans = new ArrayList<>();
        try (BufferedReader reader = Files.newBufferedReader(Paths.get(PLAN_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 7) {
                    MembershipPlan plan = new MembershipPlan();
                    plan.setId(Long.parseLong(parts[0]));
                    plan.setName(parts[1]);
                    plan.setDescription(parts[2]);
                    plan.setPrice(new java.math.BigDecimal(parts[3]));
                    plan.setDurationInMonths(Integer.parseInt(parts[4]));
                    plan.setPlanType(parts[5]);
                    plan.setFeatures(parts[6]);
                    plans.add(plan);
                }
            }
        } catch (IOException e) {
            // File may not exist yet
        }
        // Always ensure hardcoded plans are present
        List<MembershipPlan> hardcoded = new ArrayList<>();
        MembershipPlan basic = new MembershipPlan("Basic", "Access to gym equipment, Basic fitness assessment, Group classes (limited)", new java.math.BigDecimal("29.99"), 1, "BASIC");
        basic.setId(1L);
        MembershipPlan premium = new MembershipPlan("Premium", "All Basic features, Personal trainer sessions, Unlimited group classes, Nutrition consultation", new java.math.BigDecimal("49.99"), 3, "PREMIUM");
        premium.setId(2L);
        MembershipPlan elite = new MembershipPlan("Elite", "All Premium features, VIP lounge access, Spa & sauna access, Priority booking", new java.math.BigDecimal("79.99"), 12, "ELITE");
        elite.setId(3L);
        hardcoded.add(basic);
        hardcoded.add(premium);
        hardcoded.add(elite);
        for (MembershipPlan hc : hardcoded) {
            if (plans.stream().noneMatch(p -> p.getId().equals(hc.getId()))) {
                plans.add(hc);
            }
        }
        return plans;
    }

    public MembershipPlan getPlanById(Long id) {
        return getAllPlans().stream().filter(p -> p.getId().equals(id)).findFirst().orElse(null);
    }

    public void savePlan(MembershipPlan plan) {
        List<MembershipPlan> plans = getAllPlans();
        if (plan.getId() == null) {
            long newId = plans.stream().mapToLong(p -> p.getId() != null ? p.getId() : 0).max().orElse(0) + 1;
            plan.setId(newId);
            plans.add(plan);
        } else {
            for (int i = 0; i < plans.size(); i++) {
                if (plans.get(i).getId().equals(plan.getId())) {
                    plans.set(i, plan);
                    break;
                }
            }
        }
        writeAllPlans(plans);
    }

    public void deletePlan(Long id) {
        List<MembershipPlan> plans = getAllPlans().stream().filter(p -> !p.getId().equals(id)).collect(Collectors.toList());
        writeAllPlans(plans);
    }

    private void writeAllPlans(List<MembershipPlan> plans) {
        try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(PLAN_FILE), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING)) {
            for (MembershipPlan plan : plans) {
                writer.write(String.join(",",
                    plan.getId().toString(),
                    plan.getName(),
                    plan.getDescription(),
                    plan.getPrice().toString(),
                    plan.getDurationInMonths().toString(),
                    plan.getPlanType(),
                    plan.getFeatures()
                ));
                writer.newLine();
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to write plans to file", e);
        }
    }
} 