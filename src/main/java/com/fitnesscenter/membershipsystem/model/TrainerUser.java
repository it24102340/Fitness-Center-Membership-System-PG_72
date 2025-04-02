package com.fitnesscenter.membershipsystem.model;

public class TrainerUser extends User {
    public TrainerUser(String username, String password, String email) {
        super(username, password, email, "TRAINER");
    }
} 