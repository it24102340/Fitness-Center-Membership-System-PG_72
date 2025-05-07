package com.fitness;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.beans.factory.annotation.Autowired;
import com.fitness.model.MembershipPlan;
import com.fitness.repository.MembershipPlanRepository;
import java.math.BigDecimal;

@SpringBootApplication
public class FitnessCenterApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(FitnessCenterApplication.class, args);
    }

    @Bean
    public CommandLineRunner loadSamplePlans(@Autowired MembershipPlanRepository planRepository) {
        return args -> {
            if (planRepository.count() == 0) {
                MembershipPlan basicPlan = new MembershipPlan("Basic", "Basic plan", new BigDecimal("29.99"), 1, true, "BASIC");
                basicPlan.setFeatures("Basic equipment access;Locker room access;Group classes");
                planRepository.save(basicPlan);

                MembershipPlan standardPlan = new MembershipPlan("Standard", "Standard plan", new BigDecimal("49.99"), 3, true, "STANDARD");
                standardPlan.setFeatures("All Basic features;Pool access;Spa access;Personal trainer consultation");
                planRepository.save(standardPlan);

                MembershipPlan premiumPlan = new MembershipPlan("Premium", "Premium plan", new BigDecimal("99.99"), 12, true, "PREMIUM");
                premiumPlan.setFeatures("All Standard features;Private training sessions;Nutrition consultation;Priority booking");
                planRepository.save(premiumPlan);
            }
        };
    }
}
