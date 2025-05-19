package dao;

import model.Registration;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class RegistrationDAO {
    private static final String FILE_PATH = "C:\\Users\\User\\Desktop\\New folder (3)\\registrations.txt";

    // Save new registration (append mode)
    public void saveRegistration(Registration reg) throws IOException {
        try (FileWriter writer = new FileWriter(FILE_PATH, true);
             BufferedWriter bw = new BufferedWriter(writer)) {
            String line = reg.getProgramId() + "," + reg.getName() + "," + reg.getEmail() + "," + reg.getPhone() + "," +
                    reg.getAge() + "," + reg.getGender() + "," + reg.getWeight();
            bw.write(line);
            bw.newLine();
        }
    }

    // Read all registrations from file
    public List<Registration> getAllRegistrations() throws IOException {
        List<Registration> list = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) {
            return list; // empty list if file doesn't exist
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;

            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 7) {
                    // Use constructor that parses age and weight
                    Registration reg = new Registration(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6]);
                    list.add(reg);
                }
            }
        }
        return list;
    }

    // Update existing registration by programId and email (assuming email is unique identifier)
    public boolean updateRegistration(Registration updatedReg) throws IOException {
        List<Registration> list = getAllRegistrations();
        boolean updated = false;

        for (int i = 0; i < list.size(); i++) {
            Registration reg = list.get(i);
            // Assuming unique registration identified by programId + email combo
            if (reg.getProgramId().equals(updatedReg.getProgramId()) && reg.getEmail().equals(updatedReg.getEmail())) {
                list.set(i, updatedReg);
                updated = true;
                break;
            }
        }

        if (updated) {
            overwriteFile(list);
        }
        return updated;
    }

    // Delete registration by programId and email
    public boolean deleteRegistration(String programId, String email) throws IOException {
        List<Registration> list = getAllRegistrations();
        boolean deleted = list.removeIf(reg -> reg.getProgramId().equals(programId) && reg.getEmail().equals(email));

        if (deleted) {
            overwriteFile(list);
        }
        return deleted;
    }

    // Helper method to overwrite the whole file with given list
    private void overwriteFile(List<Registration> list) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (Registration reg : list) {
                String line = reg.getProgramId() + "," + reg.getName() + "," + reg.getEmail() + "," + reg.getPhone() + "," +
                        reg.getAge() + "," + reg.getGender() + "," + reg.getWeight();
                bw.write(line);
                bw.newLine();
            }
        }
    }
}
