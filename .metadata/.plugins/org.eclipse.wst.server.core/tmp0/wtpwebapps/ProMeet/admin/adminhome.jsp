<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <%@include file="/common_html/all_css.html" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- FontAwesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        /* General Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            text-align: center;
        }

        .dashboard-title {
            font-size: 32px;
            font-weight: bold;
            text-transform: uppercase;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        /* Admin Dashboard Layout */
        .dashboard-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .dashboard-card {
            background: white;
            width: 250px;
            height:250px;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            color: black;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            color: white;
        }

        .dashboard-card i {
            font-size: 40px;
            margin-bottom: 10px;
        }

        .dashboard-card p {
            font-size: 18px;
            font-weight: bold;
            margin: 0;
        }
        .dashboard-card i ,dashboard-card p {
        margin-top: 90px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-container {
                flex-direction: column;
                align-items: center;
            }

            .dashboard-card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <%@include file="/admin/admin_header.html"%>

    <div class="container">
        <h2 class="dashboard-title">Admin Dashboard</h2>
<br>
        <div class="dashboard-container">
            <!-- Manage Users -->
            <div class="dashboard-card">
                <i class="fas fa-users"></i>
                <p><a href="/ProMeet/admin/all_user.jsp" style="text-decoration: none;">Manage Users</a> </p>
            </div>

            <!-- Manage Experts -->
            <div class="dashboard-card">
                <i class="fas fa-user-tie"></i>
                <p><a href="/ProMeet/admin/all_expert.jsp" style="text-decoration: none;">Manage Experts</a></p>
            </div>

            <!-- View Feedback -->
            <div class="dashboard-card">
                <i class="fas fa-comments"></i>
                <p><a href="/ProMeet/admin/all_feedback.jsp" style="text-decoration: none;">View Feedback</a></p>
            </div>

            <!-- Manage Appointments -->
            <div class="dashboard-card">
                <i class="fas fa-calendar-check"></i>
                <p><a href="/ProMeet/admin/all_contact.jsp" style="text-decoration: none;">Manage Contacts</a></p>
            </div>
            
</div>
<h3>Contact Graphs</h3>
<%@include file="/admin/contact_count.jsp" %>
<h3>Feedback Ratings</h3>
<%@include file="/admin/pie_chart.jsp" %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>
</html>
