<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Member Dashboard - Fitness Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <style>
        .gradient-background {
            background: linear-gradient(120deg, #1a1a1a 0%, #2d2d2d 100%);
        }
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }
        .float-animation {
            animation: float 3s ease-in-out infinite;
        }
        .gym-pattern {
            background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.05'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        }
        .card-hover {
            transition: all 0.3s ease;
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        .journey-button {
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            transition: all 0.3s ease;
        }
        .journey-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(78, 205, 196, 0.3);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-900 to-gray-800 min-h-screen gym-pattern">
    <!-- Navigation -->
    <nav class="bg-black bg-opacity-90 shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <h1 class="text-2xl font-bold text-white">FITNESS JOURNEY</h1>
                </div>
                <div class="flex items-center space-x-4">
                    <span class="text-gray-300">Welcome, <%= request.getAttribute("username") %></span>
                    <a href="${pageContext.request.contextPath}/logout" 
                       class="journey-button text-white px-6 py-2 rounded-full hover:bg-opacity-90 transition-colors duration-300">
                        Logout
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mx-auto px-4 py-8">
        <!-- Quick Stats -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="bg-black bg-opacity-50 rounded-lg shadow-xl p-6 card-hover border border-gray-700">
                <h3 class="text-xl font-semibold text-white mb-2">Workouts This Week</h3>
                <p class="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-FF6B6B to-4ECDC4">5</p>
            </div>
            <div class="bg-black bg-opacity-50 rounded-lg shadow-xl p-6 card-hover border border-gray-700">
                <h3 class="text-xl font-semibold text-white mb-2">Next Session</h3>
                <p class="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-FF6B6B to-4ECDC4">2h</p>
            </div>
            <div class="bg-black bg-opacity-50 rounded-lg shadow-xl p-6 card-hover border border-gray-700">
                <h3 class="text-xl font-semibold text-white mb-2">Points Earned</h3>
                <p class="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-FF6B6B to-4ECDC4">250</p>
            </div>
            <div class="bg-black bg-opacity-50 rounded-lg shadow-xl p-6 card-hover border border-gray-700">
                <h3 class="text-xl font-semibold text-white mb-2">Days Streak</h3>
                <p class="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-FF6B6B to-4ECDC4">7</p>
            </div>
        </div>

        <!-- Main Sections -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <!-- Membership Plans & Registration -->
            <div class="bg-black bg-opacity-50 rounded-lg shadow-xl p-6 card-hover border border-gray-700">
                <h2 class="text-2xl font-bold text-white mb-6 flex items-center">
                    <span class="text-3xl mr-2">💪</span>
                    My Membership
                </h2>
                <div class="space-y-4">
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">Current Plan</h3>
                        <p class="text-gray-400">Premium Membership - Valid until Dec 31, 2024</p>
                    </a>
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">Upgrade Options</h3>
                        <p class="text-gray-400">View available membership upgrades</p>
                    </a>
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">Payment History</h3>
                        <p class="text-gray-400">View your payment records</p>
                    </a>
                </div>
            </div>

            <!-- Workout Programs -->
            <div class="bg-black bg-opacity-50 rounded-lg shadow-xl p-6 card-hover border border-gray-700">
                <h2 class="text-2xl font-bold text-white mb-6 flex items-center">
                    <span class="text-3xl mr-2">🏋️‍♂️</span>
                    My Workouts
                </h2>
                <div class="space-y-4">
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">Current Program</h3>
                        <p class="text-gray-400">Strength Training - Week 3</p>
                    </a>
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">Class Schedule</h3>
                        <p class="text-gray-400">View upcoming classes and sessions</p>
                    </a>
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">Progress Tracking</h3>
                        <p class="text-gray-400">Monitor your fitness journey</p>
                    </a>
                </div>
            </div>

            <!-- Scheduling & Attendance -->
            <div class="bg-black bg-opacity-50 rounded-lg shadow-xl p-6 card-hover border border-gray-700">
                <h2 class="text-2xl font-bold text-white mb-6 flex items-center">
                    <span class="text-3xl mr-2">📅</span>
                    Schedule & Attendance
                </h2>
                <div class="space-y-4">
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">Book Session</h3>
                        <p class="text-gray-400">Schedule your next workout</p>
                    </a>
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">Attendance History</h3>
                        <p class="text-gray-400">View your workout history</p>
                    </a>
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">My Calendar</h3>
                        <p class="text-gray-400">Manage your workout schedule</p>
                    </a>
                </div>
            </div>

            <!-- Personal Progress -->
            <div class="bg-black bg-opacity-50 rounded-lg shadow-xl p-6 card-hover border border-gray-700">
                <h2 class="text-2xl font-bold text-white mb-6 flex items-center">
                    <span class="text-3xl mr-2">📊</span>
                    My Progress
                </h2>
                <div class="space-y-4">
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">Fitness Goals</h3>
                        <p class="text-gray-400">Track your fitness objectives</p>
                    </a>
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">Achievements</h3>
                        <p class="text-gray-400">View your fitness milestones</p>
                    </a>
                    <a href="#" class="block p-4 bg-gray-900 bg-opacity-50 rounded-lg hover:bg-gray-800 transition-all duration-300 border border-gray-700">
                        <h3 class="font-semibold text-white">Performance Stats</h3>
                        <p class="text-gray-400">Monitor your workout metrics</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 