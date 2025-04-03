package com.fitnesscenter.membershipsystem.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/courses/*", "/admin/*", "/trainer/*", "/auth/admin-login", "/auth/trainer-login"})
public class AuthenticationFilter implements Filter {
    private static final Map<String, String> ADMIN_CREDENTIALS = new HashMap<>();
    private static final Map<String, String> TRAINER_CREDENTIALS = new HashMap<>();
    
    static {
        // Admin credentials
        ADMIN_CREDENTIALS.put("Admin1", "232820Ns$");
        ADMIN_CREDENTIALS.put("Admin2", "232820Ns$#");
        
        // Trainer credentials
        TRAINER_CREDENTIALS.put("GYMTR1", "232820Ns$#");
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        String requestURI = httpRequest.getRequestURI();

        // Handle admin login attempt
        if (requestURI.endsWith("/auth/admin-login") && "POST".equalsIgnoreCase(httpRequest.getMethod())) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            if (validateAdminCredentials(username, password)) {
                session = httpRequest.getSession(true);
                session.setAttribute("username", username);
                session.setAttribute("role", "ADMIN");
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin/dashboard");
                return;
            } else {
                request.setAttribute("error", "Invalid admin credentials. Please try again.");
                request.getRequestDispatcher("/admin-login.jsp").forward(request, response);
                return;
            }
        }

        // Handle trainer login attempt
        if (requestURI.endsWith("/auth/trainer-login") && "POST".equalsIgnoreCase(httpRequest.getMethod())) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            if (validateTrainerCredentials(username, password)) {
                session = httpRequest.getSession(true);
                session.setAttribute("username", username);
                session.setAttribute("role", "TRAINER");
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/trainer/dashboard");
                return;
            } else {
                request.setAttribute("error", "Invalid trainer credentials. Please try again.");
                request.getRequestDispatcher("/trainer-login.jsp").forward(request, response);
                return;
            }
        }

        boolean isLoggedIn = (session != null && session.getAttribute("username") != null);
        boolean isAdminPath = requestURI.startsWith(httpRequest.getContextPath() + "/admin/");
        boolean isTrainerPath = requestURI.startsWith(httpRequest.getContextPath() + "/trainer/");

        if (isLoggedIn) {
            String username = (String) session.getAttribute("username");
            String role = (String) session.getAttribute("role");
            
            if (isAdminPath && !"ADMIN".equals(role)) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin-login.jsp?error=unauthorized");
                return;
            }
            
            if (isTrainerPath && !"TRAINER".equals(role)) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/trainer-login.jsp?error=unauthorized");
                return;
            }
            
            chain.doFilter(request, response);
        } else {
            if (isAdminPath) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin-login.jsp");
            } else if (isTrainerPath) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/trainer-login.jsp");
            } else {
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
    }

    public static boolean validateAdminCredentials(String username, String password) {
        return ADMIN_CREDENTIALS.containsKey(username) && 
               ADMIN_CREDENTIALS.get(username).equals(password);
    }

    public static boolean validateTrainerCredentials(String username, String password) {
        return TRAINER_CREDENTIALS.containsKey(username) && 
               TRAINER_CREDENTIALS.get(username).equals(password);
    }
} 