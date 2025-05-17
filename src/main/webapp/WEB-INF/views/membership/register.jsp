<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register for Membership</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600&display=swap" rel="stylesheet">
</head>
<body style="min-height:100vh; margin:0; background:linear-gradient(135deg, #f8fff8 0%, #e6fff3 100%); font-family:'Poppins', Arial, sans-serif;">
  <div style="display:flex; align-items:center; justify-content:center; min-height:100vh;">
    <div class="center-card" style="max-width:420px; margin:0 auto; background:#fff; border-radius:24px; box-shadow:0 8px 32px rgba(60,180,120,0.13); padding:0; text-align:center;">
      <div class="card-header" style="background:linear-gradient(90deg, #3ecb7b 0%, #ffe259 100%); border-radius:24px 24px 0 0; padding:28px 0 18px 0; color:#fff; font-size:1.4rem; font-weight:700; margin:0; display:flex; flex-direction:column; align-items:center;">
        <span style="display:flex; align-items:center; justify-content:center; gap:10px;">
          <i class="fas fa-dumbbell"></i>
          <span>Register for Membership</span>
        </span>
        <span style="font-size:2.7rem; display:block; margin-top:10px;">💪</span>
      </div>
      <c:choose>
        <c:when test="${not empty plan}">
          <h5 class="mb-1 mt-3" style="font-weight:700;">${plan.name}</h5>
          <div class="mb-2" style="color:#555; font-size:1rem;">${plan.durationInMonths} Month<c:if test="${plan.durationInMonths > 1}">s</c:if> - ${plan.description}</div>
          <div class="mb-3" style="font-size:1.3rem; font-weight:600; color:#222;">$${plan.price}</div>
        </c:when>
        <c:otherwise>
          <div style="color:red; font-weight:bold;">Invalid or missing plan selected.</div>
        </c:otherwise>
      </c:choose>
      <form action="${pageContext.request.contextPath}/membership/register" method="post" style="margin-top:18px; padding:0 24px 24px 24px;">
        <input type="hidden" name="planId" value="${param.planId}">
        <div class="mb-2" style="text-align:left;">
          <label class="form-label" for="fullName">Full Name</label>
          <input type="text" id="fullName" name="name" class="form-control" required>
        </div>
        <div class="mb-2" style="text-align:left;">
          <label class="form-label" for="email">Email</label>
          <input type="email" id="email" name="email" class="form-control" required>
        </div>
        <div class="mb-2" style="text-align:left;">
          <label class="form-label" for="phone">Phone Number</label>
          <input type="text" id="phone" name="phone" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success w-100" style="margin-top:8px;">Register</button>
        <a href="${pageContext.request.contextPath}/membership-plans" class="btn btn-secondary w-100 mt-2">Back to Plans</a>
      </form>
    </div>
  </div>
</body>
</html> 