package com.fitnesscenter.membershipsystem.servlet;

import java.io.IOException;

import com.fitnesscenter.membershipsystem.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/", "/home-after-login", "/admin-dashboard", "/member-dashboard", "/trainer-dashboard"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if ("/".equals(path)) {
            request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
        } else if ("/home-after-login".equals(path)) {
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                // Redirect to role-specific dashboard
                switch (user.getRole()) {
                    case "ADMIN":
                        response.sendRedirect(request.getContextPath() + "/admin-dashboard");
                        break;
                    case "MEMBER":
                        response.sendRedirect(request.getContextPath() + "/member-dashboard");
                        break;
                    case "TRAINER":
                        response.sendRedirect(request.getContextPath() + "/trainer-dashboard");
                        break;
                    default:
                        response.sendRedirect(request.getContextPath() + "/login");
                }
            }
        } else if ("/admin-dashboard".equals(path)) {
            if (user == null || !user.getRole().equals("ADMIN")) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("username", user.getUsername());
                request.getRequestDispatcher("/WEB-INF/views/admin-dashboard.jsp").forward(request, response);
            }
        } else if ("/member-dashboard".equals(path)) {
            if (user == null || !user.getRole().equals("MEMBER")) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("username", user.getUsername());
                request.getRequestDispatcher("/WEB-INF/views/member-dashboard.jsp").forward(request, response);
            }
        } else if ("/trainer-dashboard".equals(path)) {
            if (user == null || !user.getRole().equals("TRAINER")) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("username", user.getUsername());
                request.getRequestDispatcher("/WEB-INF/views/trainer-dashboard.jsp").forward(request, response);
            }
        }
    }
} 