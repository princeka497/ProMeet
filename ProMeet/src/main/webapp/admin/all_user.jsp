<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Details</title>
<%@include file="/common_html/all_css.html"%>
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f8f9fa;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }
    .container {
        max-width: 90%;
        flex: 1;
    }
    .table {
        border-radius: 10px;
        overflow: hidden;
    }
    .table thead {
        background-color: #343a40;
        color: white;
    }
    .table-hover tbody tr:hover {
        background-color: #f1f1f1;
    }
    .profile-pic {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        object-fit: cover;
    }
    h2 {
        font-weight: bold;
        color: #dc3545;
        margin-top: 20px;
    }
    .footer {
        margin-top: auto;
    }
</style>
</head>
<body>
<%@include file="/admin/admin_header.html"%>

<div class="container mt-5">
    <div class="text-center text-danger">
        <h3>User Details</h3>
    </div>
    
    <% AdminDao dao = new AdminDao();
       ArrayList<User> userList = dao.viewAllUser();
       if (userList.size() > 0) { %>
        
        <h2 class="text-center">All User List</h2>
        <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered shadow-lg text-center">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Profile Picture</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (User u : userList) { %>
                    <tr>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getPassword() %></td>
                        <td><%= u.getName() %></td>
                        <td><%= u.getPhone() %></td>
                        <td><%= u.getAddress() %></td>
                        <td>
                        <%  String uploadPath = request.getContextPath();
                        String imagePath = uploadPath + "/" + u.getProfile_pic(); %>
                            <img src="<%=  imagePath%>" alt="Profile" class="profile-pic">
                        </td>
                        <td><%= u.getDate() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    <% } else { %>
        <h2 class="text-center text-muted">No Users Found</h2>
    <% } %>
</div>

<div class="footer">
    <%@include file="/WEB-INF/common/footer.html" %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
