package model;

public class Trainer {
    private String name;
    private String specialization;
    private String workout;

    public Trainer(String name, String specialization, String workout) {
        this.name = name;
        this.specialization = specialization;
        this.workout = workout;
    }

    public String getName() {
        return name;
    }

    public String getSpecialization() {
        return specialization;
    }

    public String getWorkout() {
        return workout;
    }
}
