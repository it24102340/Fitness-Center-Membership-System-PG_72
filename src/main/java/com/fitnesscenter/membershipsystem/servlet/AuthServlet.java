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

@WebServlet(urlPatterns = {"/auth/signup", "/auth/login", "/auth/signup-success"})
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
        if ("/auth/signup".equals(path)) {
            request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
        } else if ("/auth/login".equals(path)) {
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        } else if ("/auth/signup-success".equals(path)) {
            request.getRequestDispatcher("/WEB-INF/views/signup-success.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/auth/signup".equals(path)) {
            handleSignup(request, response);
        } else if ("/auth/login".equals(path)) {
            handleLogin(request, response);
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            // Validate input
            if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                request.setAttribute("error", "Username and password are required");
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
                return;
            }

            User user = userService.validateLogin(username, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRole());
                
                // Redirect based on role
                switch (user.getRole()) {
                    case "ADMIN":
                        response.sendRedirect(request.getContextPath() + "/admin-dashboard");
                        break;
                    case "TRAINER":
                        response.sendRedirect(request.getContextPath() + "/trainer-dashboard");
                        break;
                    case "MEMBER":
                        response.sendRedirect(request.getContextPath() + "/member-dashboard");
                        break;
                    default:
                        response.sendRedirect(request.getContextPath() + "/");
                }
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Login failed: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }

    private void handleSignup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        
        try {
            // Validate input
            if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                role == null || role.trim().isEmpty()) {
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
                return;
            }

            // Check if username already exists
            if (userService.findUserByUsername(username) != null) {
                request.setAttribute("error", "Username already exists");
                request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
                return;
            }

            User user = userService.registerUser(username, password, email, role);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRole());
                
                // Redirect based on role after signup
                switch (role) {
                    case "ADMIN":
                        response.sendRedirect(request.getContextPath() + "/admin-dashboard");
                        break;
                    case "TRAINER":
                        response.sendRedirect(request.getContextPath() + "/trainer-dashboard");
                        break;
                    case "MEMBER":
                        response.sendRedirect(request.getContextPath() + "/member-dashboard");
                        break;
                    default:
                        response.sendRedirect(request.getContextPath() + "/");
                }
            } else {
                request.setAttribute("error", "Registration failed");
                request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Registration failed: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
        }
    }
} 