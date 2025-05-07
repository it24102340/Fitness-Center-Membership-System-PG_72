<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Membership Status - Fitness Center</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
        <div class="container">
            <a class="navbar-brand" href="<c:url value='/'/>">Fitness Center</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/membership-plans'/>">Plans</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<c:url value='/membership-plans/status'/>">My Membership</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="membership-header text-center mb-5">
            <h1>Your Membership Status</h1>
            <p class="lead">Track and manage your fitness journey with us</p>
        </div>

        <c:if test="${not empty member}">
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card membership-card h-100">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="card-title mb-0">${member.firstName} ${member.lastName}</h4>
                                <span class="badge ${member.status == 'ACTIVE' ? 'bg-success' : 'bg-danger'} status-badge">
                                    ${member.status}
                                </span>
                            </div>
                            
                            <div class="member-info">
                                <p><i class="fas fa-envelope me-2"></i>${member.email}</p>
                                <p><i class="fas fa-phone me-2"></i>${member.phone}</p>
                            </div>

                            <div class="current-plan mt-4">
                                <h5><i class="fas fa-dumbbell me-2"></i>Current Plan</h5>
                                <div class="plan-details p-3 bg-light rounded">
                                    <p class="mb-2"><strong>Plan:</strong> 
                                      <c:choose>
                                        <c:when test="${member.currentPlan != null}">
                                          ${member.currentPlan.name}
                                        </c:when>
                                        <c:otherwise>
                                          N/A
                                        </c:otherwise>
                                      </c:choose>
                                    </p>
                                    <p class="mb-2"><strong>Start Date:</strong> ${member.startDate}</p>
                                    <p class="mb-2"><strong>End Date:</strong> ${member.endDate}</p>
                                    <p class="mb-0"><strong>Price:</strong> $
                                      <c:choose>
                                        <c:when test="${member.currentPlan != null}">
                                          ${member.currentPlan.price}
                                        </c:when>
                                        <c:otherwise>
                                          N/A
                                        </c:otherwise>
                                      </c:choose>
                                    </p>
                                </div>
                            </div>

                            <div class="membership-history mt-4">
                                <h5><i class="fas fa-history me-2"></i>Membership History</h5>
                                <div class="history-timeline">
                                    <c:forEach var="history" items="${member.membershipHistory}">
                                        <div class="history-item p-2 border-start border-primary">
                                            <p class="mb-1"><strong>${history.planName}</strong></p>
                                            <small class="text-muted">${history.startDate} - ${history.endDate}</small>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="action-buttons mt-4">
                                <c:choose>
                                    <c:when test="${member.status == 'ACTIVE'}">
                                        <a href="<c:url value='/membership-plans/upgrade/${member.id}'/>" class="btn btn-custom">
                                            <i class="fas fa-arrow-up me-2"></i>Upgrade Plan
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="<c:url value='/membership-plans'/>" class="btn btn-success">
                                            <i class="fas fa-sync me-2"></i>Renew Membership
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${empty member}">
            <div class="text-center mt-5">
                <div class="empty-state">
                    <i class="fas fa-user-plus fa-4x mb-3 text-muted"></i>
                    <h3>No Active Memberships</h3>
                    <p class="text-muted">Start your fitness journey today!</p>
                    <a href="<c:url value='/membership-plans'/>" class="btn btn-custom mt-3">
                        View Available Plans
                    </a>
                </div>
            </div>
        </c:if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 