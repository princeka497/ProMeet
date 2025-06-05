<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,ProMeet.utilities.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Expert Tips</title>
    <%@include file="/common_html/all_css.html" %>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        /* Page Background */
        body {
            background: linear-gradient(135deg, #141E30, #243B55);
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Main Form Container */
        .form-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 15px;
            width: 100%;
            max-width: 500px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: transform 0.3s ease-in-out;
        }

        /* Hover effect */
        .form-container:hover {
            transform: scale(1.03);
        }

        /* Title Styling */
        .form-container h2 {
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: bold;
            color: #fff;
        }

        /* Textarea */
        textarea {
            width: 100%;
            height: 150px;
            border-radius: 10px;
            border: none;
            padding: 15px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            outline: none;
            transition: 0.3s;
        }

        /* Placeholder Color */
        textarea::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        /* Focus Effect */
        textarea:focus {
            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        /* Submit Button */
        .submit-btn {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            border-radius: 25px;
            width: 100%;
            transition: 0.3s ease-in-out;
            cursor: pointer;
        }

        .submit-btn:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            box-shadow: 0px 5px 15px rgba(255, 75, 43, 0.4);
        }

        /* Alert Box */
        .alert {
            margin-bottom: 15px;
            color: white;
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            padding: 10px;
            border-radius: 5px;
        }

        /* Sticky Footer */
        footer {
            width: 100%;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            left: 0;
            font-size: 14px;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .form-container {
                padding: 20px;
            }
            .form-container h2 {
                font-size: 20px;
            }
        }

    </style>
</head>
<body>

<%
    String email = (String) session.getAttribute("sessionEmail");
    if (email == null || session.isNew()) {
        request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
        RequestDispatcher rd = request.getRequestDispatcher("/expert/expert_login.jsp");
        rd.forward(request, response);
    }
    else{
    	ExpertDao dao=new ExpertDao();
    	Expert e=dao.expertProfile(email);
    	String uploadPath=request.getContextPath();
    	System.out.println("path is" +uploadPath);
    	String imagePath=uploadPath+"/"+e.getProfile_pic();
    	System.out.println("Actual Image Path is " +imagePath);
    	String docPath=uploadPath+"/"+e.getVerification_document();
    	System.out.println("Actual Document Path is " + docPath);
    %>

<%@include file="/expert/expert_header.html"%>

<!-- Expert Tips Form -->
<div class="form-container">
    <h2>💡 Share Your Expert Tips</h2>

    <% String mess = (String) request.getAttribute("message");
        if (mess != null) { %>
        <div class="alert alert-dismissible fade show" role="alert">
            <%= mess %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>

    <form action="/ProMeet/AddTips" method="post" novalidate class="needs-validation">
        <div class="mb-3">
            <textarea placeholder="Enter your expert advice here..." name="content" required></textarea>
        </div>
        <button type="submit" class="submit-btn">📩 Submit Tip</button>
    </form>
</div>
<%} %>
<br><br><br><br>
<!-- Footer -->
<%@include file="/WEB-INF/common/footer.html" %>

<script src="/ProMeet/js/validation.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
