<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Trainer" %>
<%@ page import="dao.TrainerDAO" %>
<%
    TrainerDAO dao = new TrainerDAO();
    List<Trainer> trainers = dao.getAllTrainers();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Our Trainers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 960px;
            margin: 40px auto;
            padding: 0 20px;
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }
        .trainer-box {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 220px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease;
        }
        .trainer-box:hover {
            transform: translateY(-8px);
        }
        .trainer-image {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 4px solid #007bff;
        }
        h3 {
            margin: 10px 0 5px;
            font-size: 20px;
            color: #2d2f48;
        }
        p {
            margin: 0;
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>

<h1 style="text-align:center; margin-top: 40px; color: #007bff;">Meet Our Trainers</h1>

<div class="container">
    <%-- Strength Building Trainer --%>
    <div class="trainer-box">
        <img src="https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=500&auto=format&fit=crop"
             alt="Strength Training" class="trainer-image"/>
        <h3>Saman Perera</h3>
        <p><strong>Workout:</strong> Strength Building</p>
        <p>Specialization: Strength Training</p>
    </div>

    <%-- CrossFit Trainer --%>
    <div class="trainer-box">
        <img src="https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=500&auto=format&fit=crop"
             alt="CrossFit Training" class="trainer-image"/>
        <h3>Roshan Disanayaka</h3>
        <p><strong>Workout:</strong> CrossFit</p>
        <p>Specialization: Weight Loss</p>
    </div>

    <%-- Yoga & Meditation Trainer --%>
    <div class="trainer-box">
        <img src="https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=500&auto=format&fit=crop"
             alt="Yoga & Meditation" class="trainer-image"/>
        <h3>Kumari Jayasinghe</h3>
        <p><strong>Workout:</strong> Yoga & Meditation</p>
        <p>Specialization: Cardio</p>
    </div>

    <%-- Personal Training --%>
    <div class="trainer-box">
        <img src="https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=500&auto=format&fit=crop"
             alt="Personal Training" class="trainer-image"/>
        <h3>Thilak Ratnayaka</h3>
        <p><strong>Workout:</strong> Personal Training</p>
        <p>Specialization: Flexibility</p>
    </div>
</div>

</body>
</html>