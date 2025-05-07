package com.fitness.controller;

import com.fitness.model.MembershipPlan;
import com.fitness.service.MembershipPlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/membership-plans")
public class MembershipPlanController {

    @Autowired
    private MembershipPlanService membershipPlanService;

    @GetMapping
    public String listPlans(Model model) {
        model.addAttribute("plans", membershipPlanService.getAllPlans());
        return "membership-plans/list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("plan", new MembershipPlan());
        return "membership-plans/new";
    }

    @PostMapping
    public String createPlan(@ModelAttribute MembershipPlan plan) {
        membershipPlanService.savePlan(plan);
        return "redirect:/membership-plans";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("plan", membershipPlanService.getPlanById(id));
        return "membership/plan-form";
    }

    @PostMapping("/{id}")
    public String updatePlan(@PathVariable Long id, @ModelAttribute MembershipPlan plan) {
        plan.setId(id);
        membershipPlanService.savePlan(plan);
        return "redirect:/membership-plans";
    }

    @GetMapping("/delete/{id}")
    public String deletePlan(@PathVariable Long id) {
        membershipPlanService.deletePlan(id);
        return "redirect:/membership-plans";
    }
} 