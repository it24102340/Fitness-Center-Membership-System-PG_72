<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Fitness Center</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #e0eafc, #cfdef3);
      background-size: cover;
      background-repeat: no-repeat;
    }

    .header {
      background: linear-gradient(90deg, #007bff, #00c6ff);
      color: white;
      padding: 25px 40px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .header h1 {
      margin: 0;
      font-size: 30px;
    }

    .header p {
      margin: 5px 0 0;
      font-size: 14px;
      font-style: italic;
    }

    .header a {
      background-color: #28a745;
      color: white;
      padding: 10px 20px;
      border-radius: 8px;
      text-decoration: none;
      font-weight: bold;
      font-size: 14px;
      transition: background-color 0.3s ease;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
    }

    .header a:hover {
      background-color: #218838;
    }

    .main {
      background: white url("https://images.unsplash.com/photo-1598970434795-0c54fe7c0642?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80") no-repeat center;
      background-size: cover;
      padding: 60px 40px;
      margin: 60px auto;
      max-width: 700px;
      border-radius: 20px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
      text-align: center;
      color: white;
      position: relative;
      overflow: hidden;
    }

    .main::before {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0, 0, 0, 0.5);
      z-index: 0;
    }

    .main * {
      position: relative;
      z-index: 1;
    }

    .main h2 {
      font-size: 36px;
      margin-bottom: 10px;
    }

    .main p {
      font-size: 18px;
      margin-bottom: 30px;
    }

    .main a {
      display: inline-block;
      margin: 10px;
      padding: 12px 26px;
      font-size: 16px;
      font-weight: bold;
      color: white;
      border-radius: 10px;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .explore {
      background: linear-gradient(135deg, #007bff, #00bfff);
    }

    .explore:hover {
      background: #0056b3;
    }

    .trainers {
      background: linear-gradient(135deg, #28a745, #20c997);
    }

    .trainers:hover {
      background: #1e7e34;
    }

    .footer {
      background-color: #222;
      color: #ccc;
      text-align: center;
      padding: 20px;
      font-size: 14px;
      border-radius: 20px 20px 0 0;
      margin-top: 60px;
    }
  </style>
</head>
<body>

<!-- Header -->
<div class="header">
  <div>
    <h1 style="text-align: center;">🏋️‍♂️ Workouts Programs</h1>


  </div>
  <div>
    <a href="viewmembers">View Members</a>
  </div>
</div>

<!-- Main Section -->
<div class="main">
  <h2>Choose your workout program and start your transformation today!</h2>
  <p></p>
  <a href="programs.jsp" class="explore">Explore Programs</a>
  <a href="trainers" class="trainers">View Trainers</a>
</div>

<!-- Footer -->
<div class="footer">
  &copy; 2025 FitnessApp. All rights reserved.
</div>

</body>
</html>
