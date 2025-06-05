<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,ProMeet.utilities.*"%>
<%


response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at theproxyserver
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Home</title>
    <%@include file="/common_html/all_css.html"%>

    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            font-family: 'Poppins', sans-serif;
            color: white;
        }

        .profile-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .profile-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 30px;
            width: 100%;
            max-width: 350px;
            text-align: center;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: transform 0.3s;
        }

        .profile-card:hover {
            transform: scale(1.05);
        }

        .profile-image {
            height: 120px;
            width: 120px;
            border-radius: 50%;
            border: 3px solid white;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .profile-card h2 {
            font-size: 22px;
            margin-bottom: 10px;
        }

        .profile-card p {
            font-size: 14px;
            margin: 5px 0;
            opacity: 0.9;
        }

        .btn-edit {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            font-weight: bold;
            color: white;
            border-radius: 20px;
            transition: all 0.3s ease-in-out;
        }

        .btn-edit:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            box-shadow: 0px 5px 15px rgba(255, 75, 43, 0.4);
        }

    </style>
</head>
<body>


    <%
        String email = (String) session.getAttribute("sessionEmail");
        String role=(String)session.getAttribute("role");
        if (email == null || session.isNew()) {
            request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
            RequestDispatcher rd = request.getRequestDispatcher("/user/user_login.jsp");
            rd.forward(request, response);
        } else {
        	
        	if(role.equalsIgnoreCase("user")){
            UserDao dao = new UserDao();
            User u = dao.userProfile(email);
            String uploadPath = request.getContextPath();
            String imagePath = uploadPath + "/" + u.getProfile_pic();
    %>

    <%@include file="/user/user_header.html"%>

    <div class="profile-container">
        <div class="profile-card">
            <img class="profile-image" src="<%=imagePath%>" alt="Profile Image">
            <h2>Hello, <%=u.getName()%></h2>
            <p><i class="far fa-envelope"></i> Email: <%=u.getEmail()%></p>
            <p><i class="fas fa-phone"></i> Phone: <%=u.getPhone()%></p>
            <p><i class="fas fa-city"></i> City: <%=u.getCity()%></p>
            <p><i class="fas fa-map-marker-alt"></i> Address: <%=u.getAddress()%></p>
            <a href="/ProMeet/user/user_EditProfile.jsp" class="btn btn-edit">Edit Profile</a>
        </div>
    </div>
<%} %>
    <% } %>

    <%@include file="/WEB-INF/common/footer.html"%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
