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
                background: #000000;
                color: #ffffff;
                overflow-x: hidden;
                font-family: 'Poppins', sans-serif;
                position: relative;
            }

            .main-container {
                position: relative;
                width: 100%;
                min-height: 100vh;
                background: url('https://images.pexels.com/photos/1229356/pexels-photo-1229356.jpeg?auto=compress&cs=tinysrgb&w=600') no-repeat center fixed;
                background-size: cover;
                background-attachment: fixed;
                z-index: 1;
            }

            .main-container::before {
                content: '';
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg,
                        rgba(255, 0, 0, 0.2),
                        rgba(0, 0, 0, 0.3));
                z-index: 1;
                pointer-events: none;
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
                background: linear-gradient(45deg, #ec4899, #60a5fa);
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                color: white;
                position: relative;
                overflow: hidden;
                transition: all 0.3s ease;
                animation: energyPulse 2s infinite;
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
                color: #ffffff;
                font-size: 1.5rem;
                text-transform: uppercase;
                letter-spacing: 2px;
                font-weight: bold;
            }

            .logo-text::after {
                content: '';
                position: absolute;
                left: 0;
                bottom: -2px;
                width: 0;
                height: 2px;
                background: linear-gradient(45deg, #f472b6, #60a5fa);
                transition: width 0.3s ease;
            }

            .logo-container:hover .logo-text::after {
                width: 100%;
            }

            .nav-container {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                z-index: 1000;
                background: rgba(0, 0, 0, 0.7);
                backdrop-filter: blur(10px);
                border-bottom: none;
                padding: 0.5rem 0;
            }

            .nav-link {
                color: #ffffff;
                text-transform: uppercase;
                font-size: 0.85rem;
                letter-spacing: 1px;
                position: relative;
                transition: all 0.3s ease;
                font-weight: 500;
                padding: 0.5rem 1rem;
            }

            .nav-link::after {
                content: '';
                position: absolute;
                bottom: -2px;
                left: 0;
                width: 0;
                height: 2px;
                background: linear-gradient(to right, #f472b6, #60a5fa);
                transition: width 0.3s ease;
            }

            .nav-link:hover::after {
                width: 100%;
            }

            .nav-link:hover {
                color: #00BFFF;
                text-shadow:
                    0 0 10px rgba(0, 191, 255, 0.8),
                    0 0 20px rgba(0, 191, 255, 0.4);
            }

            .admin-login,
            .trainer-login,
            .member-signup {
                background: rgba(0, 0, 0, 0.8);
                color: #ffffff;
                padding: 0.75rem 1.5rem;
                border-radius: 4px;
                transition: all 0.3s ease;
                font-size: 0.85rem;
                letter-spacing: 1px;
                text-transform: uppercase;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .admin-login:hover,
            .trainer-login:hover {
                background: rgba(255, 255, 255, 0.1);
                transform: translateY(-2px);
            }

            .member-signup {
                background: #ff0000;
            }

            .member-signup:hover {
                background: #cc0000;
                transform: translateY(-2px);
            }

            /* Button Glow Effects */
            @keyframes buttonGlow {
                0% {
                    box-shadow: 0 4px 15px rgba(96, 165, 250, 0.2);
                }

                50% {
                    box-shadow: 0 4px 20px rgba(96, 165, 250, 0.4);
                }

                100% {
                    box-shadow: 0 4px 15px rgba(96, 165, 250, 0.2);
                }
            }

            .admin-login,
            .trainer-login,
            .member-signup {
                animation: buttonGlow 2s infinite;
            }

            /* Button Click Effect */
            .admin-login:active,
            .trainer-login:active,
            .member-signup:active {
                transform: scale(0.95);
                box-shadow: 0 2px 10px rgba(96, 165, 250, 0.2);
            }

            .nav-button span {
                display: inline-block;
                transition: transform 0.3s ease;
            }

            .nav-button:hover span {
                transform: scale(1.2) rotate(5deg);
            }

            .feature-card,
            .program-card,
            .contact-card {
                background: rgba(255, 255, 255, 0.1) !important;
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.2);
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            }

            .feature-card:hover,
            .program-card:hover,
            .contact-card:hover {
                background: rgba(255, 255, 255, 0.15) !important;
                border-color: rgba(255, 255, 255, 0.3);
                transform: translateY(-5px);
                box-shadow: 0 15px 45px rgba(0, 0, 0, 0.2);
            }

            .feature-card {
                background: rgba(255, 255, 255, 0.05);
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.1);
                border-radius: 20px;
                padding: 2rem;
                transition: all 0.4s ease;
                position: relative;
                overflow: hidden;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
                transform: translateY(0);
            }

            .feature-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg,
                        rgba(255, 0, 0, 0.2),
                        rgba(255, 0, 0, 0));
                opacity: 0;
                transition: opacity 0.4s ease;
            }

            .feature-card:hover {
                transform: translateY(-10px);
                border-color: rgba(255, 0, 0, 0.3);
                box-shadow:
                    0 15px 45px rgba(0, 0, 0, 0.2),
                    0 0 20px rgba(255, 0, 0, 0.2);
            }

            .feature-card:hover::before {
                opacity: 1;
            }

            .feature-card .program-icon {
                font-size: 3rem;
                margin-bottom: 1.5rem;
                background: linear-gradient(45deg, #ff0000, #ff6b6b);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                transition: all 0.4s ease;
            }

            .feature-card:hover .program-icon {
                transform: scale(1.2) rotate(10deg);
                background: linear-gradient(45deg, #ff0000, #ffffff);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }

            .feature-card h3 {
                font-size: 1.5rem;
                font-weight: bold;
                margin-bottom: 1rem;
                color: #ffffff;
                transition: all 0.3s ease;
            }

            .feature-card:hover h3 {
                color: #ff0000;
                text-shadow: 0 0 10px rgba(255, 0, 0, 0.3);
            }

            .feature-card p {
                color: rgba(255, 255, 255, 0.8);
                line-height: 1.6;
                transition: all 0.3s ease;
            }

            .feature-card:hover p {
                color: rgba(255, 255, 255, 0.9);
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
                    radial-gradient(circle at center,
                        rgba(255, 255, 255, 0.9) 0%,
                        transparent 70%),
                    radial-gradient(circle at 80% 20%, rgba(147, 197, 253, 0.2) 0%, transparent 30%),
                    radial-gradient(circle at 20% 80%, rgba(147, 197, 253, 0.2) 0%, transparent 30%);
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
                0% {
                    transform: scale(1);
                    opacity: 1;
                }

                100% {
                    transform: scale(0);
                    opacity: 0;
                }
            }

            /* Enhanced button effects */
            .nav-button {
                background: #ff0000;
                color: #ffffff;
                text-transform: uppercase;
                letter-spacing: 1px;
                padding: 12px 30px;
                border: none;
                transition: all 0.3s ease;
                box-shadow:
                    0 4px 15px rgba(138, 43, 226, 0.1);
                text-shadow: 0 0 10px rgba(138, 43, 226, 0.3);
            }

            .nav-button::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(45deg, #60a5fa, #34d399);
                opacity: 0;
                z-index: -1;
                transition: opacity 0.3s ease;
            }

            .nav-button:hover {
                background: #cc0000;
                transform: translateY(-2px);
            }

            .nav-button:hover::before {
                opacity: 1;
            }

            /* Join Button */
            .join-button {
                background: #ff0000;
                color: #ffffff;
                text-transform: uppercase;
                letter-spacing: 2px;
                padding: 15px 40px;
                border: none;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .join-button::before {
                content: '';
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: linear-gradient(45deg,
                        transparent,
                        rgba(255, 255, 255, 0.3),
                        transparent);
                transform: rotate(45deg);
                animation: shimmer 2s infinite;
            }

            @keyframes shimmer {
                0% {
                    transform: translateX(-100%) rotate(45deg);
                }

                100% {
                    transform: translateX(100%) rotate(45deg);
                }
            }

            .join-button:hover {
                background: #cc0000;
                transform: translateY(-3px);
                box-shadow: 0 10px 20px rgba(255, 0, 0, 0.2);
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
                        rgba(251, 191, 36, 0.1));
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
                background: linear-gradient(45deg, #8A2BE2, #00BFFF);
                border-radius: 1rem;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.3s ease;
                border: 1px solid rgba(147, 197, 253, 0.3);
                box-shadow:
                    0 0 20px rgba(138, 43, 226, 0.2),
                    0 0 20px rgba(0, 191, 255, 0.1);
                color: white;
                animation: equipmentFloat 3s ease-in-out infinite;
            }

            .contact-card:hover .icon-wrapper {
                background: linear-gradient(45deg, #60a5fa, #93c5fd);
                box-shadow: 0 6px 15px rgba(147, 197, 253, 0.2);
            }

            .contact-icon {
                width: 32px;
                height: 32px;
                color: #ff4757;
            }

            .contact-info {
                color: rgba(255, 255, 255, 0.9) !important;
                text-shadow: none;
                margin: 0.5rem 0;
                transition: all 0.3s ease;
                position: relative;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
            }

            .contact-card:hover .contact-info {
                color: #4b5563;
                transform: scale(1.05);
            }

            .section-title {
                font-size: 3.5rem;
                font-weight: 800;
                background: linear-gradient(to right, #00BFFF, #8A2BE2);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                text-shadow: none;
                margin-bottom: 4rem;
                text-align: center;
                color: #ffffff;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            }

            .section-title::before {
                content: '';
                position: absolute;
                left: 0;
                bottom: -10px;
                width: 100%;
                height: 3px;
                background: linear-gradient(90deg, #ec4899, #60a5fa);
                transform: scaleX(0);
                transform-origin: left;
                transition: transform 0.3s ease;
            }

            .section-title:hover::before {
                transform: scaleX(1);
            }

            .feature-card,
            .program-card {
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
                background: rgba(255, 255, 255, 0.7);
                border: 1px solid rgba(147, 197, 253, 0.3);
                border-radius: 1.5rem;
                box-shadow: 0 5px 15px rgba(250, 204, 21, 0.1);
            }

            .program-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(45deg,
                        rgba(236, 72, 153, 0.1),
                        rgba(96, 165, 250, 0.1));
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .program-card:hover::before {
                opacity: 1;
            }

            .program-card:hover {
                transform: translateY(-5px) scale(1.03);
                box-shadow: 0 10px 20px rgba(147, 197, 253, 0.2);
                border-color: rgba(250, 204, 21, 0.4);
                background: rgba(255, 255, 255, 0.85);
            }

            .program-card h3 {
                font-size: 1.5rem;
                font-weight: bold;
                margin-bottom: 1rem;
                color: #ffffff;
                position: relative;
                z-index: 1;
                transition: color 0.3s ease;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
            }

            .program-card:hover h3 {
                background: linear-gradient(45deg, #60a5fa, #34d399);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                text-fill-color: transparent;
            }

            .program-card p {
                color: rgba(255, 255, 255, 0.9);
                line-height: 1.6;
                position: relative;
                z-index: 1;
                transition: color 0.3s ease;
            }

            .program-card:hover p {
                color: #374151;
            }

            @keyframes slidePrograms {
                0% {
                    transform: translateX(0);
                }

                100% {
                    transform: translateX(calc(-100% + 4rem));
                }
            }

            /* Program Icons Animation */
            .program-icon {
                width: 64px;
                height: 64px;
                margin-bottom: 1.5rem;
                background: linear-gradient(45deg, #00BFFF, #8A2BE2);
                border-radius: 1rem;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 3rem;
                transition: all 0.3s ease;
                border: 1px solid rgba(255, 71, 87, 0.3);
                box-shadow: 0 4px 10px rgba(239, 68, 68, 0.1);
                position: relative;
                z-index: 1;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                text-shadow: none;
            }

            .program-card:hover .program-icon {
                background: linear-gradient(45deg, #60a5fa, #34d399);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                transform: scale(1.1);
                animation: equipmentFloat 2s ease-in-out infinite;
            }

            /* Programs Container Glow Effect */
            .programs-container::before {
                content: '';
                position: absolute;
                inset: -1px;
                background: linear-gradient(45deg, #ec4899, #60a5fa, #ec4899);
                filter: blur(20px);
                opacity: 0.15;
                z-index: -1;
            }

            @keyframes pulseGlow {
                0% {
                    opacity: 0.1;
                }

                100% {
                    opacity: 0.3;
                }
            }

            /* Enhanced hero section */
            .hero-section {
                position: relative;
                height: 100vh;
                background: transparent;
                display: flex;
                align-items: center;
                justify-content: flex-start;
                padding: 0 5%;
                overflow: hidden;
            }

            .hero-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg,
                        rgba(255, 0, 0, 0.3),
                        transparent);
                z-index: 1;
            }

            .hero-content {
                position: relative;
                z-index: 2;
                max-width: 600px;
            }

            .hero-subtitle {
                font-size: 1.5rem;
                text-transform: uppercase;
                letter-spacing: 3px;
                color: #ff0000;
                margin-bottom: 1rem;
            }

            .hero-title {
                font-size: 4rem;
                font-weight: 700;
                text-transform: uppercase;
                line-height: 1.2;
                margin-bottom: 2rem;
                color: #ffffff;
            }

            /* Update section styles */
            section {
                position: relative;
                z-index: 2;
                min-height: 100vh;
                width: 100%;
                padding: 4rem 0;
                background: transparent !important;
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

            /* Luxury Gradient Overlay */
            .gradient-overlay {
                display: none;
            }

            /* Animated Background Effect */
            .animated-bg {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background:
                    linear-gradient(217deg, rgba(138, 43, 226, 0.1), transparent 70%),
                    linear-gradient(127deg, rgba(0, 191, 255, 0.1), transparent 70%),
                    linear-gradient(336deg, rgba(138, 43, 226, 0.1), transparent 70%);
                animation: gradientShift 15s ease infinite;
                pointer-events: none;
                z-index: 0;
            }

            @keyframes gradientShift {
                0% {
                    background-position: 0% 50%;
                }

                50% {
                    background-position: 100% 50%;
                }

                100% {
                    background-position: 0% 50%;
                }
            }

            /* Interactive light effect */
            .light-effect {
                display: none;
            }

            /* Remove Arctic Animation Effects */
            .arctic-particles,
            .snowflake,
            .aurora,
            .light-beam {
                display: none;
            }

            /* Remove the related keyframes */
            @keyframes snowfall {
                0% {}

                100% {}
            }

            @keyframes auroraFlow {
                0% {}

                100% {}
            }

            @keyframes rotate {
                0% {}

                100% {}
            }

            /* Remove scroll indicator styles */
            .scroll-indicator {
                display: none;
            }

            @keyframes float {

                0%,
                100% {
                    transform: translateY(0);
                }

                50% {
                    transform: translateY(-10px);
                }
            }

            .scroll-indicator:hover {
                display: none;
            }

            /* Energetic pulse animation for buttons */
            @keyframes energyPulse {
                0% {
                    transform: scale(1);
                }

                50% {
                    transform: scale(1.05);
                }

                100% {
                    transform: scale(1);
                }
            }

            /* Strength bar animation */
            @keyframes strengthBar {
                0% {
                    width: 0;
                    opacity: 0;
                }

                100% {
                    width: 100%;
                    opacity: 1;
                }
            }

            .nav-button {
                position: relative;
                overflow: hidden;
            }

            .nav-button::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 0;
                height: 2px;
                background: linear-gradient(45deg, #ec4899, #60a5fa);
                transition: width 0.3s ease;
            }

            .nav-button:hover::after {
                width: 100%;
                animation: strengthBar 0.3s ease;
            }

            /* Fitness equipment background animation */
            @keyframes equipmentFloat {
                0% {
                    transform: translateY(0) rotate(0);
                }

                50% {
                    transform: translateY(-10px) rotate(5deg);
                }

                100% {
                    transform: translateY(0) rotate(0);
                }
            }

            .section-title {
                position: relative;
                color: #0f172a;
            }

            .section-title::before {
                content: '';
                position: absolute;
                left: 0;
                bottom: -10px;
                width: 100%;
                height: 3px;
                background: linear-gradient(90deg, #ec4899, #60a5fa);
                transform: scaleX(0);
                transform-origin: left;
                transition: transform 0.3s ease;
            }

            .section-title:hover::before {
                transform: scaleX(1);
            }

            /* Program cards energetic hover effect */
            .program-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(45deg,
                        rgba(236, 72, 153, 0.1),
                        rgba(96, 165, 250, 0.1));
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .program-card:hover::before {
                opacity: 1;
            }

            .program-icon {
                background: linear-gradient(45deg, #00BFFF, #8A2BE2);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                text-shadow: none;
            }

            .program-card:hover .program-icon {
                transform: scale(1.2) rotate(10deg);
                animation: equipmentFloat 2s ease-in-out infinite;
            }

            /* Energetic button animation */
            .join-button {
                background: linear-gradient(45deg, #8A2BE2, #00BFFF);
                position: relative;
                overflow: hidden;
                animation: energyPulse 2s infinite;
            }

            .join-button::before {
                content: '';
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: linear-gradient(45deg,
                        transparent,
                        rgba(255, 255, 255, 0.3),
                        transparent);
                transform: rotate(45deg);
                animation: shimmer 2s infinite;
            }

            @keyframes shimmer {
                0% {
                    transform: translateX(-100%) rotate(45deg);
                }

                100% {
                    transform: translateX(100%) rotate(45deg);
                }
            }

            /* Contact cards with fitness theme */
            .contact-card {
                border: 1px solid rgba(138, 43, 226, 0.2);
                transition: all 0.3s ease;
            }

            .contact-card:hover {
                border-color: #ec4899;
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(236, 72, 153, 0.2);
            }

            .icon-wrapper {
                background: linear-gradient(45deg, #8A2BE2, #00BFFF);
                color: white;
                animation: equipmentFloat 3s ease-in-out infinite;
            }

            /* Dynamic background effect */
            .animated-bg {
                background:
                    linear-gradient(217deg, rgba(236, 72, 153, 0.1), transparent 70%),
                    linear-gradient(127deg, rgba(96, 165, 250, 0.1), transparent 70%),
                    linear-gradient(336deg, rgba(236, 72, 153, 0.1), transparent 70%);
                animation: gradientShift 15s ease infinite;
            }

            @keyframes gradientShift {
                0% {
                    background-position: 0% 50%;
                }

                50% {
                    background-position: 100% 50%;
                }

                100% {
                    background-position: 0% 50%;
                }
            }

            /* Strength meter animation for progress */
            .strength-meter {
                height: 4px;
                background: linear-gradient(90deg, #ec4899, #60a5fa);
                width: 0;
                animation: strengthBar 2s ease-out forwards;
            }

            /* Add sparkle animation */
            @keyframes sparkle {

                0%,
                100% {
                    opacity: 0;
                }

                50% {
                    opacity: 1;
                }
            }

            .sparkle {
                position: absolute;
                width: 4px;
                height: 4px;
                border-radius: 50%;
                background: rgba(236, 72, 153, 0.6);
                animation: sparkle 2s infinite;
            }

            @keyframes neonPulse {
                0% {
                    text-shadow: 0 0 10px rgba(0, 191, 255, 0.5);
                }

                50% {
                    text-shadow:
                        0 0 20px rgba(0, 191, 255, 0.8),
                        0 0 30px rgba(138, 43, 226, 0.6);
                }

                100% {
                    text-shadow: 0 0 10px rgba(0, 191, 255, 0.5);
                }
            }

            .logo-text,
            .nav-link,
            .section-title {
                animation: neonPulse 2s infinite;
            }

            .contact-card {
                background: rgba(255, 255, 255, 0.8);
                border: 1px solid rgba(255, 215, 0, 0.2);
                box-shadow:
                    0 8px 32px rgba(0, 0, 0, 0.3),
                    0 0 20px rgba(255, 215, 0, 0.1);
            }

            .icon-wrapper {
                background: linear-gradient(45deg, #FF00FF, #00FFFF);
                box-shadow:
                    0 0 20px rgba(255, 0, 255, 0.3),
                    0 0 30px rgba(0, 255, 255, 0.2);
            }

            .contact-info {
                color: #666666;
                text-shadow: none;
            }

            /* Add smoke effect */
            .smoke-effect {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background:
                    radial-gradient(circle at 20% 50%, rgba(138, 43, 226, 0.1) 0%, transparent 50%),
                    radial-gradient(circle at 80% 50%, rgba(0, 191, 255, 0.1) 0%, transparent 50%);
                filter: blur(60px);
                pointer-events: none;
            }

            /* Update text colors */
            .feature-card h3,
            .program-card h3 {
                color: #ffffff;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
            }

            .feature-card p,
            .program-card p {
                color: rgba(255, 255, 255, 0.9);
            }

            .member-login {
                background: rgba(0, 0, 0, 0.8);
                color: #ffffff;
                padding: 0.75rem 1.5rem;
                border-radius: 4px;
                transition: all 0.3s ease;
                font-size: 0.85rem;
                letter-spacing: 1px;
                text-transform: uppercase;
                display: flex;
                align-items: center;
                gap: 0.5rem;
                animation: buttonGlow 2s infinite;
            }

            .member-login:hover {
                background: rgba(255, 255, 255, 0.1);
                transform: translateY(-2px);
                box-shadow: 0 4px 20px rgba(96, 165, 250, 0.4);
            }

            .member-login:active {
                transform: scale(0.95);
                box-shadow: 0 2px 10px rgba(96, 165, 250, 0.2);
            }

            .member-login .member-icon {
                display: inline-block;
                transition: transform 0.3s ease;
            }

            .member-login:hover .member-icon {
                transform: scale(1.2) rotate(5deg);
            }

            /* Error message styles */
            .error-message {
                background-color: rgba(255, 235, 235, 0.95);
                border: 1px solid rgba(255, 0, 0, 0.1);
                color: #ff0033;
                padding: 1rem;
                border-radius: 8px;
                text-align: center;
                margin: 1rem 0;
                font-size: 0.95rem;
                box-shadow: 0 2px 4px rgba(255, 0, 0, 0.1);
                animation: fadeIn 0.3s ease-in-out;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-10px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            #loginError {
                display: none;
            }

            #loginError.show {
                display: block;
            }
        </style>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Smooth scroll function with offset for fixed header
                function smoothScroll(target) {
                    const element = document.querySelector(target);
                    if (element) {
                        const headerOffset = 80; // Height of the fixed header
                        const elementPosition = element.getBoundingClientRect().top;
                        const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

                        window.scrollTo({
                            top: offsetPosition,
                            behavior: 'smooth'
                        });
                    }
                }

                // Handle all navigation links including dropdowns
                document.querySelectorAll('.nav-link, .nav-button, [href^="#"], .group-hover\\:block a').forEach(link => {
                    link.addEventListener('click', function (e) {
                        const href = this.getAttribute('href');
                        if (href && href.startsWith('#')) {
                            e.preventDefault();
                            smoothScroll(href);

                            // Close any open dropdowns
                            document.querySelectorAll('.group-hover\\:block').forEach(dropdown => {
                                dropdown.classList.remove('block');
                                dropdown.classList.add('hidden');
                            });
                        }
                    });
                });

                // Handle specific section buttons
                const sectionMap = {
                    'features': '#features',
                    'programs': '#programs',
                    'contact': '#contact'
                };

                Object.entries(sectionMap).forEach(([key, target]) => {
                    const button = document.querySelector(`[href="${target}"]`);
                    if (button) {
                        button.addEventListener('click', (e) => {
                            e.preventDefault();
                            smoothScroll(target);
                        });
                    }
                });

                // Add active state to navigation items
                function setActiveNavItem() {
                    const scrollPosition = window.scrollY;

                    // Get all sections
                    document.querySelectorAll('section[id]').forEach(section => {
                        const sectionTop = section.offsetTop - 100;
                        const sectionBottom = sectionTop + section.offsetHeight;
                        const sectionId = section.getAttribute('id');

                        // Find corresponding nav link
                        const navLink = document.querySelector(`.nav-link[href="#${sectionId}"]`);

                        if (navLink) {
                            if (scrollPosition >= sectionTop && scrollPosition < sectionBottom) {
                                navLink.classList.add('active');
                            } else {
                                navLink.classList.remove('active');
                            }
                        }
                    });
                }

                // Listen for scroll events
                window.addEventListener('scroll', setActiveNavItem);

                // Initial check for active section
                setActiveNavItem();

                // Function to check login status and update UI
                function checkLoginStatus() {
                    const isLoggedIn = localStorage.getItem('memberLoggedIn') === 'true';
                    const currentUser = JSON.parse(localStorage.getItem('currentUser'));

                    // Get all buttons
                    const adminLoginBtn = document.getElementById('adminLoginBtn');
                    const trainerLoginBtn = document.getElementById('trainerLoginBtn');
                    const memberLoginBtn = document.getElementById('memberLoginBtn');
                    const signupBtn = document.getElementById('signupBtn');
                    const logoutBtn = document.getElementById('logoutBtn');
                    const profileBtn = document.getElementById('profileBtn');
                    const coursesBtn = document.getElementById('coursesButton');

                    if (isLoggedIn && currentUser) {
                        // Hide all login buttons
                        adminLoginBtn.classList.add('hidden');
                        trainerLoginBtn.classList.add('hidden');
                        memberLoginBtn.classList.add('hidden');
                        signupBtn.classList.add('hidden');

                        // Show logout, profile and courses buttons
                        logoutBtn.classList.remove('hidden');
                        profileBtn.classList.remove('hidden');
                        coursesBtn.classList.remove('hidden');
                    } else {
                        // Show all login buttons
                        adminLoginBtn.classList.remove('hidden');
                        trainerLoginBtn.classList.remove('hidden');
                        memberLoginBtn.classList.remove('hidden');
                        signupBtn.classList.remove('hidden');

                        // Hide logout, profile and courses buttons
                        logoutBtn.classList.add('hidden');
                        profileBtn.classList.add('hidden');
                        coursesBtn.classList.add('hidden');
                    }
                }

                // Function to handle logout
                window.handleLogout = function () {
                    // Clear login status
                    localStorage.removeItem('memberLoggedIn');
                    localStorage.removeItem('currentUser');

                    // Update UI
                    checkLoginStatus();

                    // Redirect to home page
                    window.location.href = 'index.jsp';
                }

                // Check login status when page loads
                checkLoginStatus();

                // Check login status after any navigation
                window.addEventListener('popstate', checkLoginStatus);
            });

            function showLoginForm() {
                const loginForm = document.getElementById('loginForm');
                loginForm.classList.toggle('hidden');
            }

            function memberLogin() {
                const username = document.getElementById('username').value;
                const password = document.getElementById('password').value;
                const loginError = document.getElementById('loginError');

                // Here you would typically make an AJAX call to your server to verify credentials
                // For now, we'll simulate the login process
                if (username && password) {
                    // Show error for non-signed up members
                    loginError.textContent = "Invalid username or password. Please try again.";
                    loginError.classList.add('error-message', 'show');
                } else {
                    loginError.textContent = "Please enter both username and password.";
                    loginError.classList.add('error-message', 'show');
                }
            }
        </script>
    </head>

    <body>
        <div class="main-container">
            <!-- Navigation Bar -->
            <nav class="nav-container">
                <div class="max-w-7xl mx-auto px-4">
                    <div class="flex justify-between items-center h-16">
                        <div class="flex items-center">
                            <div class="logo-container">
                                <span class="logo-text">ZACSON</span>
                            </div>
                            <div class="hidden md:flex items-center space-x-4 ml-10">
                                <a href="#" class="nav-link">HOME</a>
                                <a href="#about" class="nav-link">ABOUT</a>
                                <a href="#features" class="nav-link">FEATURES</a>

                                <a href="#programs" class="nav-link">PROGRAMS</a>
                                <a href="#contact" class="nav-link">CONTACT</a>
                                <!-- Courses button (hidden by default) -->
                                <div id="coursesButton" class="hidden">
                                    <a href="courses.jsp" class="nav-link">MY COURSES</a>
                                </div>
                            </div>
                        </div>
                        <div class="flex items-center space-x-4">
                            <!-- Admin Login Button -->
                            <div id="adminLoginBtn" class="relative">
                                <a href="admin-login.jsp" class="admin-login">
                                    <span class="crown-icon">👑</span>
                                    Admin Login
                                </a>
                            </div>
                            <!-- Trainer Login Button -->
                            <div id="trainerLoginBtn" class="relative">
                                <a href="trainer-login.jsp" class="trainer-login">
                                    <span class="trainer-icon">🏋️</span>
                                    Trainer Login
                                </a>
                            </div>
                            <!-- Member Login Button -->
                            <div id="memberLoginBtn" class="relative">
                                <a href="member-login.jsp" class="member-login">
                                    <span class="member-icon">🔐</span>
                                    Member Login
                                </a>
                            </div>
                            <!-- Member Signup Button -->
                            <div id="signupBtn" class="relative">
                                <a href="signup.jsp" class="member-signup">
                                    <span class="member-icon">💪</span>
                                    Member Signup
                                </a>
                            </div>
                            <!-- Logout Button (Hidden by default) -->
                            <div id="logoutBtn" class="relative hidden">
                                <button onclick="handleLogout()" class="member-login">
                                    <span class="member-icon">🚪</span>
                                    Logout
                                </button>
                            </div>
                            <!-- Profile Button (Hidden by default) -->
                            <div id="profileBtn" class="relative hidden">
                                <a href="<%= request.getContextPath() %>/profile" class="admin-login">
                                    <span class="member-icon">👤</span>
                                    Profile
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>

            <!-- Hero Section -->
            <section class="hero-section">
                <div class="hero-content">
                    <h2 class="hero-subtitle">HI THIS IS ZACSON</h2>
                    <h1 class="hero-title">GYM TRAINER</h1>
                    <a href="#courses" class="join-button">MY COURSES</a>
                </div>
            </section>

            <!-- Training Programs Section -->
            <section class="programs-section">
                <div class="container mx-auto px-4">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                        <div class="program-card">
                            <h3 class="program-title">PERSONAL TRAINING</h3>
                            <p class="program-description">You'll look at graphs and charts Task One, how to approach
                                the task and the language needed for a successful answer.</p>
                            <a href="#" class="join-button mt-6">VIEW COURSES</a>
                        </div>
                        <div class="program-card">
                            <h3 class="program-title">GROUP TRAINING</h3>
                            <p class="program-description">You'll look at graphs and charts Task One, how to approach
                                the task and the language needed for a successful answer.</p>
                            <a href="#" class="join-button mt-6">VIEW COURSES</a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Features Section -->
            <section id="features" class="py-20 bg-black">
                <div class="container mx-auto px-4">
                    <h2 class="section-title text-center mb-16">Our Features</h2>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                        <div class="feature-card">
                            <div class="program-icon">🏋️</div>
                            <h3 class="text-xl font-bold mb-4">Expert Trainers</h3>
                            <p>Professional guidance for your fitness journey with personalized attention</p>
                        </div>
                        <div class="feature-card">
                            <div class="program-icon">💪</div>
                            <h3 class="text-xl font-bold mb-4">Modern Equipment</h3>
                            <p>State-of-the-art facilities for optimal training and results</p>
                        </div>
                        <div class="feature-card">
                            <div class="program-icon">🎯</div>
                            <h3 class="text-xl font-bold mb-4">Custom Programs</h3>
                            <p>Personalized workout plans tailored to your specific goals</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Programs Section -->
            <section id="programs" class="py-20 bg-black">
                <div class="container mx-auto px-4">
                    <h2 class="section-title text-center mb-16">Our Programs</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                        <div class="program-card">
                            <div class="program-icon">💪</div>
                            <h3 class="text-xl font-bold mb-4">Strength Building</h3>
                            <p>Professional strength training programs</p>
                        </div>
                        <div class="program-card">
                            <div class="program-icon">🧘</div>
                            <h3 class="text-xl font-bold mb-4">Yoga & Meditation</h3>
                            <p>Find your inner peace and flexibility</p>
                        </div>
                        <div class="program-card">
                            <div class="program-icon">🏃</div>
                            <h3 class="text-xl font-bold mb-4">Crossfit</h3>
                            <p>Dynamic workouts for full body fitness</p>
                        </div>
                        <div class="program-card">
                            <div class="program-icon">👤</div>
                            <h3 class="text-xl font-bold mb-4">Personal Training</h3>
                            <p>One-on-one coaching for your goals</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Contact Section -->
            <section id="contact" class="py-20 bg-black">
                <div class="container mx-auto px-4">
                    <h2 class="section-title text-center mb-16">Contact Us</h2>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                        <div class="contact-card">
                            <div class="icon-wrapper">
                                <span class="text-3xl">📞</span>
                            </div>
                            <h3 class="text-xl font-bold mb-4">Contact Us</h3>
                            <p class="contact-info">
                                <span class="text-red-500">📱</span>
                                0111234567
                            </p>
                            <p class="contact-info">
                                <span class="text-blue-500">✉️</span>
                                info@fitnesscenter.com
                            </p>
                        </div>
                        <div class="contact-card">
                            <div class="icon-wrapper">
                                <span class="text-3xl">📍</span>
                            </div>
                            <h3 class="text-xl font-bold mb-4">Location</h3>
                            <p class="contact-info">
                                <span class="text-pink-500">📍</span>
                                235/6/1, Kandy Road
                            </p>
                            <p class="contact-info">
                                <span class="text-purple-500">🏢</span>
                                Malabe
                            </p>
                        </div>
                        <div class="contact-card">
                            <div class="icon-wrapper">
                                <span class="text-3xl">⏰</span>
                            </div>
                            <h3 class="text-xl font-bold mb-4">Hours</h3>
                            <p class="contact-info">
                                <span class="text-yellow-500">🌞</span>
                                Mon-Fri: 6:00 AM - 10:00 PM
                            </p>
                            <p class="contact-info">
                                <span class="text-orange-500">🌅</span>
                                Sat-Sun: 8:00 AM - 8:00 PM
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- About Section -->
            <section id="about" class="py-20 bg-black">
                <div class="container mx-auto px-4">
                    <h2 class="section-title text-center mb-16">About Us</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                        <div class="feature-card">
                            <div class="program-icon">💪</div>
                            <h3 class="text-xl font-bold mb-4">Our Mission</h3>
                            <p>At ZACSON, we are dedicated to helping you achieve your fitness goals through
                                personalized training programs and expert guidance. Our state-of-the-art facility and
                                experienced trainers are here to support your journey to a healthier lifestyle.</p>
                        </div>
                        <div class="feature-card">
                            <div class="program-icon">🎯</div>
                            <h3 class="text-xl font-bold mb-4">Our Vision</h3>
                            <p>We strive to create a welcoming and motivating environment where everyone can work
                                towards their fitness goals. Our commitment to excellence and personalized attention
                                ensures that each member receives the support they need to succeed.</p>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- Copyright Section -->
        <footer class="py-4" style="background: rgba(0, 0, 0, 0.9); backdrop-filter: blur(10px);">
            <div class="container mx-auto px-4">
                <p class="text-center text-sm" style="color: rgba(255, 255, 255, 0.7);">
                    Copyright © 2025 ZACSON
                </p>
            </div>
        </footer>
    </body>

    </html>