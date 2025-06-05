<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page
	import="promeet_web.dao.*,promeet_web.beans.*,ProMeet.utilities.*"%>
	<%


response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at theproxyserver
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meeting </title>
<%@include file="/common_html/all_css.html"%>
<style>
textarea {
  width: 100%; /* Full width */
  height: 80px; /* Fixed height */
  resize: none; /* Prevent resizing */
}

        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            font-family: 'Poppins', sans-serif;
        }

        .main-container {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            margin: auto;
            margin-top: 80px;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 10px;
            box-shadow: none;
            transition: all 0.3s ease-in-out;
        }

        .form-control:focus {
            border-color: #2575fc;
            box-shadow: 0px 0px 10px rgba(37, 117, 252, 0.5);
        }

        textarea {
            height: 100px;
            resize: none;
        }

        .submit-btn {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            width: 100%;
            border-radius: 25px;
            transition: all 0.3s ease-in-out;
        }

        .submit-btn:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            box-shadow: 0px 5px 15px rgba(255, 75, 43, 0.4);
        }

</style>
</head>
<body>
<%
	String email = (String) session.getAttribute("sessionEmail");
	if (email == null || session.isNew()) {
		request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
		RequestDispatcher rd = request.getRequestDispatcher("/user/user_login.jsp");
		rd.forward(request, response);
	} else {
		
		
		String expertEmail=request.getParameter("exp_email");
		ExpertDao dao1=new ExpertDao();
		Expert e=dao1.expertProfile(email);


		UserDao dao = new UserDao();
		User u = dao.userProfile(email);
		String uploadPath = request.getContextPath();
		System.out.println("path is" + uploadPath);
		String imagePath = uploadPath + "/" + u.getProfile_pic();
		System.out.println("Actual Image Path is " + imagePath);
	%>
	
	<%@include file="/user/user_header.html"%>
	
	 
<br><br>
<% String mess = (String) request.getAttribute("message");
                if (mess != null) { %>
                <div class="alert alert-info alert-dismissible fade show" role="alert">
                    <h4><%= mess %></h4>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>
	
<div class="container">
    <div class="main-container">
        <h2 class="form-title">Send a Meeting Request</h2>
        <form action="/ProMeet/Meet_Request" method="post" class="needs-validation" novalidate>
            <div class="mb-3">
            
            <input type="hidden" value="<%=expertEmail %>" name="expertEmail">
                <label for="content" class="form-label">Your Message</label>
                <textarea class="form-control" id="content" name="content" placeholder="Enter your message..." required></textarea>
                <div class="invalid-feedback">Please provide your message.</div>
            </div>
            <button type="submit" class="submit-btn">Submit Request</button>
        </form>
    </div>
</div>
<% }%>
<br><br><br><br>
<%@include file="/WEB-INF/common/footer.html"%>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>


</body>
</html>