package com.fitnesscenter.membershipsystem.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.fitnesscenter.membershipsystem.model.User;

public class UserService {
    private final String USER_FILE = "src/main/resources/data/users.txt";

    // Create: Register a new user
    public void registerUser(User user) throws IOException {
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt())); // Encrypt password
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(USER_FILE, true))) {
            writer.write(user.toString());
            writer.newLine();
        }
    }

    // Read: Find user by username
    public User findUserByUsername(String username) throws IOException {
        List<User> users = loadUsers();
        for (User user : users) {
            if (user.getUsername().equals(username)) {
                return user;
            }
        }
        return null;
    }

    // Validate login
    public boolean validateLogin(String username, String password) throws IOException {
        User user = findUserByUsername(username);
        return user != null && BCrypt.checkpw(password, user.getPassword());
    }

    // Load all users from file
    private List<User> loadUsers() throws IOException {
        List<User> users = new ArrayList<>();
        File file = new File(USER_FILE);
        if (!file.exists()) file.createNewFile();
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 4) {
                    users.add(new User(parts[0], parts[1], parts[2], parts[3]));
                }
            }
        }
        return users;
    }
} 