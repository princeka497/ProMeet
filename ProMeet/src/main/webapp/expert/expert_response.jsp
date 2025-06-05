<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="promeet_web.dao.*,promeet_web.beans.*,ProMeet.utilities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expert Response</title>

<!-- Include common CSS (Bootstrap etc.) -->
<%@ include file="/common_html/all_css.html" %>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Playfair+Display:wght@600&display=swap" rel="stylesheet">

<style>
 body {
            background: linear-gradient(135deg, #1c1c1c, #3a3a3a);
            color: white;
            font-family: 'Poppins', sans-serif;
        }

/* 🔳 Glassmorphism Form */
.main-cont {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(12px);
    box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2);
    padding: 30px;
    border-radius: 15px;
    max-width: 500px;
    width: 100%;
    margin: auto;
    animation: fadeInUp 1s ease-in-out;
            border: 1px solid rgba(255, 255, 255, 0.15);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    
}
.main-cont:hover {
	transform: scale(1.03);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
}
    @keyframes slideFade {
        0% {
            opacity: 0;
            transform: translateY(50px);
        }
        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }
	
/* 🎨 Dark Inputs */
.input-group-text {
    background: #333;
    color: white;
    border: none;
    border-radius: 10px 0 0 10px;
}

.form-control, .form-select {
    background: rgba(255, 255, 255, 0.9);
    color: black;
    border: 1px solid #ccc;
    border-radius: 10px;
}

.form-control:focus, .form-select:focus {
    border-color: #007bff;
    box-shadow: 0px 0px 10px #007bff;
}


/* 🔘 Button */
.btn-submit {
    background: linear-gradient(45deg, #007bff, #0056b3);
    color: white;
    font-weight: bold;
    padding: 12px;
    width: 100%;
    border-radius: 10px;
    transition: 0.3s ease-in-out;
}
textarea {
            width: 100%;
            height: 100px;
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


btn-submit.:hover {
    background: linear-gradient(45deg, #0056b3, #007bff);
}
 .btn-submit:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            box-shadow: 0px 5px 15px rgba(255, 75, 43, 0.4);
        }
/* 📱 Responsive */
@media (max-width: 768px) {
    .main-cont {
        width: 90%;
    }
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
      String bookingId=request.getParameter("id");
    %>


%>

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

<!-- Header/Navbar -->
<%@ include file="/expert/expert_header.html" %><br>
<div class="container" style="margin-top: 5%;">
    <div class="main-cont mt-4" >
 <form action="/ProMeet/Expert_Response" method="post" class="needs-validation" >
            
            <h2 class="text-center text-white mb-4">📝 Expert Response</h2>
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class='fas fa-calendar-alt' style='font-size:20px'></i>
</span>
                <input type="date" name="date" class="form-control" placeholder="Enter Date" required>
            </div>

            
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class='fas fa-clock' style='font-size:20px'></i>
</span>
                <input type="time" name="time" class="form-control" placeholder="Enter Time" required>
            </div>
            <div class="mb-3 input-group">
            <input type="hidden" value="<%=bookingId %>" name="id">
                <label for="message" class="form-label text-white"></label>
                <textarea class="form-control" id="message" name="message" placeholder="Please provide your message...." required></textarea>
                <div class="invalid-feedback">Please provide your message.</div>
            </div>
             <div class="text-center">
                <button class="btn btn-submit"><i class="fas fa-paper-plane"></i> Submit</button>
            </div>
            </form>
            </div>
            </div>

<br><br><br><br>
<%@ include file="/WEB-INF/common/footer.html" %>
<%} %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>