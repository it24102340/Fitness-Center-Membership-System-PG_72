<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add New Membership Plan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #ff512f, #dd2476);
            min-height: 100vh;
        }
        .card {
            margin-top: 60px;
            background: rgba(255,255,255,0.9);
        }
        .form-label { color: #222; }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7">
                <div class="card shadow">
                    <div class="card-header text-center" style="background: #ff512f; color: #fff;">
                        <h2>Add New Membership Plan</h2>
                    </div>
                    <div class="card-body">
                        <form:form action="${pageContext.request.contextPath}/membership-plans" method="post" modelAttribute="plan">
                            <div class="mb-3">
                                <label class="form-label">Plan Name</label>
                                <form:input path="name" class="form-control" required="true"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <form:textarea path="description" class="form-control" rows="2" required="true"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Price ($)</label>
                                <form:input path="price" type="number" step="0.01" class="form-control" required="true"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Duration (months)</label>
                                <form:input path="durationInMonths" type="number" class="form-control" required="true"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Features (separate with semicolons)</label>
                                <form:input path="features" class="form-control" required="true"/>
                            </div>
                            <button type="submit" class="btn btn-success w-100">Save Plan</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 