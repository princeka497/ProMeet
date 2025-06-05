<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="promeet_web.dao.*,promeet_web.beans.*,ProMeet.utilities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expert Dashboard</title>

<!-- Include common CSS (Bootstrap etc.) -->
<%@ include file="/common_html/all_css.html" %>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Playfair+Display:wght@600&display=swap" rel="stylesheet">

<style>
  body {
    font-family: 'Poppins', sans-serif;
    background-color: #f4f6f9;
    color: #333;
  }

  .main-body {
    margin-top: 120px;
    display: flex;
    justify-content: center;
    padding: 20px;
  }

  .card {
    border: none;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 0 30px rgba(0,0,0,0.1);
    background-color: #fff;
    transition: all 0.3s ease-in-out;
  }

  .card:hover {
    transform: scale(1.02);
  }

  .profile-header {
    background: linear-gradient(to right, #1e3c72, #2a5298);
    height: 160px;
  }

  .profile-image {
    height: 180px;
    width: 180px;
    border: 6px solid #fff;
    border-radius: 50%;
    object-fit: cover;
    margin-top: -90px;
    box-shadow: 0 8px 15px rgba(0,0,0,0.2);
    background-color: #fff;
  }

  .card-title {
    font-family: 'Playfair Display', serif;
    font-size: 26px;
    font-weight: 600;
    color: #2c3e50;
    margin-top: 15px;
  }

  .card-text {
    font-size: 15px;
    color: #555;
    margin-bottom: 8px;
  }

  .card-text i {
    color: #2a5298;
    margin-right: 5px;
  }

  a.text-decoration-none {
    color: #2a5298;
    font-weight: 500;
  }

  a.text-decoration-none:hover {
    text-decoration: underline;
  }
</style>
</head>
<body>
<%
  String email = (String) session.getAttribute("sessionEmail");
  if(email == null || session.isNew()){
      request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
      RequestDispatcher rd = request.getRequestDispatcher("/expert/expert_login.jsp");
      rd.forward(request, response);
  } else {
      ExpertDao dao = new ExpertDao();
      Expert e = dao.expertProfile(email);
      String uploadPath = request.getContextPath();
      String imagePath = uploadPath + "/" + e.getProfile_pic();
      String docPath = uploadPath + "/" + e.getVerification_document();
%>

<!-- Header/Navbar -->
<%@ include file="/expert/expert_header.html" %>

<!-- Profile Card -->
<div class="main-body">
  <div class="card text-center" style="width: 100%; max-width: 400px;">
    
    <!-- Profile Banner -->
    <div class="profile-header"></div>
    
    <!-- Profile Image -->
    <div class="text-center">
      <img src="<%=imagePath %>" alt="Profile Picture" class="profile-image">
    </div>

    <div class="card-body">
      <h5 class="card-title">Hello, <%= e.getName() %></h5>
     <p class="card-text"><i class="fas fa-envelope"></i> <%= e.getEmail() %></p>
<p class="card-text"><i class="fas fa-phone"></i> <%= e.getPhone() %></p>
<p class="card-text"><i class="fas fa-city"></i> <%= e.getCity() %></p>
<p class="card-text"><i class="fas fa-map-marker-alt"></i> <%= e.getAddress() %></p>
<p class="card-text"><i class="fas fa-user-tie"></i> <%= e.getExpert_type() %></p>
<p class="card-text"><i class="fas fa-venus-mars"></i> <%= e.getGender() %></p>
<p class="card-text">
  <i class="fas fa-file-alt"></i> 
  <a href="<%= docPath %>" class="text-decoration-none" target="_blank">
    View Document
  </a>
</p>

    </div>
  </div>
</div>

<br>
<%@ include file="/WEB-INF/common/footer.html" %>
<% } %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>