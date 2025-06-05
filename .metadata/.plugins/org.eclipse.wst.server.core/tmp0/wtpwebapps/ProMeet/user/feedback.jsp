<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,java.util.*,ProMeet.utilities.*"%>
<%


response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at theproxyserver
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback</title>
    <%@include file="/common_html/all_css.html"%>

    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            font-family: 'Poppins', sans-serif;
            color: white;
        }

        .feedback-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .feedback-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 30px;
            width: 100%;
            max-width: 450px;
            text-align: center;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: transform 0.3s;
        }

        .feedback-card:hover {
            transform: scale(1.05);
        }

        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            padding: 10px;
            font-size: 14px;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        textarea {
            height: 120px;
            resize: none;
        }

        .btn-submit {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            font-weight: bold;
            color: white;
            border-radius: 20px;
            transition: all 0.3s ease-in-out;
            width: 100%;
        }

        .btn-submit:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            box-shadow: 0px 5px 15px rgba(255, 75, 43, 0.4);
        }

        .card-text {
            font-size: 14px;
            margin-bottom: 10px;
            text-align: left;
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
            UserDao dao = new UserDao();
            User u = dao.userProfile(email);
    %>

    <%@include file="/user/user_header.html"%>
<br><br><br>
    <div class="feedback-container">
        <div class="feedback-card">
            <h2 class="mb-4">Feedback</h2>

            <% String mess = (String) request.getAttribute("message");
                if (mess != null) { %>
                <div class="alert alert-info alert-dismissible fade show" role="alert">
                    <h4><%= mess %></h4>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <form action="/ProMeet/UserFeedback" method="post" novalidate class="needs-validation">
                
                <div class="mb-3 text-start">
                    <label class="form-label"><i class="far fa-user"></i> Name</label>
                    <input type="text" name="name" class="form-control" required value="<%=u.getName()%>" readonly>
                </div>

                <div class="mb-3 text-start">
                    <label class="form-label"><i class="far fa-envelope"></i> Email</label>
                    <input type="email" name="email" class="form-control" required value="<%=u.getEmail()%>" readonly>
                </div>

                <div class="mb-3 text-start">
                    <label class="form-label"><i class="fas fa-star"></i> Rating</label>
                    <select style="background-color:gray" name="rating" class="form-select" required>
                        <option class="bg-gray" value="" selected disabled>Choose Rating...</option>
                        <option value="1">★★★★★ (5 Stars)</option>
                        <option value="2">★★★★☆ (4 Stars)</option>
                        <option value="3">★★★☆☆ (3 Stars)</option>
                        <option value="4">★★☆☆☆ (2 Stars)</option>
                        <option value="5">★☆☆☆☆ (1 Star)</option>
                    </select>
                </div>

                <div class="mb-3 text-start">
                    <label class="form-label"><i class="far fa-comment"></i> Feedback</label>
                    <textarea class="form-control" name="remark" placeholder="Write your feedback..." required></textarea>
                </div>

                <button class="btn btn-submit"><i class="fas fa-paper-plane"></i> Submit Feedback</button>
            </form>
        </div>
    </div>

    <% } %>

    <%@include file="/WEB-INF/common/footer.html"%>

    <script src="/ProMeet/js/validation.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
