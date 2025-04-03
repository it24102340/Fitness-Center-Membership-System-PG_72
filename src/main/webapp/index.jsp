<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fitness Center - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        html {
            scroll-behavior: auto !important;
            height: 100%;
            width: 100%;
            overflow-y: scroll;
        }

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
            color: #1e293b;
            overflow-x: hidden;
        }

        .main-container {
            position: relative;
            width: 100%;
            min-height: 100vh;
            overflow: visible;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            position: relative;
        }

        .logo-icon {
            width: 2.5rem;
            height: 2.5rem;
            background: linear-gradient(45deg, #ef4444, #f97316);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .logo-icon::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transform: translateX(-100%);
            transition: transform 0.6s ease;
        }

        .logo-container:hover .logo-icon::before {
            transform: translateX(100%);
        }

        .logo-icon::after {
            content: '💪';
            position: relative;
            z-index: 1;
        }

        .logo-text {
            font-size: 1.5rem;
            font-weight: bold;
            background: linear-gradient(45deg, #ef4444, #f97316);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            position: relative;
        }

        .logo-text::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -2px;
            width: 0;
            height: 2px;
            background: linear-gradient(45deg, #ef4444, #f97316);
            transition: width 0.3s ease;
        }

        .logo-container:hover .logo-text::after {
            width: 100%;
        }

        .nav-container {
            position: sticky;
            top: 0;
            width: 100%;
            z-index: 1000;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(251, 191, 36, 0.3);
        }

        .nav-link {
            color: #475569;
            position: relative;
            transition: all 0.3s ease;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
        }

        .nav-link:hover {
            color: #1e293b;
        }

        .nav-link::after {
            display: none;
        }

        .admin-login, .trainer-login, .member-signup {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #ef4444;
            padding: 0.75rem 1.5rem;
            border-radius: 1rem;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            z-index: 1;
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.2);
        }

        .admin-login::before, .trainer-login::before, .member-signup::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                90deg,
                transparent,
                rgba(239, 68, 68, 0.4),
                transparent
            );
            transition: 0.6s;
            z-index: -1;
        }

        .admin-login::after, .trainer-login::after, .member-signup::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #ef4444, #f97316);
            opacity: 0;
            transition: opacity 0.4s ease;
            z-index: -2;
        }

        .admin-login:hover::before, .trainer-login:hover::before, .member-signup:hover::before {
            left: 100%;
            transform: skewX(-15deg);
        }

        .admin-login:hover::after, .trainer-login:hover::after, .member-signup:hover::after {
            opacity: 1;
        }

        .admin-login:hover, .trainer-login:hover, .member-signup:hover {
            transform: translateY(-5px) scale(1.05);
            color: white;
            box-shadow: 0 8px 25px rgba(239, 68, 68, 0.3);
            border-color: rgba(239, 68, 68, 0.5);
        }

        .admin-login span, .trainer-login span, .member-signup span {
            display: inline-block;
            transition: all 0.4s ease;
            position: relative;
            z-index: 1;
        }

        .admin-login:hover span, .trainer-login:hover span, .member-signup:hover span {
            transform: scale(1.2) rotate(10deg);
            color: white;
            text-shadow: 0 2px 10px rgba(255, 255, 255, 0.3);
        }

        /* Individual Button Styles */
        .admin-login {
            border-color: rgba(239, 68, 68, 0.4);
        }

        .admin-login:hover {
            background: linear-gradient(45deg, #ef4444, #f97316);
        }

        .trainer-login {
            border-color: rgba(249, 115, 22, 0.4);
        }

        .trainer-login:hover {
            background: linear-gradient(45deg, #f97316, #fbbf24);
        }

        .member-signup {
            border-color: rgba(251, 191, 36, 0.4);
        }

        .member-signup:hover {
            background: linear-gradient(45deg, #fbbf24, #f97316);
        }

        /* Button Glow Effects */
        @keyframes buttonGlow {
            0% { box-shadow: 0 4px 15px rgba(239, 68, 68, 0.2); }
            50% { box-shadow: 0 4px 20px rgba(239, 68, 68, 0.4); }
            100% { box-shadow: 0 4px 15px rgba(239, 68, 68, 0.2); }
        }

        .admin-login, .trainer-login, .member-signup {
            animation: buttonGlow 2s infinite;
        }

        /* Button Click Effect */
        .admin-login:active, .trainer-login:active, .member-signup:active {
            transform: scale(0.95);
            box-shadow: 0 2px 10px rgba(239, 68, 68, 0.2);
        }

        .nav-button span {
            display: inline-block;
            transition: transform 0.3s ease;
        }

        .nav-button:hover span {
            transform: scale(1.2) rotate(5deg);
        }

        .feature-card, .program-card, .contact-card {
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(241, 245, 249, 0.6);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
        }

        .feature-card:hover, .program-card:hover, .contact-card:hover {
            background: rgba(255, 255, 255, 0.95);
            border-color: rgba(251, 191, 36, 0.5);
            box-shadow: 0 8px 20px rgba(239, 68, 68, 0.1);
        }

        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            position: relative;
            z-index: 1;
            transition: all 0.4s ease;
        }

        .feature-card:hover .feature-icon {
            transform: scale(1.2) rotate(10deg);
        }

        .bg-circles {
            position: relative;
            overflow: hidden;
            min-height: 100vh;
            background: transparent;
        }

        .bg-circles::before {
            content: '';
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: 
                radial-gradient(circle at var(--mouse-x, 50%) var(--mouse-y, 50%), 
                    rgba(255, 255, 255, 0.8) 0%, 
                    transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(251, 191, 36, 0.4) 0%, transparent 30%),
                radial-gradient(circle at 20% 80%, rgba(239, 68, 68, 0.4) 0%, transparent 30%);
            pointer-events: none;
            z-index: 0;
        }

        /* Enhanced mouse trail effect */
        .mouse-trail {
            position: fixed;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(251, 191, 36, 0.6) 0%, transparent 70%);
            pointer-events: none;
            z-index: 9999;
            mix-blend-mode: screen;
            animation: trailFade 0.8s linear forwards;
            box-shadow: 0 0 10px rgba(251, 191, 36, 0.4);
        }

        @keyframes trailFade {
            0% { transform: scale(1); opacity: 1; }
            100% { transform: scale(0); opacity: 0; }
        }

        /* Enhanced button effects */
        .nav-button {
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #ef4444;
            padding: 0.75rem 1.5rem;
            border-radius: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(239, 68, 68, 0.1);
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .nav-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #ef4444, #f97316);
            opacity: 0;
            z-index: -1;
            transition: opacity 0.3s ease;
        }

        .nav-button:hover {
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(239, 68, 68, 0.2);
        }

        .nav-button:hover::before {
            opacity: 1;
        }

        /* Join Button */
        .join-button {
            background: linear-gradient(45deg, #ef4444, #f97316);
            color: white;
            padding: 1rem 2rem;
            border-radius: 1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.3);
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .join-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #dc2626, #ea580c);
            opacity: 0;
            z-index: -1;
            transition: opacity 0.3s ease;
        }

        .join-button:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 8px 25px rgba(239, 68, 68, 0.4);
        }

        .join-button:hover::before {
            opacity: 1;
        }

        .contact-card {
            padding: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .contact-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, 
                rgba(239, 68, 68, 0.1),
                rgba(249, 115, 22, 0.1),
                rgba(251, 191, 36, 0.1)
            );
            opacity: 0;
            transition: opacity 0.3s ease;
            border-radius: 1.5rem;
        }

        .contact-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(239, 68, 68, 0.15);
            border-color: rgba(239, 68, 68, 0.4);
        }

        .contact-card:hover::before {
            opacity: 1;
        }

        .icon-wrapper {
            width: 64px;
            height: 64px;
            margin: 0 auto 1rem;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            border: 1px solid rgba(239, 68, 68, 0.3);
            box-shadow: 0 4px 10px rgba(239, 68, 68, 0.1);
        }

        .contact-card:hover .icon-wrapper {
            transform: scale(1.2);
            background: linear-gradient(45deg, #ef4444, #f97316);
            color: white;
            box-shadow: 0 8px 20px rgba(239, 68, 68, 0.2);
        }

        .contact-icon {
            width: 32px;
            height: 32px;
            color: #3b82f6;
        }

        .contact-info {
            color: #4b5563;
            margin: 0.5rem 0;
            transition: all 0.3s ease;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .contact-card:hover .contact-info {
            color: #1e293b;
            transform: scale(1.05);
        }

        .section-title {
            color: #1e293b;
            font-size: 3rem;
            font-weight: 800;
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
            background: linear-gradient(45deg, #ef4444, #f97316, #fbbf24);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-fill-color: transparent;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, transparent, #93c5fd, transparent);
            border-radius: 2px;
        }

        .feature-card, .program-card {
            opacity: 1;
            transform: none;
            transition: all 0.3s ease;
        }

        .nav-link.active {
            color: #1f2937;
            background: rgba(59, 130, 246, 0.1);
        }

        .nav-link.active::after {
            width: 80%;
        }

        .scroll-indicator {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            z-index: 1000;
            cursor: pointer;
        }

        /* Programs section styles */
        .programs-container {
            width: 100%;
            overflow: visible;
            padding: 2rem 0;
            position: relative;
            perspective: 1000px;
            transform-style: preserve-3d;
        }

        .program-slider {
            display: flex;
            gap: 2rem;
            padding: 2rem;
            animation: slidePrograms 30s linear infinite;
            position: relative;
        }

        .program-card {
            flex: 0 0 300px;
            padding: 2rem;
            transform-style: preserve-3d;
            transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(239, 68, 68, 0.2);
            border-radius: 1.5rem;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
        }

        .program-card::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(
                45deg,
                rgba(239, 68, 68, 0.1) 0%,
                rgba(249, 115, 22, 0.1) 50%,
                rgba(251, 191, 36, 0.1) 100%
            );
            transform: translateY(100%);
            transition: transform 0.5s ease;
            z-index: 0;
        }

        .program-card:hover::before {
            transform: translateY(0);
        }

        .program-card:hover {
            transform: translateY(-15px) scale(1.03);
            box-shadow: 0 20px 40px rgba(239, 68, 68, 0.15);
            border-color: rgba(239, 68, 68, 0.4);
            background: white;
        }

        .program-card h3 {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 1rem;
            color: #1e293b;
            position: relative;
            z-index: 1;
            transition: color 0.3s ease;
        }

        .program-card:hover h3 {
            background: linear-gradient(45deg, #ef4444, #f97316);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-fill-color: transparent;
        }

        .program-card p {
            color: #4b5563;
            line-height: 1.6;
            position: relative;
            z-index: 1;
            transition: color 0.3s ease;
        }

        .program-card:hover p {
            color: #1e293b;
        }

        @keyframes slidePrograms {
            0% { transform: translateX(0); }
            100% { transform: translateX(calc(-100% + 4rem)); }
        }

        /* Program Icons Animation */
        .program-icon {
            width: 64px;
            height: 64px;
            margin-bottom: 1.5rem;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            transition: all 0.3s ease;
            border: 1px solid rgba(239, 68, 68, 0.3);
            box-shadow: 0 4px 10px rgba(239, 68, 68, 0.1);
            position: relative;
            z-index: 1;
        }

        .program-card:hover .program-icon {
            transform: scale(1.2) rotate(5deg);
            background: linear-gradient(45deg, #ef4444, #f97316);
            color: white;
            box-shadow: 0 8px 20px rgba(239, 68, 68, 0.2);
            border-color: rgba(239, 68, 68, 0.5);
        }

        /* Programs Container Glow Effect */
        .programs-container::before {
            content: '';
            position: absolute;
            inset: -1px;
            background: linear-gradient(45deg, #ef4444, #f97316, #fbbf24);
            filter: blur(20px);
            opacity: 0.4;
            z-index: -1;
            animation: pulseGlow 3s infinite alternate;
        }

        @keyframes pulseGlow {
            0% { opacity: 0.3; }
            100% { opacity: 0.5; }
        }

        /* Enhanced hero section */
        .hero-section {
            min-height: calc(100vh - 80px);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 4rem 0;
        }

        .hero-title {
            color: #1e293b;
            font-size: 4rem;
            font-weight: 800;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .hero-subtitle {
            color: #475569;
            font-size: 1.5rem;
        }

        /* Update section styles */
        section {
            min-height: 100vh;
            width: 100%;
            position: relative;
            padding: 4rem 0;
            overflow: visible;
            scroll-margin-top: 80px;
        }

        /* Fix container heights */
        .hero-section {
            min-height: calc(100vh - 80px);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 4rem 0;
        }

        /* Update contact section */
        .contact-section {
            width: 100%;
            padding: 4rem 0;
            margin-top: auto;
        }

        /* Update text colors for better readability */
        .subtitle {
            color: #4b5563;
        }

        /* Animated background particles */
        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        .particle {
            position: absolute;
            width: 2px;
            height: 2px;
            background: rgba(251, 191, 36, 0.6);
            border-radius: 50%;
            animation: float 15s infinite linear;
        }

        @keyframes float {
            0% {
                transform: translateY(0) translateX(0);
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100vh) translateX(100px);
                opacity: 0;
            }
        }

        /* Gradient Overlay */
        .gradient-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 20%, rgba(251, 191, 36, 0.3) 0%, transparent 40%),
                radial-gradient(circle at 80% 80%, rgba(239, 68, 68, 0.3) 0%, transparent 40%),
                radial-gradient(circle at 50% 50%, rgba(249, 115, 22, 0.3) 0%, transparent 60%);
            pointer-events: none;
            z-index: 1;
        }

        /* Interactive light effect */
        .light-effect {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: radial-gradient(
                circle at var(--mouse-x, 50%) var(--mouse-y, 50%),
                rgba(255, 255, 255, 0.4) 0%,
                transparent 50%
            );
            pointer-events: none;
            z-index: 2;
            mix-blend-mode: overlay;
        }

        /* Feature Card Effects */
        .feature-card {
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(239, 68, 68, 0.2);
            border-radius: 1.5rem;
            padding: 2rem;
            transition: all 0.4s ease;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
            position: relative;
            overflow: hidden;
        }

        .feature-card::before {
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

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(239, 68, 68, 0.15);
            border-color: rgba(239, 68, 68, 0.4);
        }

        .feature-card:hover::before {
            opacity: 1;
        }

        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            position: relative;
            z-index: 1;
            transition: all 0.4s ease;
            display: inline-block;
        }

        .feature-card:hover .feature-icon {
            transform: scale(1.3) rotate(10deg);
            animation: pulse 1s infinite alternate;
        }

        @keyframes pulse {
            0% { transform: scale(1.3) rotate(10deg); }
            100% { transform: scale(1.4) rotate(15deg); }
        }

        /* Contact Card Effects */
        .contact-card {
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(239, 68, 68, 0.2);
            border-radius: 1.5rem;
            padding: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
            transition: all 0.4s ease;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
        }

        .contact-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, 
                rgba(239, 68, 68, 0.1),
                rgba(249, 115, 22, 0.1),
                rgba(251, 191, 36, 0.1)
            );
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .contact-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(239, 68, 68, 0.15);
            border-color: rgba(239, 68, 68, 0.4);
        }

        .contact-card:hover::before {
            opacity: 1;
        }

        .icon-wrapper {
            width: 64px;
            height: 64px;
            margin: 0 auto 1rem;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            border: 1px solid rgba(239, 68, 68, 0.3);
            box-shadow: 0 4px 10px rgba(239, 68, 68, 0.1);
        }

        .contact-card:hover .icon-wrapper {
            transform: scale(1.2);
            background: linear-gradient(45deg, #ef4444, #f97316);
            color: white;
            box-shadow: 0 8px 20px rgba(239, 68, 68, 0.2);
        }

        .contact-info {
            color: #4b5563;
            margin: 0.5rem 0;
            transition: all 0.3s ease;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .contact-card:hover .contact-info {
            color: #1e293b;
            transform: scale(1.05);
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let isScrolling = false;
            let scrollEndTimeout;
            const scrollDuration = 1000; // Longer duration for slower scrolling
            const scrollSteps = 40; // More steps for smoother animation

            // Smooth scroll function with slower speed
            function smoothScroll(targetPosition) {
                if (isScrolling) return;
                
                isScrolling = true;
                const startPosition = window.pageYOffset;
                const distance = targetPosition - startPosition;
                const startTime = performance.now();

                function animate(currentTime) {
                    const timeElapsed = currentTime - startTime;
                    const progress = Math.min(timeElapsed / scrollDuration, 1);
                    
                    // Smoother easing function
                    const easing = t => t < 0.5 
                        ? 2 * t * t 
                        : 1 - Math.pow(-2 * t + 2, 2) / 2;
                    
                    const currentPosition = startPosition + distance * easing(progress);
                    window.scrollTo(0, currentPosition);

                    if (progress < 1) {
                        requestAnimationFrame(animate);
                    } else {
                        setTimeout(() => {
                            isScrolling = false;
                        }, 100);
                    }
                }

                requestAnimationFrame(animate);
            }

            // Slower wheel event handling
            document.addEventListener('wheel', function(e) {
                if (isScrolling) {
                    e.preventDefault();
                    return;
                }

                clearTimeout(scrollEndTimeout);
                
                const delta = e.deltaY;
                const multiplier = 0.6; // Reduced multiplier for slower speed
                const step = delta * multiplier;
                
                window.scrollBy({
                    top: step,
                    behavior: 'auto'
                });

                scrollEndTimeout = setTimeout(() => {
                    isScrolling = false;
                }, 150); // Longer timeout for smoother transitions
            }, { passive: false });

            // Navigation link scrolling
            document.querySelectorAll('.nav-link').forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    const targetId = this.getAttribute('href');
                    const targetSection = document.querySelector(targetId);
                    
                    if (targetSection) {
                        const targetPosition = targetSection.offsetTop - 80;
                        smoothScroll(targetPosition);
                    }
                });
            });

            // Scroll to top with slower animation
            document.querySelector('.scroll-indicator').addEventListener('click', () => {
                smoothScroll(0);
            });

            // Section visibility check with optimized performance
            function checkSectionVisibility() {
                if (isScrolling) return;

                const scrollPosition = window.pageYOffset;
                const windowHeight = window.innerHeight;

                document.querySelectorAll('section').forEach(section => {
                    const rect = section.getBoundingClientRect();
                    const sectionId = section.getAttribute('id');
                    
                    if (rect.top <= windowHeight * 0.5 && rect.bottom >= windowHeight * 0.5) {
                        document.querySelectorAll('.nav-link').forEach(link => {
                            link.classList.remove('active');
                            if (link.getAttribute('href') === '#' + sectionId) {
                                link.classList.add('active');
                            }
                        });
                    }
                });
            }

            // Optimized scroll event listener
            let ticking = false;
            window.addEventListener('scroll', function() {
                if (!ticking) {
                    requestAnimationFrame(() => {
                        checkSectionVisibility();
                        ticking = false;
                    });
                    ticking = true;
                }
            });

            // Initialize scroll state
            checkSectionVisibility();

            // Mouse trail effect
            function createTrailDot(e) {
                const dot = document.createElement('div');
                dot.className = 'mouse-trail';
                dot.style.left = e.clientX - 10 + 'px';
                dot.style.top = e.clientY - 10 + 'px';
                document.body.appendChild(dot);
                
                setTimeout(() => {
                    dot.remove();
                }, 500);
            }

            // Throttle mouse trail creation
            let lastTrailTime = 0;
            document.addEventListener('mousemove', function(e) {
                const now = performance.now();
                if (now - lastTrailTime > 50) {  // Create trail every 50ms
                    createTrailDot(e);
                    lastTrailTime = now;
                }

                // Update background effect position
                const x = (e.clientX / window.innerWidth) * 100;
                const y = (e.clientY / window.innerHeight) * 100;
                document.body.style.setProperty('--mouse-x', x + '%');
                document.body.style.setProperty('--mouse-y', y + '%');
            });

            // Particle animation
            function createParticles() {
                const particlesContainer = document.createElement('div');
                particlesContainer.className = 'particles';
                document.body.appendChild(particlesContainer);

                for (let i = 0; i < 50; i++) {
                    const particle = document.createElement('div');
                    particle.className = 'particle';
                    particle.style.left = Math.random() * 100 + 'vw';
                    particle.style.animationDelay = Math.random() * 15 + 's';
                    particle.style.opacity = Math.random();
                    particlesContainer.appendChild(particle);
                }
            }

            // Interactive light effect
            function createLightEffect() {
                const lightEffect = document.createElement('div');
                lightEffect.className = 'light-effect';
                document.body.appendChild(lightEffect);

                document.addEventListener('mousemove', (e) => {
                    const x = (e.clientX / window.innerWidth) * 100;
                    const y = (e.clientY / window.innerHeight) * 100;
                    document.documentElement.style.setProperty('--mouse-x', x + '%');
                    document.documentElement.style.setProperty('--mouse-y', y + '%');
                });
            }

            // Gradient overlay
            function createGradientOverlay() {
                const overlay = document.createElement('div');
                overlay.className = 'gradient-overlay';
                document.body.appendChild(overlay);
            }

            // Initialize effects
            document.addEventListener('DOMContentLoaded', () => {
                createParticles();
                createLightEffect();
                createGradientOverlay();
            });

            // Initialize program cards with 3D effect
            function initializeProgramCards() {
                const cards = document.querySelectorAll('.program-card');
                
                cards.forEach(card => {
                    card.addEventListener('mousemove', (e) => {
                        const rect = card.getBoundingClientRect();
                        const x = e.clientX - rect.left;
                        const y = e.clientY - rect.top;
                        
                        const centerX = rect.width / 2;
                        const centerY = rect.height / 2;
                        
                        const rotateX = (y - centerY) / 10;
                        const rotateY = (centerX - x) / 10;
                        
                        card.style.transform = `
                            perspective(1000px)
                            rotateX(${rotateX}deg)
                            rotateY(${rotateY}deg)
                            translateZ(20px)
                        `;
                    });
                    
                    card.addEventListener('mouseleave', () => {
                        card.style.transform = 'perspective(1000px) rotateX(0) rotateY(0) translateZ(0)';
                    });
                });
            }

            // Add this to your DOMContentLoaded event
            document.addEventListener('DOMContentLoaded', () => {
                initializeProgramCards();
            });
        });
    </script>
</head>
<body class="bg-circles">
    <div class="main-container">
        <!-- Navigation Bar -->
        <nav class="nav-container">
            <div class="max-w-7xl mx-auto px-4">
                <div class="flex justify-between items-center h-20">
                    <div class="logo-container">
                        <div class="logo-icon"></div>
                        <span class="logo-text">Fitness Center</span>
                    </div>
                    <div class="flex items-center space-x-8">
                        <a href="#" class="nav-link">Home</a>
                        <a href="#features" class="nav-link">Features</a>
                        <a href="#programs" class="nav-link">Programs</a>
                        <a href="admin-login.jsp" class="nav-button admin-login flex items-center">
                            <span class="mr-2">👑</span> Admin Login
                        </a>
                        <a href="trainer-login.jsp" class="nav-button trainer-login flex items-center">
                            <span class="mr-2">🏋️</span> Trainer Login
                        </a>
                        <a href="signup.jsp" class="nav-button member-signup flex items-center">
                            <span class="mr-2">💪</span> Member Signup
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Enhanced Hero Section -->
        <div class="hero-section">
            <h1 class="hero-title">Welcome to Fitness Center</h1>
            <p class="hero-subtitle">Transform Your Life Through Fitness</p>
            <div class="mt-12">
                <a href="signup.jsp" class="join-button inline-block text-white text-xl font-semibold px-12 py-4 rounded-full">
                    Start Your Journey Now
                </a>
            </div>
        </div>

        <!-- Features Section -->
        <section id="features" class="py-16">
            <div class="container mx-auto px-4">
                <h2 class="section-title text-4xl font-bold text-center mb-16 bg-gradient-to-r from-blue-600 to-blue-800 bg-clip-text text-transparent">
                    Our Features
                </h2>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-12">
                    <div class="feature-card">
                        <div class="feature-icon">🏋️</div>
                        <h3 class="text-2xl font-bold mb-4 text-gray-800">Expert Trainers</h3>
                        <p class="text-gray-600 leading-relaxed">Professional guidance for your fitness journey with personalized attention</p>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon">💪</div>
                        <h3 class="text-2xl font-bold mb-4 text-gray-800">Modern Equipment</h3>
                        <p class="text-gray-600 leading-relaxed">State-of-the-art facilities for optimal training and results</p>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon">🎯</div>
                        <h3 class="text-2xl font-bold mb-4 text-gray-800">Custom Programs</h3>
                        <p class="text-gray-600 leading-relaxed">Personalized workout plans tailored to your specific goals</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Programs Section -->
        <section id="programs" class="py-16 relative overflow-visible">
            <h2 class="section-title">Our Programs</h2>
            <div class="programs-container">
                <div class="program-slider">
                    <!-- First set of programs -->
                    <div class="program-card">
                        <div class="program-icon">🏃‍♂️</div>
                        <h3>HIIT Training</h3>
                        <p>High-intensity interval training for maximum results</p>
                    </div>
                    
                    <div class="program-card">
                        <div class="program-icon">💪</div>
                        <h3>Strength Building</h3>
                        <p>Professional strength training programs</p>
                    </div>
                    
                    <div class="program-card">
                        <div class="program-icon">🧘‍♀️</div>
                        <h3>Yoga & Meditation</h3>
                        <p>Find your inner peace and flexibility</p>
                    </div>
                    
                    <div class="program-card">
                        <div class="program-icon">🤸‍♂️</div>
                        <h3>Crossfit</h3>
                        <p>Dynamic workouts for full body fitness</p>
                    </div>
                    
                    <div class="program-card">
                        <div class="program-icon">🏋️‍♀️</div>
                        <h3>Personal Training</h3>
                        <p>One-on-one coaching for your goals</p>
                    </div>
                    
                    <div class="program-card">
                        <div class="program-icon">🎯</div>
                        <h3>Weight Loss</h3>
                        <p>Targeted programs for effective weight loss</p>
                    </div>

                    <!-- Duplicate set for infinite scroll -->
                    <div class="program-card">
                        <div class="program-icon">🏃‍♂️</div>
                        <h3>HIIT Training</h3>
                        <p>High-intensity interval training for maximum results</p>
                    </div>
                    
                    <div class="program-card">
                        <div class="program-icon">💪</div>
                        <h3>Strength Building</h3>
                        <p>Professional strength training programs</p>
                    </div>
                    
                    <div class="program-card">
                        <div class="program-icon">🧘‍♀️</div>
                        <h3>Yoga & Meditation</h3>
                        <p>Find your inner peace and flexibility</p>
                    </div>
                    
                    <div class="program-card">
                        <div class="program-icon">🤸‍♂️</div>
                        <h3>Crossfit</h3>
                        <p>Dynamic workouts for full body fitness</p>
                    </div>
                    
                    <div class="program-card">
                        <div class="program-icon">🏋️‍♀️</div>
                        <h3>Personal Training</h3>
                        <p>One-on-one coaching for your goals</p>
                    </div>
                    
                    <div class="program-card">
                        <div class="program-icon">🎯</div>
                        <h3>Weight Loss</h3>
                        <p>Targeted programs for effective weight loss</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Join Button -->
        <div class="text-center">
            <a href="signup.jsp" class="join-button inline-block text-white text-xl font-semibold px-12 py-4 rounded-full">
                Start Your Journey Now
            </a>
        </div>

        <!-- Contact Section -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mt-24">
            <div class="contact-card">
                <div class="icon-wrapper">
                    <svg class="contact-icon" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-bold mb-2">Contact Us</h3>
                <p class="contact-info">📞 0111234567</p>
                <p class="contact-info">✉️ info@fitnesscenter.com</p>
            </div>
            <div class="contact-card">
                <div class="icon-wrapper">
                    <svg class="contact-icon" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-bold mb-2">Location</h3>
                <p class="contact-info">📍 235/6/1, Kandy Road</p>
                <p class="contact-info">🏙️ Malabe</p>
            </div>
            <div class="contact-card">
                <div class="icon-wrapper">
                    <svg class="contact-icon" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-bold mb-2">Hours</h3>
                <p class="contact-info">🌞 Mon-Fri: 6:00 AM - 10:00 PM</p>
                <p class="contact-info">🌅 Sat-Sun: 8:00 AM - 8:00 PM</p>
            </div>
        </div>

        <!-- Scroll to top button -->
        <div class="scroll-indicator">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"/>
            </svg>
        </div>
    </div>
</body>
</html> 