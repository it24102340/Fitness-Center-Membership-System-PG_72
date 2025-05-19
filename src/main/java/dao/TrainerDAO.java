package dao;

import model.Trainer;
import java.util.ArrayList;
import java.util.List;

public class TrainerDAO {
    public List<Trainer> getAllTrainers() {
        List<Trainer> trainers = new ArrayList<>();

        trainers.add(new Trainer("Saman Perera", "Strength Training", "Strength Building"));
        trainers.add(new Trainer("Roshan Disanayaka", "Weight Loss", "CrossFit"));
        trainers.add(new Trainer("Kumari jayasighe", "Cardio", "Yoga & Meditation"));
        trainers.add(new Trainer("Thilak Rathayaka", "Flexibility", "Personal Training"));

        return trainers;
    }
}
