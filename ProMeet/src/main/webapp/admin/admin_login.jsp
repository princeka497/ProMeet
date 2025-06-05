<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <%@include file="/common_html/all_css.html" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    

    <style>
      
        html, body {
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        
        body {
            background: linear-gradient(to right, #1f1c2c, #928dab);
            color: white;
            font-family: 'Poppins', sans-serif;
        }

        
        .login-form {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            padding: 30px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
            animation: fadeIn 1s ease-in-out;
        }

      
        .input-group-text {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
            border-radius: 10px 0 0 10px;
        }

        .form-control {
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.5);
            background: transparent;
            color: white;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .form-control:focus {
            border-color: #ff9800;
            box-shadow: 0px 0px 10px #ff9800;
        }

        
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

       
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

       
        .footer-container {
            margin-top: auto;
        }

        

        
        @media (max-width: 768px) {
            .login-form {
                width: 90%;
            }
        }

    .custom-header {
        background: linear-gradient(to right, #1f1c2c, #535a7b);
        padding: 15px 25px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
        position: sticky;
        top: 0;
        z-index: 1050;
    }

    .navbar-brand {
        color: #fff;
        font-size: 26px;
        font-weight: bold;
        text-transform: uppercase;
        
    }

    .logo-icon {
        color: red;
        font-size: 32px;
    }

    .custom-toggler {
        border: none;
        background: transparent;
    }

    .custom-toggler:focus {
        outline: none;
        box-shadow: none;
    }

    .custom-offcanvas {
        background: #2a2d34;
        color: white;
        width: 250px;
    }

    .offcanvas-header {
        background: #1e1f23;
        padding: 15px;
    }
        
    </style>
</head>
<body>

    <div class="container-fluid custom-header d-flex justify-content-between align-items-center">
    <div class="flex-grow-1 d-flex justify-content-center">
        <h2 class="navbar-brand m-0 d-flex align-items-center gap-2">
            <i class="fas fa-user-circle logo-icon"></i>
            Admin Portal
        </h2>
    </div>
</div>

    <%
        String m = (String) request.getAttribute("msg");
        if (m != null) {
    %>
    <div class="alert alert-warning alert-dismissible fade show text-center" role="alert">
        <strong><%= m %></strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <%
        }
    %>

    <!-- 📜 Centered Login Form -->
    <div class="container d-flex justify-content-center align-items-center flex-grow-1">
        <form action="/ProMeet/AdminLogin" method="post" class="login-form">
            <h2 class="text-warning mb-4">Admin Login</h2>

            <!-- Email Input -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                <input type="email" name="adminEmail" placeholder="Enter Email Here" class="form-control" required>
            </div>

            <!-- Password Input -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-key"></i></span>
                <input type="password" name="adminPass" placeholder="Enter Password Here" class="form-control" required>
            </div>

            <!-- Submit Button -->
            <button class="btn btn-submit">
                <i class="fa fa-lock"></i> Submit
            </button>
        </form>
    </div>

   
    <div class="footer-container">
        <%@include file="/WEB-INF/common/footer.html" %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
