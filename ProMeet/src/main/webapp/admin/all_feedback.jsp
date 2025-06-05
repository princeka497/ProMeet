<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Details</title>
    <%@include file="/common_html/all_css.html"%>
    <style>
        /* General Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #acb6e5);
            margin: 0;
            padding: 0;
        }

        /* Responsive Container */
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            text-align: center;
        }

        /* Feedback Heading */
        .title {
            font-size: 32px;
            font-weight: bold;
            text-transform: uppercase;
            color: #fff;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        /* Feedback Cards Layout */
        .feedback-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        /* Individual Feedback Box */
        .feedback-box {
            background: #ffffff;
            width: 280px;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .feedback-box:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            color: white;
        }

        /* Text Styling Inside the Box */
        .feedback-box p {
            margin: 10px 0;
            font-size: 16px;
            font-weight: bold;
        }

        .remark {
            font-size: 18px;
            color: #ff4b5c;
            font-weight: bold;
        }

        .rating {
            font-size: 20px;
            color: #ffa502;
        }

        .user-name {
            font-size: 18px;
            font-style: italic;
            color: #40739e;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .feedback-container {
                flex-direction: column;
                align-items: center;
            }

            .feedback-box {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <%@include file="/admin/admin_header.html"%>

    <div class="container">
        <h2 class="title">User Feedback & Ratings</h2>

        <%
        AdminDao dao = new AdminDao();
        ArrayList<Feedback> feedbackList = dao.viewAllFeedback();
        if (feedbackList.size() > 0) {
        %>
        
        <div class="feedback-container">
            <% for (Feedback f : feedbackList) { %>
            <div class="feedback-box">
                <p class="remark">"<%= f.getRemark() %>"</p>
                <p class="rating">⭐ Rating: <%= f.getRating() %> / 5</p>
                <p class="user-name">🙍‍♂️ Given By: <%= f.getName() %></p>
            </div>
            <% } %>
        </div>

        <% } else { %>
            <p style="color: white; font-size: 20px;">No feedback available at the moment.</p>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>
</html>
