<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trainer Dashboard - Fitness Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <style>
        .gradient-background {
            background: linear-gradient(120deg, #FF6B6B 0%, #4ECDC4 100%);
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
            background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%234ECDC4' fill-opacity='0.1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        }
        .card-hover {
            transition: all 0.3s ease;
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-900 to-gray-800 min-h-screen gym-pattern">
    <!-- Navigation -->
    <nav class="bg-white bg-opacity-95 shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <h1 class="text-2xl font-bold text-gray-800">Trainer Dashboard</h1>
                </div>
                <div class="flex items-center space-x-4">
                    <span class="text-gray-600">Welcome, <%= request.getAttribute("username") %></span>
                    <a href="${pageContext.request.contextPath}/logout" 
                       class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition-colors duration-300">
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
            <div class="bg-gradient-to-br from-blue-500 to-blue-600 rounded-lg shadow-xl p-6 card-hover">
                <h3 class="text-xl font-semibold text-white mb-2">Active Clients</h3>
                <p class="text-4xl font-bold text-white">25</p>
            </div>
            <div class="bg-gradient-to-br from-green-500 to-green-600 rounded-lg shadow-xl p-6 card-hover">
                <h3 class="text-xl font-semibold text-white mb-2">Today's Sessions</h3>
                <p class="text-4xl font-bold text-white">8</p>
            </div>
            <div class="bg-gradient-to-br from-purple-500 to-purple-600 rounded-lg shadow-xl p-6 card-hover">
                <h3 class="text-xl font-semibold text-white mb-2">Weekly Hours</h3>
                <p class="text-4xl font-bold text-white">32</p>
            </div>
            <div class="bg-gradient-to-br from-orange-500 to-orange-600 rounded-lg shadow-xl p-6 card-hover">
                <h3 class="text-xl font-semibold text-white mb-2">Client Satisfaction</h3>
                <p class="text-4xl font-bold text-white">98%</p>
            </div>
        </div>

        <!-- Main Sections -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <!-- Client Management -->
            <div class="bg-white bg-opacity-95 rounded-lg shadow-xl p-6 card-hover">
                <h2 class="text-2xl font-bold text-gray-800 mb-6 flex items-center">
                    <span class="text-3xl mr-2">👥</span>
                    Client Management
                </h2>
                <div class="space-y-4">
                    <a href="#" class="block p-4 bg-gradient-to-r from-blue-50 to-blue-100 rounded-lg hover:from-blue-100 hover:to-blue-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Client List</h3>
                        <p class="text-gray-600">View and manage your clients</p>
                    </a>
                    <a href="#" class="block p-4 bg-gradient-to-r from-green-50 to-green-100 rounded-lg hover:from-green-100 hover:to-green-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Progress Tracking</h3>
                        <p class="text-gray-600">Monitor client achievements</p>
                    </a>
                    <a href="#" class="block p-4 bg-gradient-to-r from-purple-50 to-purple-100 rounded-lg hover:from-purple-100 hover:to-purple-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Client Communication</h3>
                        <p class="text-gray-600">Send messages and updates</p>
                    </a>
                </div>
            </div>

            <!-- Workout Programs -->
            <div class="bg-white bg-opacity-95 rounded-lg shadow-xl p-6 card-hover">
                <h2 class="text-2xl font-bold text-gray-800 mb-6 flex items-center">
                    <span class="text-3xl mr-2">🏋️‍♂️</span>
                    Program Management
                </h2>
                <div class="space-y-4">
                    <a href="#" class="block p-4 bg-gradient-to-r from-red-50 to-red-100 rounded-lg hover:from-red-100 hover:to-red-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Create Programs</h3>
                        <p class="text-gray-600">Design custom workout plans</p>
                    </a>
                    <a href="#" class="block p-4 bg-gradient-to-r from-yellow-50 to-yellow-100 rounded-lg hover:from-yellow-100 hover:to-yellow-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Class Schedule</h3>
                        <p class="text-gray-600">Manage group sessions</p>
                    </a>
                    <a href="#" class="block p-4 bg-gradient-to-r from-indigo-50 to-indigo-100 rounded-lg hover:from-indigo-100 hover:to-indigo-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Program Templates</h3>
                        <p class="text-gray-600">Access workout templates</p>
                    </a>
                </div>
            </div>

            <!-- Scheduling & Attendance -->
            <div class="bg-white bg-opacity-95 rounded-lg shadow-xl p-6 card-hover">
                <h2 class="text-2xl font-bold text-gray-800 mb-6 flex items-center">
                    <span class="text-3xl mr-2">📅</span>
                    Schedule & Attendance
                </h2>
                <div class="space-y-4">
                    <a href="#" class="block p-4 bg-gradient-to-r from-pink-50 to-pink-100 rounded-lg hover:from-pink-100 hover:to-pink-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Session Calendar</h3>
                        <p class="text-gray-600">View and manage your schedule</p>
                    </a>
                    <a href="#" class="block p-4 bg-gradient-to-r from-teal-50 to-teal-100 rounded-lg hover:from-teal-100 hover:to-teal-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Attendance Records</h3>
                        <p class="text-gray-600">Track client attendance</p>
                    </a>
                    <a href="#" class="block p-4 bg-gradient-to-r from-cyan-50 to-cyan-100 rounded-lg hover:from-cyan-100 hover:to-cyan-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Availability</h3>
                        <p class="text-gray-600">Set your working hours</p>
                    </a>
                </div>
            </div>

            <!-- Performance & Analytics -->
            <div class="bg-white bg-opacity-95 rounded-lg shadow-xl p-6 card-hover">
                <h2 class="text-2xl font-bold text-gray-800 mb-6 flex items-center">
                    <span class="text-3xl mr-2">📊</span>
                    Performance & Analytics
                </h2>
                <div class="space-y-4">
                    <a href="#" class="block p-4 bg-gradient-to-r from-emerald-50 to-emerald-100 rounded-lg hover:from-emerald-100 hover:to-emerald-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Client Progress</h3>
                        <p class="text-gray-600">Track client achievements</p>
                    </a>
                    <a href="#" class="block p-4 bg-gradient-to-r from-rose-50 to-rose-100 rounded-lg hover:from-rose-100 hover:to-rose-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Performance Reports</h3>
                        <p class="text-gray-600">View training statistics</p>
                    </a>
                    <a href="#" class="block p-4 bg-gradient-to-r from-violet-50 to-violet-100 rounded-lg hover:from-violet-100 hover:to-violet-200 transition-all duration-300">
                        <h3 class="font-semibold text-gray-800">Client Feedback</h3>
                        <p class="text-gray-600">Review client testimonials</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 