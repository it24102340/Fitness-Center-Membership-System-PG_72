package com.fitnesscenter.membershipsystem.model;

public class MemberUser extends User {
    public MemberUser(String username, String password, String email) {
        super(username, password, email, "MEMBER");
    }
} 