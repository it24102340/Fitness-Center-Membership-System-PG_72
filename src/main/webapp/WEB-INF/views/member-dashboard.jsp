<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Member Dashboard - Fitness Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .gradient-background {
            background: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%);
        }
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }
        .float-animation {
            animation: float 3s ease-in-out infinite;
        }
        .nav-link {
            position: relative;
        }
        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -2px;
            left: 0;
            background-color: #3b82f6;
            transition: width 0.3s ease;
        }
        .nav-link:hover::after {
            width: 100%;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-blue-100 min-h-screen">
    <!-- Navigation Dashboard -->
    <nav class="bg-white shadow-lg fixed w-full top-0 z-50">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2">
                        <span class="text-2xl">💪</span>
                        <span class="font-bold text-xl text-gray-800">Fitness Center</span>
                    </a>
                </div>
                <div class="flex items-center space-x-8">
                    <a href="${pageContext.request.contextPath}/" class="nav-link text-gray-600 hover:text-blue-600 transition-colors duration-300">Home</a>
                    <a href="${pageContext.request.contextPath}/courses" class="nav-link text-gray-600 hover:text-blue-600 transition-colors duration-300">Courses</a>
                    <span class="text-gray-600">Welcome, <%= session.getAttribute("username") %></span>
                    <a href="${pageContext.request.contextPath}/logout" class="bg-red-600 text-white px-4 py-2 rounded-full hover:bg-red-700 transition-colors duration-300">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mx-auto px-4 py-12 mt-16">
        <!-- Dashboard Header -->
        <div class="text-center mb-16">
            <h1 class="text-5xl font-bold mb-6 text-gray-800">
                Member Dashboard
            </h1>
            <p class="text-xl text-gray-600 mb-8">
                Track Your Fitness Journey
            </p>
        </div>

        <!-- Quick Stats -->
        <div class="grid md:grid-cols-4 gap-6 mb-8">
            <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                <div class="text-4xl mb-4">🏃‍♂️</div>
                <h3 class="text-xl font-semibold mb-2">Workouts This Week</h3>
                <p class="text-3xl font-bold text-blue-600">5</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                <div class="text-4xl mb-4">📅</div>
                <h3 class="text-xl font-semibold mb-2">Next Session</h3>
                <p class="text-xl font-bold text-green-600">Today 5 PM</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                <div class="text-4xl mb-4">⭐</div>
                <h3 class="text-xl font-semibold mb-2">Points Earned</h3>
                <p class="text-3xl font-bold text-purple-600">750</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                <div class="text-4xl mb-4">🔥</div>
                <h3 class="text-xl font-semibold mb-2">Days Streak</h3>
                <p class="text-3xl font-bold text-orange-600">15</p>
            </div>
        </div>

        <!-- Member Features -->
        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
            <!-- My Membership -->
            <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                <div class="text-blue-500 text-4xl mb-4">🎫</div>
                <h3 class="text-xl font-semibold mb-4">My Membership</h3>
                <ul class="space-y-2 text-gray-600">
                    <li><a href="#" class="hover:text-blue-600">➤ View Plan Details</a></li>
                    <li><a href="#" class="hover:text-blue-600">➤ Payment History</a></li>
                    <li><a href="#" class="hover:text-blue-600">➤ Upgrade Plan</a></li>
                </ul>
            </div>

            <!-- My Workouts -->
            <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                <div class="text-green-500 text-4xl mb-4">🏋️‍♂️</div>
                <h3 class="text-xl font-semibold mb-4">My Workouts</h3>
                <ul class="space-y-2 text-gray-600">
                    <li><a href="#" class="hover:text-blue-600">➤ Current Program</a></li>
                    <li><a href="#" class="hover:text-blue-600">➤ Exercise Library</a></li>
                    <li><a href="#" class="hover:text-blue-600">➤ Workout History</a></li>
                </ul>
            </div>

            <!-- Schedule -->
            <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                <div class="text-purple-500 text-4xl mb-4">📅</div>
                <h3 class="text-xl font-semibold mb-4">Schedule & Attendance</h3>
                <ul class="space-y-2 text-gray-600">
                    <li><a href="#" class="hover:text-blue-600">➤ Book Classes</a></li>
                    <li><a href="#" class="hover:text-blue-600">➤ My Schedule</a></li>
                    <li><a href="#" class="hover:text-blue-600">➤ Attendance History</a></li>
                </ul>
            </div>

            <!-- Progress -->
            <div class="bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transform hover:-translate-y-2 transition-all duration-300">
                <div class="text-orange-500 text-4xl mb-4">📊</div>
                <h3 class="text-xl font-semibold mb-4">My Progress</h3>
                <ul class="space-y-2 text-gray-600">
                    <li><a href="#" class="hover:text-blue-600">➤ Track Goals</a></li>
                    <li><a href="#" class="hover:text-blue-600">➤ Body Metrics</a></li>
                    <li><a href="#" class="hover:text-blue-600">➤ Progress Photos</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-white bg-opacity-90 shadow-lg mt-16">
        <div class="container mx-auto px-4 py-6">
            <div class="text-center text-gray-600">
                <p>© 2024 Fitness Center. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html> 