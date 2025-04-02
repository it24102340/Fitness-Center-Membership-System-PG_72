package com.fitnesscenter.membershipsystem.servlet;

import java.io.File;
import java.io.IOException;

import com.fitnesscenter.membershipsystem.model.User;
import com.fitnesscenter.membershipsystem.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/signup", "/login", "/logout", "/signup-success"})
public class AuthServlet extends HttpServlet {
    private UserService userService;
    private static final String DATA_DIR = "src/main/resources/data";

    @Override
    public void init() throws ServletException {
        userService = new UserService();
        // Ensure data directory exists
        File dataDir = new File(DATA_DIR);
        if (!dataDir.exists()) {
            if (!dataDir.mkdirs()) {
                throw new ServletException("Failed to create data directory");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/signup".equals(path)) {
            request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
        } else if ("/login".equals(path)) {
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        } else if ("/logout".equals(path)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/");
        } else if ("/signup-success".equals(path)) {
            request.getRequestDispatcher("/WEB-INF/views/signup-success.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/signup".equals(path)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String role = request.getParameter("role");

            // Validate input
            if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                role == null || role.trim().isEmpty()) {
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
                return;
            }

            User user = new User(username, password, email, role);
            try {
                // Check if username already exists
                if (userService.findUserByUsername(username) != null) {
                    request.setAttribute("error", "Username already exists");
                    request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
                    return;
                }

                userService.registerUser(user);
                response.sendRedirect(request.getContextPath() + "/signup-success");
            } catch (IOException e) {
                request.setAttribute("error", "Error registering user: " + e.getMessage());
                request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
            }
        } else if ("/login".equals(path)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try {
                if (userService.validateLogin(username, password)) {
                    User user = userService.findUserByUsername(username);
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user); // Session management
                    response.sendRedirect(request.getContextPath() + "/home-after-login");
                } else {
                    request.setAttribute("error", "Invalid credentials");
                    request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
                }
            } catch (IOException e) {
                request.setAttribute("error", "Error during login: " + e.getMessage());
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            }
        }
    }
} 