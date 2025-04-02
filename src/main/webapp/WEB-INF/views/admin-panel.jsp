<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard - Fitness Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-color: #1a1f2e;
        }
        .stat-card {
            border-radius: 12px;
            transition: transform 0.2s;
        }
        .stat-card:hover {
            transform: translateY(-5px);
        }
        .menu-card {
            background-color: white;
            border-radius: 12px;
            transition: transform 0.2s;
        }
        .menu-card:hover {
            transform: translateY(-5px);
        }
        .menu-item {
            transition: background-color 0.3s;
            border-radius: 8px;
        }
        .menu-item:hover {
            background-color: rgba(229, 231, 235, 0.1);
        }
    </style>
</head>
<body>
    <div class="min-h-screen p-8">
        <!-- Quick Stats -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="stat-card bg-blue-500 p-6">
                <h3 class="text-white text-lg mb-2">Total Members</h3>
                <p class="text-white text-4xl font-bold">150</p>
            </div>
            <div class="stat-card bg-green-500 p-6">
                <h3 class="text-white text-lg mb-2">Active Programs</h3>
                <p class="text-white text-4xl font-bold">12</p>
            </div>
            <div class="stat-card bg-purple-500 p-6">
                <h3 class="text-white text-lg mb-2">Monthly Revenue</h3>
                <p class="text-white text-4xl font-bold">$25,000</p>
            </div>
            <div class="stat-card bg-orange-500 p-6">
                <h3 class="text-white text-lg mb-2">Attendance Rate</h3>
                <p class="text-white text-4xl font-bold">85%</p>
            </div>
        </div>

        <!-- Main Features -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <!-- Membership Plans & Registration -->
            <div class="menu-card p-6">
                <div class="flex items-center mb-4">
                    <span class="text-3xl mr-3">🏃</span>
                    <h2 class="text-xl font-bold text-gray-900">Membership Plans & Registration</h2>
                </div>
                <div class="space-y-3">
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Manage Plans</h3>
                        <p class="text-sm text-gray-500">Create and modify membership packages</p>
                    </a>
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Registration Requests</h3>
                        <p class="text-sm text-gray-500">Review and process new member registrations</p>
                    </a>
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Member Directory</h3>
                        <p class="text-sm text-gray-500">View and manage member information</p>
                    </a>
                </div>
            </div>

            <!-- Workout Programs -->
            <div class="menu-card p-6">
                <div class="flex items-center mb-4">
                    <span class="text-3xl mr-3">🏋️</span>
                    <h2 class="text-xl font-bold text-gray-900">Workout Programs</h2>
                </div>
                <div class="space-y-3">
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Program Management</h3>
                        <p class="text-sm text-gray-500">Create and manage workout programs</p>
                    </a>
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Class Schedule</h3>
                        <p class="text-sm text-gray-500">Manage group class schedules</p>
                    </a>
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Program Analytics</h3>
                        <p class="text-sm text-gray-500">Track program performance and engagement</p>
                    </a>
                </div>
            </div>

            <!-- Scheduling & Attendance -->
            <div class="menu-card p-6">
                <div class="flex items-center mb-4">
                    <span class="text-3xl mr-3">📅</span>
                    <h2 class="text-xl font-bold text-gray-900">Scheduling & Attendance</h2>
                </div>
                <div class="space-y-3">
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Class Calendar</h3>
                        <p class="text-sm text-gray-500">View and manage class schedules</p>
                    </a>
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Attendance Tracking</h3>
                        <p class="text-sm text-gray-500">Monitor member attendance</p>
                    </a>
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Capacity Management</h3>
                        <p class="text-sm text-gray-500">Manage class sizes and bookings</p>
                    </a>
                </div>
            </div>

            <!-- Reports & Analytics -->
            <div class="menu-card p-6">
                <div class="flex items-center mb-4">
                    <span class="text-3xl mr-3">📊</span>
                    <h2 class="text-xl font-bold text-gray-900">Reports & Analytics</h2>
                </div>
                <div class="space-y-3">
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Financial Reports</h3>
                        <p class="text-sm text-gray-500">View revenue and payment analytics</p>
                    </a>
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Member Statistics</h3>
                        <p class="text-sm text-gray-500">Analyze member engagement and retention</p>
                    </a>
                    <a href="#" class="menu-item block p-4 text-gray-700">
                        <h3 class="font-semibold">Performance Metrics</h3>
                        <p class="text-sm text-gray-500">Track overall facility performance</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 