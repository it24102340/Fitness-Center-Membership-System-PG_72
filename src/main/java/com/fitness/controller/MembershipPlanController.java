package com.fitness.controller;

import com.fitness.model.MembershipPlan;
import com.fitness.service.MembershipPlanService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(urlPatterns = {"/membership-plans", "/membership-plans/*"})
public class MembershipPlanController extends HttpServlet {
    private MembershipPlanService membershipPlanService = new MembershipPlanService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            // Hardcoded plans for file-based storage (no database) with IDs
            MembershipPlan basic = new MembershipPlan("Basic", "Access to gym equipment, Basic fitness assessment, Group classes (limited)", new BigDecimal("29.99"), 1, "BASIC");
            basic.setId(1L);
            MembershipPlan premium = new MembershipPlan("Premium", "All Basic features, Personal trainer sessions, Unlimited group classes, Nutrition consultation", new BigDecimal("49.99"), 3, "PREMIUM");
            premium.setId(2L);
            MembershipPlan elite = new MembershipPlan("Elite", "All Premium features, VIP lounge access, Spa & sauna access, Priority booking", new BigDecimal("79.99"), 12, "ELITE");
            elite.setId(3L);
            List<MembershipPlan> plans = List.of(basic, premium, elite);
            request.setAttribute("plans", plans);
            request.getRequestDispatcher("/WEB-INF/views/membership-plans/list.jsp").forward(request, response);
        } else if (pathInfo.equals("/new")) {
            // Show create form
            request.setAttribute("plan", new MembershipPlan());
            request.getRequestDispatcher("/WEB-INF/views/membership-plans/new.jsp").forward(request, response);
        } else if (pathInfo.startsWith("/edit/")) {
            // Show edit form
            Long id = Long.parseLong(pathInfo.substring("/edit/".length()));
            MembershipPlan plan = membershipPlanService.getPlanById(id);
            request.setAttribute("plan", plan);
            request.getRequestDispatcher("/WEB-INF/views/membership/plan-form.jsp").forward(request, response);
        } else if (pathInfo.startsWith("/delete/")) {
            // Delete plan
            Long id = Long.parseLong(pathInfo.substring("/delete/".length()));
            membershipPlanService.deletePlan(id);
            response.sendRedirect(request.getContextPath() + "/membership-plans");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            // Create new plan
            MembershipPlan plan = extractPlanFromRequest(request);
            membershipPlanService.savePlan(plan);
            response.sendRedirect(request.getContextPath() + "/membership-plans");
        } else if (pathInfo.startsWith("/edit/")) {
            // Update plan
            Long id = Long.parseLong(pathInfo.substring("/edit/".length()));
            MembershipPlan plan = extractPlanFromRequest(request);
            plan.setId(id);
            membershipPlanService.savePlan(plan);
            response.sendRedirect(request.getContextPath() + "/membership-plans");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private MembershipPlan extractPlanFromRequest(HttpServletRequest request) {
        MembershipPlan plan = new MembershipPlan();
        plan.setName(request.getParameter("name"));
        plan.setDescription(request.getParameter("description"));
        plan.setPrice(new java.math.BigDecimal(request.getParameter("price")));
        plan.setDurationInMonths(Integer.parseInt(request.getParameter("durationInMonths")));
        plan.setPlanType(request.getParameter("planType"));
        plan.setActive(true); // Default to active
        plan.setFeatures(request.getParameter("features") != null ? request.getParameter("features") : "");
        return plan;
    }
} 