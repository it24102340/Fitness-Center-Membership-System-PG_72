<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - Fitness Center</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, 
                #ef4444 0%,    /* Energetic red */
                #f97316 25%,   /* Orange */
                #fbbf24 50%,   /* Yellow */
                #f97316 75%,   /* Orange */
                #ef4444 100%   /* Energetic red */
            );
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 2rem;
            padding: 2.5rem;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 20px 40px rgba(239, 68, 68, 0.2);
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg,
                rgba(239, 68, 68, 0.1),
                rgba(249, 115, 22, 0.1),
                rgba(251, 191, 36, 0.1)
            );
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .login-container:hover::before {
            opacity: 1;
        }

        .admin-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(45deg, #ef4444, #f97316);
            border-radius: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            color: white;
            margin: 0 auto 2rem;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 8px 20px rgba(239, 68, 68, 0.2);
        }

        .admin-icon::before {
            content: '';
            position: absolute;
            width: 150%;
            height: 150%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transform: translateX(-100%) rotate(45deg);
            transition: transform 0.6s ease;
        }

        .login-container:hover .admin-icon {
            transform: scale(1.1) rotate(5deg);
            box-shadow: 0 12px 25px rgba(239, 68, 68, 0.3);
        }

        .login-container:hover .admin-icon::before {
            transform: translateX(100%) rotate(45deg);
        }

        .input-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            transition: all 0.3s ease;
        }

        .input-field {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 3rem;
            border: 2px solid #e5e7eb;
            border-radius: 1rem;
            outline: none;
            transition: all 0.3s ease;
            font-size: 1rem;
            color: #1f2937;
            background: rgba(255, 255, 255, 0.9);
        }

        .input-field:focus {
            border-color: #ef4444;
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
        }

        .input-field:focus + .input-icon {
            color: #ef4444;
            transform: translateY(-50%) scale(1.1);
        }

        .login-button {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(45deg, #ef4444, #f97316);
            color: white;
            border: none;
            border-radius: 1rem;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.2);
        }

        .login-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: transform 0.6s ease;
        }

        .login-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(239, 68, 68, 0.3);
        }

        .login-button:hover::before {
            transform: translateX(200%);
        }

        .login-button:active {
            transform: translateY(-1px);
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.2);
        }

        .back-button {
            position: absolute;
            top: 2rem;
            left: 2rem;
            padding: 0.75rem 1.5rem;
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(239, 68, 68, 0.3);
            border-radius: 1rem;
            color: #ef4444;
            text-decoration: none;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
            box-shadow: 0 4px 10px rgba(239, 68, 68, 0.1);
        }

        .back-button:hover {
            background: linear-gradient(45deg, #ef4444, #f97316);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(239, 68, 68, 0.2);
        }

        .back-button:active {
            transform: translateY(-1px);
            box-shadow: 0 4px 10px rgba(239, 68, 68, 0.1);
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .error-shake {
            animation: shake 0.5s ease-in-out;
        }

        /* Member Login Link */
        .member-login-link {
            position: absolute;
            top: 2rem;
            right: 2rem;
            padding: 0.75rem 1.5rem;
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(239, 68, 68, 0.3);
            border-radius: 1rem;
            color: #ef4444;
            text-decoration: none;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
            box-shadow: 0 4px 10px rgba(239, 68, 68, 0.1);
        }

        .member-login-link:hover {
            background: linear-gradient(45deg, #ef4444, #f97316);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(239, 68, 68, 0.2);
        }

        .member-login-link:active {
            transform: translateY(-1px);
            box-shadow: 0 4px 10px rgba(239, 68, 68, 0.1);
        }

        .member-login-link span {
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <!-- Back Button -->
    <a href="index.jsp" class="back-button">
        <span>←</span> Back to Home
    </a>

    <!-- Member Login Link -->
    <a href="member-login.jsp" class="member-login-link">
        <span>💪</span> Member Login
    </a>

    <div class="login-container">
        <div class="admin-icon">
            👑
        </div>
        <h2 class="text-3xl font-bold text-center mb-8 text-gray-800">Admin Login</h2>
        <form action="AdminLoginServlet" method="post" id="loginForm">
            <div class="input-group">
                <input type="text" name="username" class="input-field" placeholder="Username" required>
                <span class="input-icon">👤</span>
            </div>
            <div class="input-group">
                <input type="password" name="password" class="input-field" placeholder="Password" required>
                <span class="input-icon">🔒</span>
            </div>
            <button type="submit" class="login-button">
                Login
            </button>
        </form>
    </div>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const username = document.querySelector('input[name="username"]').value;
            const password = document.querySelector('input[name="password"]').value;

            if (!username || !password) {
                e.preventDefault();
                document.querySelector('.login-container').classList.add('error-shake');
                setTimeout(() => {
                    document.querySelector('.login-container').classList.remove('error-shake');
                }, 500);
            }
        });

        // Add hover effect to input icons
        document.querySelectorAll('.input-field').forEach(input => {
            input.addEventListener('focus', () => {
                input.nextElementSibling.style.transform = 'translateY(-50%) scale(1.1)';
                input.nextElementSibling.style.color = '#ef4444';
            });

            input.addEventListener('blur', () => {
                if (!input.value) {
                    input.nextElementSibling.style.transform = 'translateY(-50%) scale(1)';
                    input.nextElementSibling.style.color = '#9ca3af';
                }
            });
        });
    </script>
</body>
</html> 