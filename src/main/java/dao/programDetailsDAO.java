package dao;

import model.programDetails;
import java.util.*;

public class programDetailsDAO {
    private static List<programDetails> programs = new ArrayList<>();

    static {
        programs.add(new programDetails(1, "Strength Building", "Bodybuilding",
                "This program is designed to help beginners build foundational strength through progressive overload training and proper form.",
                "6 Months", "Saman Perera", "Beginner to Intermediate", "Compound lifts, strength progression, posture correction"));

        programs.add(new programDetails(2, "Crossfit", "Advanced",
                "A high-intensity program designed to push your limits using varied functional movements.",
                "10 Months", "Roshan Disanayaka", "Advanced", "Power, endurance, athletic conditioning"));

        programs.add(new programDetails(3, "Yoga & Meditation", "Basic",
                "This calming program combines yoga flows, stretching, breathwork, and guided meditation to improve flexibility, reduce stress, and boost mental clarity.",
                "3 Months", "Kumari Jayasinghe", "Beginner", "Flexibility, mindfulness, breath control"));

        programs.add(new programDetails(4, "Personal Training", "Custom",
                "One-on-one sessions with certified trainers to meet your specific fitness goals.",
                "Flexible", "Thilak Rathnayaka", "All Levels", "Tailored goals, personal coaching, flexible scheduling"));
    }

    public programDetails getProgramById(int id) {
        for (programDetails p : programs) {
            if (p.getId() == id) return p;
        }
        return null;
    }
}
