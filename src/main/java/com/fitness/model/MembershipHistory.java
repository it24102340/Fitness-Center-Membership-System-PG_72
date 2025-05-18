package com.fitness.model;

import java.time.LocalDate;

public class MembershipHistory {
    private Long id;
    private Member member;
    private MembershipPlan plan;
    private LocalDate startDate;
    private LocalDate endDate;
    private LocalDate createdAt = LocalDate.now();

    public MembershipHistory() {
    }

    public MembershipHistory(Member member, MembershipPlan plan, LocalDate startDate, LocalDate endDate) {
        this.member = member;
        this.plan = plan;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    // Getters
    public Long getId() {
        return id;
    }

    public Member getMember() {
        return member;
    }

    public MembershipPlan getPlan() {
        return plan;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    // Setters
    public void setId(Long id) {
        this.id = id;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public void setPlan(MembershipPlan plan) {
        this.plan = plan;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }
} 