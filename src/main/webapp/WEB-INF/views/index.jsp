<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitness Center - Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --accent: #43b97f;
            --accent-gradient: linear-gradient(135deg, #43b97f 0%, #f9d423 100%);
            --accent-hover: #2e8b57;
            --navbar-bg: #fff;
            --footer-bg: #f8fafc;
            --footer-text: #222;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
        }
        .navbar {
            background: var(--navbar-bg) !important;
            box-shadow: 0 4px 20px rgba(44, 62, 80, 0.06);
            padding: 1rem 0;
        }
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--accent) !important;
            letter-spacing: 0.5px;
            display: flex;
            align-items: center;
        }
        .navbar-brand img {
            width: 38px;
            margin-right: 10px;
        }
        .nav-link {
            font-weight: 500;
            padding: 0.5rem 1rem !important;
            border-radius: 8px;
            transition: all 0.3s ease;
            color: #222 !important;
        }
        .nav-link.active, .nav-link:focus {
            color: var(--accent) !important;
            font-weight: 700;
            background: #f3f4f6;
        }
        .nav-link:hover {
            background: #f3f4f6;
            color: var(--accent) !important;
            transform: translateY(-1px);
        }
        .hero-section {
            background: linear-gradient(rgba(255,255,255,0.85), rgba(255,255,255,0.85)), url('https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=1600&q=80');
            background-size: cover;
            background-position: center;
            color: #222;
            padding: 90px 0 60px 0;
            text-align: center;
            position: relative;
        }
        .hero-logo {
            width: 110px;
            height: 110px;
            background: #fff;
            border-radius: 50%;
            box-shadow: 0 6px 24px rgba(44,62,80,0.10);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem auto;
            position: relative;
            z-index: 2;
        }
        .hero-logo img {
            width: 70px;
        }
        .hero-title {
            font-size: 2.7rem;
            font-weight: 700;
            margin-bottom: 1rem;
            letter-spacing: 1px;
            color: #222;
            text-shadow: 0 2px 12px rgba(67,185,127,0.08);
            animation: fadeInDown 1s;
        }
        .hero-desc {
            font-size: 1.2rem;
            color: #444;
            margin-bottom: 2.5rem;
            animation: fadeIn 1.5s;
        }
        .hero-btns .btn {
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 12px;
            padding: 0.9rem 2.2rem;
            margin: 0 0.5rem 1rem 0.5rem;
            box-shadow: 0 4px 15px rgba(67, 185, 127, 0.13);
            transition: all 0.3s;
        }
        .hero-btns .btn-primary {
            background: var(--accent-gradient);
            border: none;
            color: #fff;
        }
        .hero-btns .btn-primary:hover {
            background: var(--accent-hover);
            color: #fff;
        }
        .hero-btns .btn-success {
            background: linear-gradient(135deg, #43b97f 0%, #43e97b 100%);
            border: none;
            color: #fff;
        }
        .hero-btns .btn-success:hover {
            background: #2e8b57;
            color: #fff;
        }
        .hero-btns .btn-info {
            background: linear-gradient(135deg, #36d1c4 0%, #43b97f 100%);
            border: none;
            color: #fff;
        }
        .hero-btns .btn-info:hover {
            background: #1ca085;
            color: #fff;
        }
        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-40px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .feature-card {
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 20px;
            border-radius: 18px;
            box-shadow: 0 4px 16px rgba(44,62,80,0.07);
            border: none;
            background: #fff;
            animation: fadeIn 1.2s;
        }
        .feature-card:hover {
            transform: translateY(-7px) scale(1.03);
            box-shadow: 0 8px 32px rgba(67,185,127,0.13);
        }
        .feature-card .fa-3x {
            color: var(--accent);
        }
        .membership-card {
            border: none;
            border-radius: 18px;
            box-shadow: 0 4px 16px rgba(44,62,80,0.07);
            background: #fff;
            margin-bottom: 2rem;
            animation: fadeIn 1.2s;
        }
        .membership-card .card-title {
            font-weight: 700;
            color: var(--accent);
        }
        .membership-card .btn {
            border-radius: 10px;
            font-weight: 600;
            padding: 0.7rem 1.7rem;
        }
        .membership-card .btn-primary, .membership-card .btn-outline-primary {
            background: var(--accent-gradient);
            border: none;
            color: #fff;
        }
        .membership-card .btn-outline-primary {
            background: #fff;
            color: var(--accent);
            border: 2px solid var(--accent);
        }
        .membership-card .btn-outline-primary:hover {
            background: var(--accent);
            color: #fff;
        }
        .membership-card .btn-primary:hover {
            background: var(--accent-hover);
            color: #fff;
        }
        .bg-light {
            background: #f8fafc !important;
        }
        .footer {
            background: var(--footer-bg);
            color: var(--footer-text);
            padding: 2.5rem 0 1.5rem 0;
            text-align: center;
            border-radius: 40px 40px 0 0;
            box-shadow: 0 -4px 20px rgba(44, 62, 80, 0.06);
            margin-top: 3rem;
        }
        .footer h5 {
            color: var(--accent);
            font-weight: 700;
        }
        .footer a {
            color: var(--accent);
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .social-links a {
            color: var(--accent);
            font-size: 1.3rem;
            margin-right: 0.7rem;
            transition: color 0.2s;
        }
        .social-links a:hover {
            color: #222;
        }
        /* Animated SVG wave for hero */
        .hero-wave {
            position: absolute;
            left: 0; right: 0; bottom: -1px;
            width: 100%;
            z-index: 1;
        }
        /* Animated counters */
        .counters-section {
            background: #fff;
            padding: 2.5rem 0 2rem 0;
            margin-top: -40px;
            z-index: 2;
            position: relative;
            box-shadow: 0 8px 32px rgba(44,62,80,0.06);
        }
        .counter-box {
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .counter-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--accent);
            margin-bottom: 0.3rem;
        }
        .counter-label {
            font-size: 1.1rem;
            color: #444;
        }
        /* Testimonials carousel */
        .testimonials-section {
            background: #f8fafc;
            padding: 3rem 0 2.5rem 0;
        }
        .testimonial-card {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 4px 16px rgba(44,62,80,0.07);
            padding: 2rem 1.5rem 1.5rem 1.5rem;
            text-align: center;
            margin: 0 0.5rem;
            min-height: 260px;
        }
        .testimonial-avatar {
            width: 64px;
            height: 64px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 1rem;
            border: 3px solid var(--accent);
        }
        .testimonial-quote {
            font-size: 1.1rem;
            color: #444;
            margin-bottom: 1rem;
            font-style: italic;
        }
        .testimonial-name {
            font-weight: 600;
            color: var(--accent);
        }
        /* CTA Banner */
        .cta-banner {
            background: var(--accent-gradient);
            color: #fff;
            border-radius: 18px;
            box-shadow: 0 4px 16px rgba(67,185,127,0.13);
            padding: 2.2rem 1.5rem 2rem 1.5rem;
            text-align: center;
            margin: 3rem auto 2rem auto;
            max-width: 900px;
            position: relative;
        }
        .cta-banner h3 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }
        .cta-banner .btn {
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 12px;
            padding: 0.9rem 2.2rem;
            margin-top: 1rem;
            background: #fff;
            color: var(--accent);
            border: none;
            transition: all 0.3s;
        }
        .cta-banner .btn:hover {
            background: var(--accent-hover);
            color: #fff;
        }
        /* Card hover effect improvement */
        .feature-card:hover, .membership-card:hover, .testimonial-card:hover {
            transform: translateY(-10px) scale(1.04);
            box-shadow: 0 16px 40px rgba(67,185,127,0.13);
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="/">
                <img src="https://cdn-icons-png.flaticon.com/512/1048/1048953.png" alt="Logo" />
                Fitness Center
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="/plans"><i class="fas fa-dumbbell me-2"></i>Membership Plans</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/status"><i class="fas fa-user-check me-2"></i>Check Membership Status</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="hero-gym-img text-center mb-4">
                <img src="https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=800&q=80"
                     alt="Gym" style="max-width: 340px; width: 100%; border-radius: 18px; box-shadow: 0 8px 32px rgba(67,185,127,0.10); margin-top: 2rem; margin-bottom: 2rem;">
            </div>
            <div class="hero-logo">
                <img src="https://cdn-icons-png.flaticon.com/512/1048/1048953.png" alt="Fitness Center Logo" />
            </div>
            <h1 class="hero-title">Welcome to Fitness Center Membership System</h1>
            <p class="hero-desc">Manage your fitness journey, explore plans, and track your membership status easily!</p>
            <div class="hero-btns d-flex flex-wrap justify-content-center">
                <a href="/plans" class="btn btn-primary me-2 mb-2"><i class="fas fa-dumbbell me-2"></i>View Membership Plans</a>
                <a href="/status" class="btn btn-info mb-2"><i class="fas fa-user-check me-2"></i>Check Membership Status</a>
            </div>
        </div>
        <!-- SVG Wave -->
        <svg class="hero-wave" viewBox="0 0 1440 120" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-opacity="1" d="M0,32L48,53.3C96,75,192,117,288,117.3C384,117,480,75,576,74.7C672,75,768,117,864,133.3C960,149,1056,139,1152,117.3C1248,96,1344,64,1392,48L1440,32L1440,120L1392,120C1344,120,1248,120,1152,120C1056,120,960,120,864,120C768,120,672,120,576,120C480,120,384,120,288,120C192,120,96,120,48,120L0,120Z" fill="#f8fafc"></path></svg>
    </section>

    <!-- Animated Counters Section -->
    <section class="counters-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-6 col-md-4">
                    <div class="counter-box">
                        <div class="counter-number" id="counter-members">0</div>
                        <div class="counter-label">Members Joined</div>
                    </div>
                </div>
                <div class="col-6 col-md-4">
                    <div class="counter-box">
                        <div class="counter-number" id="counter-classes">0</div>
                        <div class="counter-label">Classes Held</div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="counter-box">
                        <div class="counter-number" id="counter-trainers">0</div>
                        <div class="counter-label">Expert Trainers</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Why Choose Us?</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body text-center">
                            <i class="fas fa-dumbbell fa-3x mb-3 text-primary"></i>
                            <h5 class="card-title">Modern Equipment</h5>
                            <p class="card-text">Access to the latest fitness equipment and technology</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body text-center">
                            <i class="fas fa-users fa-3x mb-3 text-primary"></i>
                            <h5 class="card-title">Expert Trainers</h5>
                            <p class="card-text">Professional trainers to guide your fitness journey</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body text-center">
                            <i class="fas fa-clock fa-3x mb-3 text-primary"></i>
                            <h5 class="card-title">Flexible Hours</h5>
                            <p class="card-text">Open 24/7 to fit your schedule</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonials-section">
        <div class="container">
            <h2 class="text-center mb-5">What Our Members Say</h2>
            <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="testimonial-card mx-auto" style="max-width: 400px;">
                            <img src="https://randomuser.me/api/portraits/women/44.jpg" class="testimonial-avatar" alt="Member 1" />
                            <div class="testimonial-quote">“The trainers are amazing and the atmosphere is so motivating. I've never felt better!”</div>
                            <div class="testimonial-name">— Sarah M.</div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="testimonial-card mx-auto" style="max-width: 400px;">
                            <img src="https://randomuser.me/api/portraits/men/32.jpg" class="testimonial-avatar" alt="Member 2" />
                            <div class="testimonial-quote">“Flexible hours and modern equipment make it easy to fit workouts into my busy schedule.”</div>
                            <div class="testimonial-name">— James L.</div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="testimonial-card mx-auto" style="max-width: 400px;">
                            <img src="https://randomuser.me/api/portraits/women/65.jpg" class="testimonial-avatar" alt="Member 3" />
                            <div class="testimonial-quote">“Joining this fitness center was the best decision I made for my health!”</div>
                            <div class="testimonial-name">— Priya S.</div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </section>

    <!-- CTA Banner -->
    <div class="cta-banner">
        <h3>Ready to Start Your Fitness Journey?</h3>
        <p>Sign up today and get your first month <b>free</b>! Experience the best in fitness and wellness.</p>
        <a href="/register" class="btn"><i class="fas fa-bolt me-2"></i>Get Started Now</a>
    </div>

    <!-- Membership Plans Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-5">Membership Plans</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card membership-card">
                        <div class="card-body text-center">
                            <h3 class="card-title">Basic</h3>
                            <h4 class="text-primary mb-4">$29.99/month</h4>
                            <ul class="list-unstyled">
                                <li class="mb-2">Access to gym equipment</li>
                                <li class="mb-2">Basic fitness assessment</li>
                                <li class="mb-2">Group classes (limited)</li>
                            </ul>
                            <a href="/register?plan=basic" class="btn btn-outline-primary">Choose Plan</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card membership-card">
                        <div class="card-body text-center">
                            <h3 class="card-title">Premium</h3>
                            <h4 class="text-primary mb-4">$49.99/month</h4>
                            <ul class="list-unstyled">
                                <li class="mb-2">All Basic features</li>
                                <li class="mb-2">Personal trainer sessions</li>
                                <li class="mb-2">Unlimited group classes</li>
                                <li class="mb-2">Nutrition consultation</li>
                            </ul>
                            <a href="/register?plan=premium" class="btn btn-primary">Choose Plan</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card membership-card">
                        <div class="card-body text-center">
                            <h3 class="card-title">Elite</h3>
                            <h4 class="text-primary mb-4">$79.99/month</h4>
                            <ul class="list-unstyled">
                                <li class="mb-2">All Premium features</li>
                                <li class="mb-2">VIP lounge access</li>
                                <li class="mb-2">Spa & sauna access</li>
                                <li class="mb-2">Priority booking</li>
                            </ul>
                            <a href="/register?plan=elite" class="btn btn-outline-primary">Choose Plan</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-3 mb-md-0">
                    <h5>Contact Us</h5>
                    <p>123 Fitness Street<br>City, State 12345<br>Phone: (555) 123-4567<br>Email: info@fitnesscenter.com</p>
                </div>
                <div class="col-md-4 mb-3 mb-md-0">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="/about">About Us</a></li>
                        <li><a href="/classes">Classes</a></li>
                        <li><a href="/trainers">Trainers</a></li>
                        <li><a href="/contact">Contact</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Follow Us</h5>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
            <div class="mt-4">
                <small>&copy; 2024 Fitness Center. All rights reserved.</small>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Animated counters
        function animateCounter(id, end, duration) {
            let start = 0;
            const step = Math.ceil(end / (duration / 20));
            const el = document.getElementById(id);
            const timer = setInterval(() => {
                start += step;
                if (start >= end) {
                    el.textContent = end;
                    clearInterval(timer);
                } else {
                    el.textContent = start;
                }
            }, 20);
        }
        document.addEventListener('DOMContentLoaded', function() {
            animateCounter('counter-members', 1200, 1200);
            animateCounter('counter-classes', 350, 1200);
            animateCounter('counter-trainers', 18, 1200);
        });
    </script>
</body>
</html> 