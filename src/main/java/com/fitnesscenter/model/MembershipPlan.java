package com.fitnesscenter.model;

public class MembershipPlan {
    private int id;
    private String name;
    private int duration;
    private String description;
    private double price;
    private String planType;

    public MembershipPlan(int id, String name, int duration, String description, double price, String planType) {
        this.id = id;
        this.name = name;
        this.duration = duration;
        this.description = description;
        this.price = price;
        this.planType = planType;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public int getDuration() { return duration; }
    public String getDescription() { return description; }
    public double getPrice() { return price; }
    public String getPlanType() { return planType; }
} 