package com.fitnesscenter.membershipsystem.model;

public class User {
    private String username;
    private String password; // Encrypted password
    private String email;
    private String role; // "ADMIN", "TRAINER", "MEMBER"

    // Constructors
    public User() {}
    public User(String username, String password, String email, String role) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    // Getters and Setters (Encapsulation)
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }

    // To store in file
    @Override
    public String toString() {
        return username + "," + password + "," + email + "," + role;
    }
} 