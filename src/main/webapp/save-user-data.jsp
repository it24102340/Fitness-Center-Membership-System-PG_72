<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.file.*" %>
<%
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    
    try {
        // Read the request body
        StringBuilder buffer = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            buffer.append(line);
        }
        
        // Parse the JSON data
        JSONObject userData = new JSONObject(buffer.toString());
        
        // Path to the users.json file
        String filePath = application.getRealPath("/data/users.json");
        File file = new File(filePath);
        
        // Create directory if it doesn't exist
        file.getParentFile().mkdirs();
        
        // Read existing data
        JSONObject jsonData;
        if (file.exists()) {
            String content = new String(Files.readAllBytes(file.toPath()));
            jsonData = new JSONObject(content);
        } else {
            jsonData = new JSONObject();
            jsonData.put("users", new JSONArray());
        }
        
        // Add new user data
        JSONArray users = jsonData.getJSONArray("users");
        users.put(userData);
        
        // Write back to file
        Files.write(file.toPath(), jsonData.toString(4).getBytes());
        
        // Send success response
        JSONObject response = new JSONObject();
        response.put("success", true);
        out.print(response.toString());
        
    } catch (Exception e) {
        // Send error response
        JSONObject response = new JSONObject();
        response.put("success", false);
        response.put("error", e.getMessage());
        out.print(response.toString());
    }
%> 