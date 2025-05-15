package com.fitness.model;

import jakarta.persistence.*;
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
    
    @Column(nullable = false)
    private String name;
    
    @Column(nullable = false, length = 1000)
    private String description;
    
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal price;
    
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