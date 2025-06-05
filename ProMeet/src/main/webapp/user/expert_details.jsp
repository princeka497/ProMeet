<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,java.util.*,ProMeet.utilities.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expert Details</title>
    <%@include file="/common_html/all_css.html"%>
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            font-family: 'Poppins', sans-serif;
        }

        .container {
            margin-top: 80px;
        }

        .expert-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .expert-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.3);
        }

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .expert-details p {
            margin: 5px 0;
            font-weight: 500;
        }

        .meet-btn {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            border-radius: 25px;
            transition: all 0.3s ease-in-out;
            text-decoration: none;
            display: inline-block;
            width: 100%;
        }

        .meet-btn:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            box-shadow: 0px 5px 15px rgba(255, 75, 43, 0.4);
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 10px;
            }
        }
    </style>
</head>
<body>

    <%@include file="/user/user_header.html"%>

    <%
    String email = (String) session.getAttribute("sessionEmail");
    if (email == null || session.isNew()) {
        request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
        RequestDispatcher rd = request.getRequestDispatcher("/user/user_login.jsp");
        rd.forward(request, response);
    } else {
        UserDao dao1 = new UserDao();
        User u = dao1.userProfile(email);
        String uploadPath = request.getContextPath();
        String imagePath = uploadPath + "/" + u.getProfile_pic();
    %>

    <div class="container">
        <h2 class="text-center text-white">Find an Expert</h2>
        <%	
        String expert_type = request.getParameter("expert_type");
        if (expert_type == null || expert_type.trim().isEmpty()) {
            expert_type = "default";
        }

        UserDao dao = new UserDao();
        ArrayList<Expert> expertList = dao.searchExpert(expert_type);

        if (expertList != null && !expertList.isEmpty()) {
        %>

        <div class="row mt-4">
            <%
            for (Expert e : expertList) {
            %>
            <div class="col-md-4 col-sm-6 mb-4">
                <div class="expert-card">
                    <img class="profile-image" src="<%= imagePath %>" alt="Profile Image">
                    <div class="expert-details">
                        <p><strong>Name:</strong> <%= e.getName() %></p>
                        <p><strong>Phone:</strong> <%= e.getPhone() %></p>
                        <p><strong>City:</strong> <%= e.getCity() %></p>
                        <p><strong>Expert Type:</strong> <%= e.getExpert_type() %></p>
                    </div>
                    <a href="/ProMeet/user/meetingrequest.jsp?exp_email=<%=e.getEmail() %>" class="meet-btn">Meet</a>
                </div>
            </div>
            <%
            }
            %>
        </div>

        <%
        } else {
        %>
            <p class="text-center text-white">No experts found for "<%= expert_type %>".</p>
        <%
        }
        %>
    </div>

    <% } %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
