package com.fitness.controller;

import com.fitness.model.Member;
import com.fitness.service.MembershipService;
import com.fitness.service.MembershipPlanService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet(urlPatterns = {"/membership/cancel/*"})
public class MembershipCancelServlet extends HttpServlet {
    
    private MembershipService membershipService;
    private MembershipPlanService membershipPlanService;
    
    @Override
    public void init() throws ServletException {
        String memberFilePath = getServletContext().getRealPath("/WEB-INF/data/members.csv");
        membershipPlanService = new MembershipPlanService();
        membershipService = new MembershipService(memberFilePath);
        membershipService.setMembershipPlanService(membershipPlanService);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            request.setAttribute("error", "Invalid member ID.");
            response.sendRedirect(request.getContextPath() + "/membership/status");
            return;
        }
        
        try {
            Long memberId = Long.parseLong(pathInfo.substring(1));
            Optional<Member> memberOpt = membershipService.getAllMembers().stream()
                .filter(m -> m.getId() != null && m.getId().equals(memberId))
                .findFirst();

            if (!memberOpt.isPresent()) {
                request.setAttribute("error", "Member not found.");
                response.sendRedirect(request.getContextPath() + "/membership/status");
                return;
            }
            Member member = memberOpt.get();
            member.setStatus("CANCELLED");
            membershipService.saveMember(member);
            request.setAttribute("success", "Your membership has been cancelled.");
            response.sendRedirect(request.getContextPath() + "/membership/status?email=" + member.getEmail());
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid member ID format.");
            response.sendRedirect(request.getContextPath() + "/membership/status");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while cancelling the membership: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/membership/status");
        }
    }
} 