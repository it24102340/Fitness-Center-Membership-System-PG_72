package dao;

import model.Program;
import java.util.ArrayList;
import java.util.List;

public class ProgramDAO {

    public List<Program> getAllPrograms() {
        List<Program> programs = new ArrayList<>();

        programs.add(new Program(1, "Strength Building", "Bodybuilding",
                "Perfect for those new to fitness. Focus on form and building foundational strength.", "6 Months"));

        programs.add(new Program(2, "Crossfit", "Advanced",
                "Designed for muscle growth and strength development through targeted exercises.", "10 Months"));

        programs.add(new Program(3, "Yoga & Meditation", "Beginner",
                "High-intensity program for experienced athletes looking to push their limits.", "3 Months"));

        programs.add(new Program(4, "Personal Training", "Personalized",
                "One-on-one training tailored to your specific goals and fitness level.", "Varies"));

        return programs;
    }
}
