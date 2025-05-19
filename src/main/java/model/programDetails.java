package model;

public class programDetails {
    private int id;
    private String name;
    private String topic;
    private String description;
    private String duration;
    private String trainer;
    private String level;
    private String focus;

    public programDetails(int id, String name, String topic, String description, String duration, String trainer, String level, String focus) {
        this.id = id;
        this.name = name;
        this.topic = topic;
        this.description = description;
        this.duration = duration;
        this.trainer = trainer;
        this.level = level;
        this.focus = focus;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getTopic() { return topic; }
    public String getDescription() { return description; }
    public String getDuration() { return duration; }
    public String getTrainer() { return trainer; }
    public String getLevel() { return level; }
    public String getFocus() { return focus; }
}
