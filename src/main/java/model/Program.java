package model;

public class Program {
    private int id;
    private String name;
    private String category;
    private String description;
    private String duration;

    public Program(int id, String name, String category, String description, String duration) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.duration = duration;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getCategory() { return category; }
    public String getDescription() { return description; }
    public String getDuration() { return duration; }
}
