package com.fitness.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "membership_plans")
@Data
@NoArgsConstructor
public class MembershipPlan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank(message = "Plan name is required")
    @Column(nullable = false)
    private String name;
    
    @NotBlank(message = "Plan description is required")
    @Column(nullable = false, length = 1000)
    private String description;
    
    @NotNull(message = "Plan price is required")
    @Positive(message = "Plan price must be positive")
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal price;
    
    @NotNull(message = "Duration is required")
    @Positive(message = "Duration must be positive")
    @Column(nullable = false)
    private Integer durationInMonths;
    
    @Column(nullable = false)
    private boolean active = true;
    
    @OneToMany(mappedBy = "currentPlan")
    private List<Member> members = new ArrayList<>();
    
    @OneToMany(mappedBy = "plan")
    private List<MembershipHistory> membershipHistory = new ArrayList<>();
    
    @Column(nullable = false)
    private String features;
    
    @Column(nullable = false)
    private String planType; // BASIC, STANDARD, PREMIUM, etc.
    
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
} 