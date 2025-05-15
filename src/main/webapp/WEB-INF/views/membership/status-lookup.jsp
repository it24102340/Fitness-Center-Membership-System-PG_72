<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Membership Status - Fitness Center</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(67,185,127,0.08), rgba(249,212,35,0.08)), url('https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=1200&q=80') center center/cover no-repeat;
            min-height: 100vh;
        }
        .status-hero {
            text-align: center;
            margin-top: 3rem;
            margin-bottom: 2.5rem;
        }
        .status-hero-icon {
            background: #fff;
            border-radius: 50%;
            box-shadow: 0 4px 16px rgba(67,185,127,0.13);
            width: 80px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.2rem auto;
        }
        .status-hero-icon i {
            font-size: 2.5rem;
            color: #43b97f;
        }
        .status-hero-title {
            font-size: 2rem;
            font-weight: 700;
            color: #222;
            margin-bottom: 0.5rem;
        }
        .status-hero-desc {
            color: #555;
            font-size: 1.1rem;
            margin-bottom: 0;
        }
        .card {
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(67,185,127,0.10);
            animation: fadeInUp 0.8s;
        }
        .card-header {
            background: linear-gradient(90deg, #43b97f 0%, #f9d423 100%);
            color: #fff;
            border-radius: 20px 20px 0 0;
        }
        .btn-primary {
            background: linear-gradient(90deg, #43b97f 0%, #36d1c4 100%);
            border: none;
            font-weight: 600;
            font-size: 1.1rem;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(67,185,127,0.13);
            transition: background 0.2s;
        }
        .btn-primary:hover {
            background: #2e8b57;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="status-hero">
        <div class="status-hero-icon">
            <i class="fas fa-id-card"></i>
        </div>
        <div class="status-hero-title">Check Your Membership Status</div>
        <div class="status-hero-desc">Enter your email address to view your current membership details.</div>
    </div>
    <div class="container pb-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h3><i class="fas fa-search me-2"></i>Membership Status Lookup</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="${pageContext.request.contextPath}/membership/status">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100"><i class="fas fa-search me-2"></i>Check Status</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 