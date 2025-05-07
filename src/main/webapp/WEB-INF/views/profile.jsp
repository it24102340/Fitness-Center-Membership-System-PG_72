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
            justify-content: center;
            margin-bottom: 2rem;
        }
        .profile-photo {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #e5e7eb;
            background: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
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
                    <a href="profile" class="text-blue-600 font-medium">Profile</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="profile-container mt-20">
        <div class="profile-header flex-col">
            <div class="text-center mb-2">
                <img id="profilePhoto" src="" alt="Profile Photo" class="profile-photo">
                <h1 class="text-2xl font-bold mt-2" id="showUsername">@username</h1>
                <p class="text-gray-600" id="memberSince">Member since: Loading...</p>
            </div>
            <div class="profile-info"></div>
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
                <div style="position:relative;">
                    <input type="password" id="password" name="password" class="form-input" placeholder="Leave blank to keep current password">
                    <button type="button" onclick="togglePassword('password', this)" style="position:absolute; right:10px; top:50%; transform:translateY(-50%); background:none; border:none; cursor:pointer; color:#374151; padding:0;">
                        <span class="eye-icon" aria-label="Show/Hide Password">
                            <svg xmlns="http://www.w3.org/2000/svg" id="password-eye" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="#374151" stroke-width="2" d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7S1 12 1 12Z"/><circle cx="12" cy="12" r="3" stroke="#374151" stroke-width="2"/></svg>
                        </span>
                    </button>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Confirm Password</label>
                <div style="position:relative;">
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-input">
                    <button type="button" onclick="togglePassword('confirmPassword', this)" style="position:absolute; right:10px; top:50%; transform:translateY(-50%); background:none; border:none; cursor:pointer; color:#374151; padding:0;">
                        <span class="eye-icon" aria-label="Show/Hide Password">
                            <svg xmlns="http://www.w3.org/2000/svg" id="confirmPassword-eye" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="#374151" stroke-width="2" d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7S1 12 1 12Z"/><circle cx="12" cy="12" r="3" stroke="#374151" stroke-width="2"/></svg>
                        </span>
                    </button>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Profile Photo</label>
                <input type="file" id="photo" name="photo" accept="image/*" class="form-input">
            </div>

            <div id="errorMessage" class="error-message hidden"></div>
            <div id="successMessage" class="success-message hidden"></div>

            <button type="submit" class="save-button">Save Changes</button>
            <button type="button" class="save-button bg-red-600 hover:bg-red-800 ml-4" onclick="deleteProfile()">Delete Profile</button>
        </form>
    </div>

    <script>
        // Load user data when page loads
        window.addEventListener('load', function() {
            const currentUser = JSON.parse(localStorage.getItem('currentUser'));
            const profilePhoto = document.getElementById('profilePhoto');
            if (currentUser) {
                document.getElementById('username').value = currentUser.username;
                document.getElementById('email').value = currentUser.email;
                document.getElementById('showUsername').textContent = currentUser.username;
                document.getElementById('memberSince').textContent = "Member since: " + new Date(currentUser.dateRegistered).toLocaleDateString();
                if (currentUser.phone) {
                    document.getElementById('phone').value = currentUser.phone;
                }
                if (currentUser.photo) {
                    profilePhoto.src = currentUser.photo;
                } else {
                    // Use a default SVG user icon as data URI
                    profilePhoto.src = "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64' fill='none'%3E%3Ccircle cx='32' cy='32' r='32' fill='%23e5e7eb'/%3E%3Ccircle cx='32' cy='28' r='12' fill='%239ca3af'/%3E%3Cellipse cx='32' cy='50' rx='16' ry='8' fill='%239ca3af'/%3E%3C/svg%3E";
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
            let registeredUsers = JSON.parse(localStorage.getItem('registeredUsers')) || [];
            const currentUser = JSON.parse(localStorage.getItem('currentUser'));
            // If username is changed, check for duplicates
            if (updatedUser.username !== currentUser.username) {
                if (registeredUsers.some(u => u.username === updatedUser.username)) {
                    errorDiv.textContent = "Username already exists. Please choose another.";
                    errorDiv.classList.remove('hidden');
                    successDiv.classList.add('hidden');
                    return;
                }
            }
            // Find the user by the old username
            const userIndex = registeredUsers.findIndex(u => u.username === currentUser.username);
            if (userIndex !== -1) {
                registeredUsers[userIndex] = updatedUser;
                localStorage.setItem('registeredUsers', JSON.stringify(registeredUsers));
                localStorage.setItem('currentUser', JSON.stringify(updatedUser));
                // Update form fields with new values
                document.getElementById('username').value = updatedUser.username;
                document.getElementById('email').value = updatedUser.email;
                document.getElementById('phone').value = updatedUser.phone || '';
                if (updatedUser.photo) {
                    document.getElementById('profilePhoto').src = updatedUser.photo;
                }
                successDiv.textContent = "Profile updated successfully!";
                successDiv.classList.remove('hidden');
                errorDiv.classList.add('hidden');
            } else {
                errorDiv.textContent = "Error updating profile. Please try again.";
                errorDiv.classList.remove('hidden');
                successDiv.classList.add('hidden');
            }
        }

        function deleteProfile() {
            const currentUser = JSON.parse(localStorage.getItem('currentUser'));
            if (!currentUser) return;
            const enteredPassword = prompt('Please enter your password to confirm profile deletion:');
            if (enteredPassword === null) return; // Cancelled
            if (enteredPassword !== currentUser.password) {
                alert('Incorrect password. Profile not deleted.');
                return;
            }
            if (!confirm('Are you sure you want to delete your profile? This action cannot be undone.')) {
                return;
            }
            let registeredUsers = JSON.parse(localStorage.getItem('registeredUsers')) || [];
            registeredUsers = registeredUsers.filter(u => u.username !== currentUser.username);
            localStorage.setItem('registeredUsers', JSON.stringify(registeredUsers));
            localStorage.removeItem('currentUser');
            localStorage.removeItem('memberLoggedIn');
            window.location.href = 'index.jsp';
        }

        function togglePassword(fieldId, btn) {
            const input = document.getElementById(fieldId);
            const eyeIcon = btn.querySelector('svg');
            if (input.type === 'password') {
                input.type = 'text';
                // Change to eye-slash icon
                eyeIcon.innerHTML = '';
                eyeIcon.outerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="#374151" stroke-width="2" d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7S1 12 1 12Z"/><circle cx="12" cy="12" r="3" stroke="#374151" stroke-width="2"/><path stroke="#374151" stroke-width="2" d="M4 4l16 16"/></svg>';
            } else {
                input.type = 'password';
                // Change to eye icon
                eyeIcon.innerHTML = '';
                eyeIcon.outerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="#374151" stroke-width="2" d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7S1 12 1 12Z"/><circle cx="12" cy="12" r="3" stroke="#374151" stroke-width="2"/></svg>';
            }
        }
    </script>
</body>
</html> 