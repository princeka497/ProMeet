<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expert Details</title>
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
    .profile-pic, .doc-pic {
        width: 60px;
        height: 60px;
        border-radius: 10%;
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
        <h3>Expert Details</h3>
    </div>
    
    <% AdminDao dao = new AdminDao();
       ArrayList<Expert> expertList = dao.viewAllExpert();
       if (expertList.size() > 0) { %>
        
        <h2 class="text-center">All Expert List</h2>
        <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered shadow-lg text-center">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>City</th>
                        <th>Expert Type</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th>Profile Picture</th>
                        <th>Verification Document</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Expert e : expertList) { %>
                    <tr>
                        <td><%= e.getEmail() %></td>
                        <td><%= e.getPassword() %></td>
                        <td><%= e.getName() %></td>
                        <td><%= e.getPhone() %></td>
                        <td><%= e.getCity() %></td>
                        <td><%= e.getExpert_type() %></td>
                        <td><%= e.getGender() %></td>
                        <td><%= e.getAddress() %></td>
                        <td>
                        
                        <%String uploadPath=request.getContextPath();
                    	System.out.println("path is" +uploadPath);
                    	String imagePath=uploadPath+"/"+e.getProfile_pic();
                    	System.out.println("Actual Image Path is " +imagePath);
                    	String docPath=uploadPath+"/"+e.getVerification_document();
                    	System.out.println("Actual Document Path is " + docPath); %>
                            <img src="<%=imagePath  %>" alt="Profile" class="profile-pic">
                        </td>
                        <td>
                            <img src="<%=docPath %>" alt="Document" class="doc-pic">
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    <% } else { %>
        <h2 class="text-center text-muted">No Experts Found</h2>
    <% } %>
</div>

<div class="footer">
    <%@include file="/WEB-INF/common/footer.html" %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
