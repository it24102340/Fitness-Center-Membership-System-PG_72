package model;

public class Registration {
    private String programId;
    private String name;
    private String email;
    private String phone;
    private int age;
    private String gender;
    private double weight;

    // Constructor with typed parameters
    public Registration(String programId, String name, String email, String phone, int age, String gender, double weight) {
        this.programId = programId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.age = age;
        this.gender = gender;
        this.weight = weight;
    }

    // Constructor with all String parameters, converts age and weight internally
    public Registration(String programId, String name, String email, String phone, String ageStr, String gender, String weightStr) {
        this.programId = programId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.age = Integer.parseInt(ageStr);
        this.gender = gender;
        this.weight = Double.parseDouble(weightStr);
    }

    // Getters and setters

    public String getProgramId() {
        return programId;
    }

    public void setProgramId(String programId) {
        this.programId = programId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }
}
