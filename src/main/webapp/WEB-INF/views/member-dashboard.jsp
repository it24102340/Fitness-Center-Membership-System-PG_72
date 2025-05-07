<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Member Dashboard - ZACSON</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: #000000;
            color: #ffffff;
            font-family: 'Poppins', sans-serif;
        }

        .dashboard-container {
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .profile-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            padding: 2rem;
            margin-bottom: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .profile-avatar {
            width: 100px;
            height: 100px;
            background: linear-gradient(45deg, #ff0000, #ff6b6b);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
        }

        .profile-info h2 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .profile-info p {
            color: rgba(255, 255, 255, 0.7);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.1);
            padding: 1.5rem;
            border-radius: 8px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .stat-card h3 {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
        }

        .stat-card p {
            font-size: 2rem;
            font-weight: bold;
            color: #ff0000;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .action-button {
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            background: #ff0000;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .action-button:hover {
            background: #cc0000;
            transform: translateY(-2px);
        }

        .nav-container {
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            margin-bottom: 2rem;
        }

        .nav-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav-logo {
            color: #ffffff;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-logo:hover {
            color: #ff0000;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-link {
            color: #ffffff;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: #ff0000;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="nav-container">
        <div class="nav-content">
            <a href="${pageContext.request.contextPath}/" class="nav-logo">
                <span>💪</span> ZACSON
            </a>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/member-dashboard" class="nav-link">Dashboard</a>
                <a href="${pageContext.request.contextPath}/courses" class="nav-link">My Courses</a>
                <a href="${pageContext.request.contextPath}/logout" class="nav-link">Logout</a>
            </div>
        </div>
    </nav>

    <div class="dashboard-container">
        <!-- Profile Section -->
        <div class="profile-card">
            <div class="profile-header">
                <div class="profile-avatar" id="dashboardAvatar">
                    <!-- Avatar content will be set by JS -->
                </div>
                <div class="profile-info">
                    <h2><%= session.getAttribute("fullname") != null ? session.getAttribute("fullname") : "Member" %></h2>
                    <p>Member since <%= session.getAttribute("joinDate") != null ? session.getAttribute("joinDate") : "Today" %></p>
                </div>
            </div>

            <!-- Stats Grid -->
            <div class="stats-grid">
                <div class="stat-card">
                    <h3>Active Courses</h3>
                    <p>0</p>
                </div>
                <div class="stat-card">
                    <h3>Completed Workouts</h3>
                    <p>0</p>
                </div>
                <div class="stat-card">
                    <h3>Membership Status</h3>
                    <p>Active</p>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/courses" class="action-button">View Courses</a>
                <a href="${pageContext.request.contextPath}/schedule" class="action-button">View Schedule</a>
            </div>
        </div>

        <!-- Recent Activity Section -->
        <div class="profile-card">
            <h2>Recent Activity</h2>
            <p>No recent activity to display.</p>
        </div>
    </div>

    <script>
        // Set profile avatar to photo or default icon
        window.addEventListener('DOMContentLoaded', function() {
            const avatarDiv = document.getElementById('dashboardAvatar');
            let photo = null;
            try {
                const currentUser = JSON.parse(localStorage.getItem('currentUser'));
                if (currentUser && currentUser.photo) {
                    photo = currentUser.photo;
                }
            } catch (e) {}
            if (photo) {
                avatarDiv.innerHTML = `<img src="${photo}" alt="Profile Photo" style="width:100px;height:100px;border-radius:50%;object-fit:cover;">`;
            } else {
                avatarDiv.innerHTML = `<svg width="64" height="64" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="32" cy="32" r="32" fill="#e5e7eb"/><circle cx="32" cy="28" r="12" fill="#9ca3af"/><ellipse cx="32" cy="50" rx="16" ry="8" fill="#9ca3af"/></svg>`;
            }
        });

        function saveUserData(updatedUser) {
            const registeredUsers = JSON.parse(localStorage.getItem('registeredUsers')) || [];
            const userIndex = registeredUsers.findIndex(u => u.username === updatedUser.username);
            if (userIndex !== -1) {
                registeredUsers[userIndex] = updatedUser;
                localStorage.setItem('registeredUsers', JSON.stringify(registeredUsers));
                localStorage.setItem('currentUser', JSON.stringify(updatedUser));
            }
        }
    </script>
</body>
</html> 