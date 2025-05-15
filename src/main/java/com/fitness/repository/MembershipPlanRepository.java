package com.fitness.repository;

import com.fitness.model.MembershipPlan;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

public class MembershipPlanRepository {
    private static final String DB_URL = "jdbc:h2:mem:fitnessdb";
    private static final String USER = "sa";
    private static final String PASS = "";

    public List<MembershipPlan> findAll() {
        List<MembershipPlan> plans = new ArrayList<>();
        String sql = "SELECT * FROM membership_plans WHERE active = true";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                MembershipPlan plan = new MembershipPlan();
                plan.setId(rs.getLong("id"));
                plan.setName(rs.getString("name"));
                plan.setDescription(rs.getString("description"));
                plan.setPrice(rs.getBigDecimal("price"));
                plan.setDurationInMonths(rs.getInt("duration_in_months"));
                plan.setActive(rs.getBoolean("active"));
                plan.setFeatures(rs.getString("features"));
                plan.setPlanType(rs.getString("plan_type"));
                plans.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return plans;
    }

    public MembershipPlan findById(Long id) {
        String sql = "SELECT * FROM membership_plans WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                MembershipPlan plan = new MembershipPlan();
                plan.setId(rs.getLong("id"));
                plan.setName(rs.getString("name"));
                plan.setDescription(rs.getString("description"));
                plan.setPrice(rs.getBigDecimal("price"));
                plan.setDurationInMonths(rs.getInt("duration_in_months"));
                plan.setActive(rs.getBoolean("active"));
                plan.setFeatures(rs.getString("features"));
                plan.setPlanType(rs.getString("plan_type"));
                return plan;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void save(MembershipPlan plan) {
        String sql = plan.getId() == null ?
            "INSERT INTO membership_plans (name, description, price, duration_in_months, active, features, plan_type) VALUES (?, ?, ?, ?, ?, ?, ?)" :
            "UPDATE membership_plans SET name = ?, description = ?, price = ?, duration_in_months = ?, active = ?, features = ?, plan_type = ? WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, plan.getName());
            pstmt.setString(2, plan.getDescription());
            pstmt.setBigDecimal(3, plan.getPrice());
            pstmt.setInt(4, plan.getDurationInMonths());
            pstmt.setBoolean(5, plan.isActive());
            pstmt.setString(6, plan.getFeatures());
            pstmt.setString(7, plan.getPlanType());
            
            if (plan.getId() != null) {
                pstmt.setLong(8, plan.getId());
            }
            
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(Long id) {
        String sql = "DELETE FROM membership_plans WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setLong(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} 