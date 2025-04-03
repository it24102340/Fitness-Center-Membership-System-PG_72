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
    public User registerUser(String username, String password, String email, String role) {
        try {
            // Check if username already exists
            if (findUserByUsername(username) != null) {
                return null;
            }

            // Create new user with hashed password
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            User user = new User(username, hashedPassword, email, role);
            
            // Save user to file
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(USER_FILE, true))) {
                writer.write(String.format("%s,%s,%s,%s", username, hashedPassword, email, role));
                writer.newLine();
            }
            
            return user;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Read: Find user by username
    public User findUserByUsername(String username) {
        try {
            List<User> users = loadUsers();
            for (User user : users) {
                if (user.getUsername().equals(username)) {
                    return user;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Validate login and return user if valid
    public User validateLogin(String username, String password) {
        try {
            User user = findUserByUsername(username);
            if (user != null && BCrypt.checkpw(password, user.getPassword())) {
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Load all users from file
    private List<User> loadUsers() throws IOException {
        List<User> users = new ArrayList<>();
        File file = new File(USER_FILE);
        if (!file.exists()) {
            file.getParentFile().mkdirs();
            file.createNewFile();
        }
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