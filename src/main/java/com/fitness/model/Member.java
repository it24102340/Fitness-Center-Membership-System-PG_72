package com.fitness.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "members")
@Data
@NoArgsConstructor
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank(message = "First name is required")
    @Column(nullable = false)
    private String firstName;
    
    @NotBlank(message = "Last name is required")
    @Column(nullable = false)
    private String lastName;
    
    @NotBlank(message = "Email is required")
    @Email(message = "Invalid email format")
    @Column(nullable = false, unique = true)
    private String email;
    
    @NotBlank(message = "Phone number is required")
    @Pattern(regexp = "^\\+?[1-9]\\d{1,14}$", message = "Invalid phone number format")
    @Column(nullable = false)
    private String phone;
    
    @NotNull(message = "Date of birth is required")
    @Column(nullable = false)
    private LocalDate dateOfBirth;
    
    @NotBlank(message = "Address is required")
    @Column(nullable = false)
    private String address;
    
    @NotNull(message = "Membership plan is required")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "plan_id", nullable = false)
    private MembershipPlan currentPlan;
    
    @NotNull(message = "Membership start date is required")
    @Column(nullable = false)
    private LocalDate membershipStartDate;
    
    @NotNull(message = "Membership end date is required")
    @Column(nullable = false)
    private LocalDate membershipEndDate;
    
    @Column(nullable = false)
    private String status; // ACTIVE, EXPIRED, CANCELLED
    
    @OneToMany(mappedBy = "member", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<MembershipHistory> membershipHistory = new ArrayList<>();
    
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal balance = BigDecimal.ZERO;

    public Member(String firstName, String lastName, String email, String phone, LocalDate dateOfBirth, String address, 
                 MembershipPlan currentPlan, LocalDate membershipStartDate, LocalDate membershipEndDate) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.currentPlan = currentPlan;
        this.membershipStartDate = membershipStartDate;
        this.membershipEndDate = membershipEndDate;
    }

    // Helper method to check if membership is active
    public boolean isActive() {
        return "ACTIVE".equals(this.status);
    }

    // Helper method to check if membership is expired
    public boolean isExpired() {
        return "EXPIRED".equals(this.status);
    }

    // Helper method to check if membership is cancelled
    public boolean isCancelled() {
        return "CANCELLED".equals(this.status);
    }

    // Helper method to get formatted dates
    public String getFormattedStartDate() {
        return membershipStartDate != null ? membershipStartDate.toString() : "";
    }

    public String getFormattedEndDate() {
        return membershipEndDate != null ? membershipEndDate.toString() : "";
    }

    // Helper method to get membership duration in days
    public long getMembershipDurationInDays() {
        if (membershipStartDate != null && membershipEndDate != null) {
            return ChronoUnit.DAYS.between(membershipStartDate, membershipEndDate);
        }
        return 0;
    }

    // Helper method to get days remaining in membership
    public long getDaysRemaining() {
        if (membershipEndDate != null) {
            return ChronoUnit.DAYS.between(LocalDate.now(), membershipEndDate);
        }
        return 0;
    }

    // Helper method to add membership history
    public void addMembershipHistory(MembershipPlan plan, LocalDate startDate, LocalDate endDate) {
        MembershipHistory history = new MembershipHistory(this, plan, startDate, endDate);
        membershipHistory.add(history);
    }
} 