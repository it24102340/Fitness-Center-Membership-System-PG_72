package com.fitness.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class MembershipPlan {
    private Long id;
    private String name;
    private String description;
    private BigDecimal price;
    private Integer durationInMonths;
    private boolean active = true;
    private List<Member> members = new ArrayList<>();
    private List<MembershipHistory> membershipHistory = new ArrayList<>();
    private String features;
    private String planType; // BASIC, STANDARD, PREMIUM, etc.

    public MembershipPlan() {
    }

    public MembershipPlan(String name, String description, BigDecimal price, int durationInMonths, String planType) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.durationInMonths = durationInMonths;
        this.planType = planType;
    }

    public MembershipPlan(String name, String description, BigDecimal price, int durationInMonths, boolean active, String planType) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.durationInMonths = durationInMonths;
        this.active = active;
        this.planType = planType;
    }

    // Getters
    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public Integer getDurationInMonths() {
        return durationInMonths;
    }

    public boolean isActive() {
        return active;
    }

    public List<Member> getMembers() {
        return members;
    }

    public List<MembershipHistory> getMembershipHistory() {
        return membershipHistory;
    }

    public String getFeatures() {
        return features;
    }

    public String getPlanType() {
        return planType;
    }

    // Setters
    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public void setDurationInMonths(Integer durationInMonths) {
        this.durationInMonths = durationInMonths;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public void setMembers(List<Member> members) {
        this.members = members;
    }

    public void setMembershipHistory(List<MembershipHistory> membershipHistory) {
        this.membershipHistory = membershipHistory;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public void setPlanType(String planType) {
        this.planType = planType;
    }
} 