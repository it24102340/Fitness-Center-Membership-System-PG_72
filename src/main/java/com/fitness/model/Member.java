package com.fitness.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Member {
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private LocalDate dateOfBirth;
    private String address;
    private MembershipPlan currentPlan;
    private String status = "ACTIVE";
    private List<MembershipHistory> membershipHistory = new ArrayList<>();
    private LocalDate joinDate = LocalDate.now();
    private LocalDate lastRenewalDate;
    private LocalDate expiryDate;

    public Member() {
    }

    // Getters
    public Long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public MembershipPlan getCurrentPlan() {
        return currentPlan;
    }

    public String getStatus() {
        return status;
    }

    public List<MembershipHistory> getMembershipHistory() {
        return membershipHistory;
    }

    public LocalDate getJoinDate() {
        return joinDate;
    }

    public LocalDate getLastRenewalDate() {
        return lastRenewalDate;
    }

    public LocalDate getExpiryDate() {
        return expiryDate;
    }

    // Setters
    public void setId(Long id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCurrentPlan(MembershipPlan currentPlan) {
        this.currentPlan = currentPlan;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setMembershipHistory(List<MembershipHistory> membershipHistory) {
        this.membershipHistory = membershipHistory;
    }

    public void setJoinDate(LocalDate joinDate) {
        this.joinDate = joinDate;
    }

    public void setLastRenewalDate(LocalDate lastRenewalDate) {
        this.lastRenewalDate = lastRenewalDate;
    }

    public void setExpiryDate(LocalDate expiryDate) {
        this.expiryDate = expiryDate;
    }

    // Method to generate next ID
    public static Long generateNextId() {
        List<Member> members = com.fitness.util.CSVUtil.loadMembers();
        if (members.isEmpty()) {
            return 1L;
        }
        return members.stream()
                .mapToLong(Member::getId)
                .max()
                .orElse(0L) + 1;
    }
} 