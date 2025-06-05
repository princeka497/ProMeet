+<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="promeet_web.dao.*,promeet_web.beans.*,ProMeet.utilities.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pending Request</title>
<%@include file="/common_html/all_css.html"%>
<style>
.feedback-section {
	background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
	border-radius: 15px;
	padding: 40px;
	box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
	margin-bottom: 50px;
}

.feedback-card {
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(15px);
	padding: 20px;
	border-radius: 15px;
	text-align: center;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
	color: #fff;
}

.feedback-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
}

.feedback-img img {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	object-fit: cover;
	border: 3px solid #fff;
	box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
}

.feedback-content h5 {
	margin-top: 10px;
	font-size: 18px;
	font-weight: bold;
}

.feedback-content p {
	font-style: italic;
	font-size: 14px;
}
.meet-btn {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            border-radius: 25px;
            transition: all 0.3s ease-in-out;
            text-decoration: none;
            display: inline-block;
            width: 100%;
        }

        .meet-btn:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            box-shadow: 0px 5px 15px rgba(255, 75, 43, 0.4);
        }

</style>

</head>
<body>

	<%@include file="/expert/expert_header.html"%>
	<br>
	<br>
	<br>



	<%
	String email = (String) session.getAttribute("sessionEmail");
	if (email == null || session.isNew()) {
		request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
		RequestDispatcher rd = request.getRequestDispatcher("/expert/expert_login.jsp");
		rd.forward(request, response);
	}
	%>


	<div class="container my-5 feedback-section">
		<h2 class="text-center text-white mb-4">💬 Pending Requests</h2>
		<div class="row d-flex justify-content-center">

			<%
			ExpertDao dao = new ExpertDao();
			ArrayList<User> userList = dao.viewPendingBookings(email);
			for (User u : userList) {
				Booking b = u.getBk();
				
				String picPath = request.getContextPath() + "/" + u.getProfile_pic();
				String message=b.getMessage();
			%>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="feedback-card">
					<div class="feedback-img">
						<img src="<%=picPath%>" alt="User Pic">
					</div>
					<div class="feedback-content">
						<h5><%=u.getName()%></h5>
						<p>
							📞
							<%=u.getPhone()%></p>
						
						<p>
							📝
							<%=b.getMessage()%></p>
						<p>
							👤
							<%=b.getUser_email()%></p>
						<a  href="/ProMeet/expert/expert_response.jsp?id=<%=b.getId()%>" class="meet-btn" style="text-decoration: none;">Response</a>
					</div>
				</div>
			</div>
			<%
			} // end for
			%>

		</div>
	</div>



	<br>
	<br>
	<br>
	<br>
	<br>

	<%@include file="/WEB-INF/common/footer.html"%>
	<!-- else close -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>