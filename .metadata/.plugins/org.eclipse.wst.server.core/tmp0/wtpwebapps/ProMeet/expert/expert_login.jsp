<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Expert Login</title>
    <%@include file="/common_html/all_css.html"%>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        /* ======= Fixed Navbar Styling ======= */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(10px);
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
            transition: 0.3s;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-weight: bold;
            transition: 0.3s;
        }

        .navbar a:hover {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }

        /* ======= Centering the Form ======= */
        body {
            background: linear-gradient(to right, #141E30, #243B55);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            flex-direction: column;
            padding-top: 60px; /* To avoid navbar overlap */
        }

        .container-wrapper {
            margin-bottom:10%;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
        }

        /* ======= Login Form Styling ======= */
        .login-form {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 30px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0px 5px 20px rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: transform 0.3s ease-in-out;
        }

        .login-form:hover {
            transform: scale(1.03);
        }

        .login-form h2 {
            color: #fff;
            font-size: 26px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        /* ======= Input Fields ======= */
        .input-group {
            margin-bottom: 15px;
        }

        .input-group-text {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
            padding: 10px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .form-control:focus {
            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        ::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        /* ======= Button Styling ======= */
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

        /* ======= Sticky Footer ======= */
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

        /* ======= Responsive Design ======= */
        @media (max-width: 600px) {
            .login-form {
                padding: 20px;
            }
            .login-form h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>

<!-- ======= Fixed Navbar ======= -->
<div class="navbar">
    <a href="#">🏠 Home</a>
    <a href="#">📖 About</a>
    <a href="#">📩 Contact</a>
</div>

<%@include file="/WEB-INF/common/navbar.html"%>

<%
    String m = (String) request.getAttribute("message");
    if (m != null) {
%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong><%= m %></strong>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<% } %>

<!-- ======= Centered Login Form ======= -->
<div class="container-wrapper">
    <div class="login-form">
        <h2>🔑 Expert Login</h2>
        <form action="/ProMeet/ExpertLogin" method="post">
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                <input type="email" name="email" placeholder="Enter Email" class="form-control" required>
            </div>

            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-key"></i></span>
                <input type="password" name="password" placeholder="Enter Password" class="form-control" required>
            </div>

            <button type="submit" class="submit-btn">🚀 Login</button>
        </form>
    </div>
</div>

<%@include file="/WEB-INF/common/footer.html" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
