<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profile - ZACSON</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            background: #f3f4f6;
            min-height: 100vh;
        }
        .profile-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: white;
            border-radius: 1rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
        }
        .profile-photo {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #e5e7eb;
        }
        .profile-info {
            margin-left: 2rem;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #374151;
        }
        .form-input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            transition: border-color 0.2s;
        }
        .form-input:focus {
            outline: none;
            border-color: #3b82f6;
        }
        .save-button {
            background: #3b82f6;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 0.375rem;
            font-weight: 500;
            transition: background 0.2s;
        }
        .save-button:hover {
            background: #2563eb;
        }
        .error-message {
            color: #ef4444;
            margin-top: 0.5rem;
            font-size: 0.875rem;
        }
        .success-message {
            color: #10b981;
            margin-top: 0.5rem;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="bg-white shadow-lg fixed w-full top-0 z-50">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <a href="index.jsp" class="flex items-center space-x-2">
                        <span class="text-2xl">💪</span>
                        <span class="font-bold text-xl text-gray-800">ZACSON</span>
                    </a>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="index.jsp" class="text-gray-600 hover:text-blue-600">Home</a>
                    <a href="profile.jsp" class="text-blue-600 font-medium">Profile</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="profile-container mt-20">
        <div class="profile-header">
            <img id="profilePhoto" src="https://via.placeholder.com/150" alt="Profile Photo" class="profile-photo">
            <div class="profile-info">
                <h1 class="text-2xl font-bold" id="displayName">Loading...</h1>
                <p class="text-gray-600" id="memberSince">Member since: Loading...</p>
            </div>
        </div>

        <form id="profileForm" onsubmit="return handleProfileUpdate(event)">
            <div class="form-group">
                <label class="form-label">Username</label>
                <input type="text" id="username" name="username" class="form-input" required>
            </div>

            <div class="form-group">
                <label class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-input" required>
            </div>

            <div class="form-group">
                <label class="form-label">Phone Number</label>
                <input type="tel" id="phone" name="phone" class="form-input">
            </div>

            <div class="form-group">
                <label class="form-label">Change Password</label>
                <input type="password" id="password" name="password" class="form-input" placeholder="Leave blank to keep current password">
            </div>

            <div class="form-group">
                <label class="form-label">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-input">
            </div>

            <div class="form-group">
                <label class="form-label">Profile Photo</label>
                <input type="file" id="photo" name="photo" accept="image/*" class="form-input">
            </div>

            <div id="errorMessage" class="error-message hidden"></div>
            <div id="successMessage" class="success-message hidden"></div>

            <button type="submit" class="save-button">Save Changes</button>
        </form>
    </div>

    <script>
        // Load user data when page loads
        window.addEventListener('load', function() {
            const currentUser = JSON.parse(localStorage.getItem('currentUser'));
            if (currentUser) {
                document.getElementById('username').value = currentUser.username;
                document.getElementById('email').value = currentUser.email;
                document.getElementById('displayName').textContent = currentUser.fullname;
                document.getElementById('memberSince').textContent = `Member since: ${new Date(currentUser.dateRegistered).toLocaleDateString()}`;
                if (currentUser.phone) {
                    document.getElementById('phone').value = currentUser.phone;
                }
                if (currentUser.photo) {
                    document.getElementById('profilePhoto').src = currentUser.photo;
                }
            } else {
                window.location.href = 'member-login.jsp';
            }
        });

        function handleProfileUpdate(event) {
            event.preventDefault();
            const currentUser = JSON.parse(localStorage.getItem('currentUser'));
            const errorDiv = document.getElementById('errorMessage');
            const successDiv = document.getElementById('successMessage');
            
            // Get form values
            const username = document.getElementById('username').value;
            const email = document.getElementById('email').value;
            const phone = document.getElementById('phone').value;
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const photoFile = document.getElementById('photo').files[0];

            // Validate password if changed
            if (password && password !== confirmPassword) {
                errorDiv.textContent = "Passwords do not match";
                errorDiv.classList.remove('hidden');
                successDiv.classList.add('hidden');
                return false;
            }

            // Update user data
            const updatedUser = {
                ...currentUser,
                username: username,
                email: email,
                phone: phone
            };

            // Handle password change if provided
            if (password) {
                updatedUser.password = password;
            }

            // Handle photo upload if provided
            if (photoFile) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    updatedUser.photo = e.target.result;
                    document.getElementById('profilePhoto').src = e.target.result;
                    saveUserData(updatedUser);
                };
                reader.readAsDataURL(photoFile);
            } else {
                saveUserData(updatedUser);
            }

            return false;
        }

        function saveUserData(updatedUser) {
            const errorDiv = document.getElementById('errorMessage');
            const successDiv = document.getElementById('successMessage');
            
            // Update user in registered users list
            const registeredUsers = JSON.parse(localStorage.getItem('registeredUsers')) || [];
            const userIndex = registeredUsers.findIndex(u => u.username === updatedUser.username);
            
            if (userIndex !== -1) {
                registeredUsers[userIndex] = updatedUser;
                localStorage.setItem('registeredUsers', JSON.stringify(registeredUsers));
                localStorage.setItem('currentUser', JSON.stringify(updatedUser));
                
                successDiv.textContent = "Profile updated successfully!";
                successDiv.classList.remove('hidden');
                errorDiv.classList.add('hidden');
            } else {
                errorDiv.textContent = "Error updating profile. Please try again.";
                errorDiv.classList.remove('hidden');
                successDiv.classList.add('hidden');
            }
        }
    </script>
</body>
</html> 