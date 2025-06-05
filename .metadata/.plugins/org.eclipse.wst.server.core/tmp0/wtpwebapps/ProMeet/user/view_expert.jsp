<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,ProMeet.utilities.*"%>
<%


response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at theproxyserver
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Expert</title>
    <%@include file="/common_html/all_css.html"%>

    <style>
        /* 🌟 Light & Dark Mixed Theme */
        body {
            background: linear-gradient(to right, #1e1e2f, #4e4e75);
            color: white;
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* 🚀 Centered Glassmorphism Form */
        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 12px;
            padding: 30px;
            width: 400px;
            text-align: center;
            margin: auto;
            margin-top: 100px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
            animation: fadeIn 1s ease-in-out;
        }

        /* 🔳 Input Fields */
        .input-group-text {
            background: #222;
            color: white;
            border-radius: 10px 0 0 10px;
        }

        .form-select {
            border-radius: 10px;
            border: 1px solid #ccc;
        }

        .form-select:focus {
            border-color: #ff9800;
            box-shadow: 0px 0px 10px #ff9800;
        }

        /* 🔘 Stylish Button */
        .btn-submit {
            background: linear-gradient(45deg, #ff9800, #ff5722);
            color: white;
            font-weight: bold;
            padding: 12px;
            width: 100%;
            border-radius: 10px;
            transition: 0.3s ease-in-out;
            border: none;
        }

        .btn-submit:hover {
            background: linear-gradient(45deg, #ff5722, #ff9800);
        }

        /* 🎭 Fade-in Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }


        .footer-container {
            margin-top: auto;
            
        }

   
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <%@include file="/user/user_header.html"%>

    <%
        String m = (String) request.getAttribute("eList");
        if (m != null) {
    %>
    <div class="alert alert-warning alert-dismissible fade show text-center" role="alert">
        <strong><%= m %></strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <%
        }
    %>
    <div class="container">
        <h2 class="text-warning mb-3">Find an Expert</h2>
<br>
        <form action="/ProMeet/View_expert" method="post">
            <!-- Expert Type -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-portrait"></i></span>
                <select name="expert_type" class="form-select" required>
                    <option value="" selected disabled>Select Your Expert Type</option>
                    <option value="Yoga Expert">Yoga Expert</option>
                    <option value="Dietician Expert">Dietician Expert</option>
                    <option value="Doctor">Doctor</option>
                    <option value="Lawyer">Lawyer</option>
                    <option value="Gym Trainer">Gym Trainer</option>
                </select>
                <div class="invalid-feedback">Please Provide Your Expert Type</div>
            </div>

            <!-- Submit Button -->
            <button class="btn btn-submit">
                <i class="fas fa-search"></i> Search Expert
            </button>
        </form>
    </div>

    <div class="footer-container">
        <%@include file="/WEB-INF/common/footer.html"%>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
