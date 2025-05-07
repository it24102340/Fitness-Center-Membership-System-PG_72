<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome - Fitness Center Membership System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            --accent: #43b97f;
            --accent-gradient: linear-gradient(90deg, #43b97f 0%, #f9d423 100%);
            --accent-hover: #2e8b57;
        }
        body {
            background: var(--primary-gradient);
            min-height: 100vh;
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .hero-section {
            min-height: 80vh;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
        }
        .hero-overlay {
            background: none;
        }
        .hero-content {
            position: relative;
            z-index: 2;
            color: #222;
            padding: 3rem 1rem 2rem 1rem;
        }
        .hero-title {
            font-size: 3rem;
            font-weight: 800;
            color: #222;
            text-shadow: 0 2px 16px #fff;
            margin-bottom: 1.2rem;
        }
        .hero-desc {
            font-size: 1.35rem;
            color: #43b97f;
            font-weight: 500;
            margin-bottom: 2.2rem;
            text-shadow: 0 2px 8px #fff;
        }
        .main-actions .btn {
            font-size: 1.2rem;
            padding: 0.9rem 2.2rem;
            border-radius: 16px;
            font-weight: 600;
            box-shadow: 0 4px 15px rgba(67, 185, 127, 0.13);
            display: flex;
            align-items: center;
            gap: 0.7rem;
        }
        .btn-primary {
            background: var(--accent-gradient);
            border: none;
            color: #fff;
        }
        .btn-primary:hover {
            background: var(--accent-hover);
            color: #fff;
        }
        .btn-info {
            background: var(--accent-gradient);
            color: #fff;
            border: none;
        }
        .btn-info:hover {
            background: var(--accent-hover);
            color: #fff;
        }
        .features-section {
            background: #fff;
            border-radius: 32px;
            box-shadow: 0 8px 32px rgba(67,185,127,0.10);
            margin: -3rem auto 2.5rem auto;
            max-width: 1100px;
            padding: 2.5rem 1.5rem 2rem 1.5rem;
            position: relative;
            z-index: 3;
        }
        .features-row {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 2.5rem;
        }
        .feature-card {
            background: #f8fafc;
            border-radius: 18px;
            box-shadow: 0 4px 16px rgba(67,185,127,0.08);
            padding: 2rem 1.5rem;
            text-align: center;
            width: 240px;
            min-height: 220px;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: transform 0.2s;
        }
        .feature-card:hover {
            transform: translateY(-8px) scale(1.04);
            box-shadow: 0 8px 32px rgba(67,185,127,0.13);
        }
        .feature-icon {
            font-size: 2.5rem;
            color: #43b97f;
            margin-bottom: 1rem;
        }
        .feature-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: #222;
            margin-bottom: 0.5rem;
        }
        .feature-desc {
            color: #555;
            font-size: 1rem;
        }
        .footer {
            background: #fff;
            color: #222;
            padding: 2.5rem 0 1.5rem 0;
            text-align: center;
            margin-top: 4rem;
            border-radius: 40px 40px 0 0;
            box-shadow: 0 -4px 20px rgba(44, 62, 80, 0.06);
        }
        @media (max-width: 900px) {
            .features-row { gap: 1.2rem; }
            .feature-card { width: 180px; min-height: 180px; padding: 1.2rem 0.7rem; }
        }
        @media (max-width: 600px) {
            .hero-title { font-size: 2rem; }
            .features-section { padding: 1.2rem 0.5rem; }
            .feature-card { width: 100%; min-width: 0; }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">
                <img src="https://cdn-icons-png.flaticon.com/512/1048/1048953.png" alt="Logo" width="36" class="me-2 align-text-top" />
                Fitness Center
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="${pageContext.request.contextPath}/membership-plans">Membership Plans</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="${pageContext.request.contextPath}/membership/status-lookup">Check Membership Status</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="hero-section">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <h1 class="hero-title">Transform Your Fitness Journey</h1>
            <div class="hero-desc">Join our community, choose your perfect plan, and achieve your fitness goals with ease!</div>
            <div class="d-flex flex-wrap justify-content-center gap-3 main-actions">
                <a href="${pageContext.request.contextPath}/membership-plans" class="btn btn-lg btn-primary px-4 py-2 shadow-sm d-flex align-items-center gap-2">
                    <i class="fas fa-dumbbell"></i> View Membership Plans
                </a>
                <a href="${pageContext.request.contextPath}/membership/status-lookup" class="btn btn-lg btn-info px-4 py-2 shadow-sm d-flex align-items-center gap-2 text-white">
                    <i class="fas fa-user-check"></i> Check Membership Status
                </a>
            </div>
        </div>
    </section>
    <section class="features-section">
        <div class="features-row">
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-layer-group"></i></div>
                <div class="feature-title">Diverse Plans</div>
                <div class="feature-desc">Choose from a variety of flexible membership plans to fit your lifestyle and goals.</div>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-user-plus"></i></div>
                <div class="feature-title">Easy Registration</div>
                <div class="feature-desc">Sign up in seconds and start your fitness journey right away.</div>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-chart-line"></i></div>
                <div class="feature-title">Track Progress</div>
                <div class="feature-desc">Monitor your membership status and stay on top of your fitness goals.</div>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-arrow-up"></i></div>
                <div class="feature-title">Upgrade Anytime</div>
                <div class="feature-desc">Easily upgrade or change your plan as your needs evolve.</div>
            </div>
        </div>
    </section>
    <footer class="footer">
        <div class="container">
            <p class="mb-0">&copy; 2024 Fitness Center. All rights reserved. | <i class="fas fa-dumbbell"></i> Stay Strong!</p>
    </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 