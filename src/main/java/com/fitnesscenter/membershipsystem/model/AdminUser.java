package com.fitnesscenter.membershipsystem.model;

public class AdminUser extends User {
    public AdminUser(String username, String password, String email) {
        super(username, password, email, "ADMIN");
    }
} 