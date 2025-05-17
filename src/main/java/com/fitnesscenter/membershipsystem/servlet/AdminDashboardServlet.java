package com.fitnesscenter.membershipsystem.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin-dashboard")
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Check if admin is logged in
        Boolean isAdminLoggedIn = (Boolean) request.getSession().getAttribute("adminLoggedIn");
        if (isAdminLoggedIn == null || !isAdminLoggedIn) {
            response.sendRedirect("admin-login.jsp");
            return;
        }

        // Forward to admin dashboard JSP
        request.getRequestDispatcher("/WEB-INF/views/admin-dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Handle any POST requests if needed
        doGet(request, response);
    }
} 