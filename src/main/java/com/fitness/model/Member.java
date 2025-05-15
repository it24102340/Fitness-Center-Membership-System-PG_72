package com.fitness.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;
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
    
    @Column(nullable = false)
    private String firstName;
    
    @Column(nullable = false)
    private String lastName;
    
    @Column(nullable = false, unique = true)
    private String email;
    
    @Column(nullable = false)
    private String phone;
    
    @Column(nullable = false)
    private LocalDate dateOfBirth;
    
    @Column(nullable = false)
    private String address;
    
    @ManyToOne
    @JoinColumn(name = "current_plan_id")
    private MembershipPlan currentPlan;
    
    @Column(nullable = false)
    private String status = "ACTIVE";
    
    @OneToMany(mappedBy = "member")
    private List<MembershipHistory> membershipHistory = new ArrayList<>();
    
    @Column(nullable = false)
    private LocalDate joinDate = LocalDate.now();
    
    @Column
    private LocalDate lastRenewalDate;
    
    @Column
    private LocalDate expiryDate;
} 