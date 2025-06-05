<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,ProMeet.utilities.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ExpertResponse</title>
    <%@include file="/common_html/all_css.html"%>

       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@400;600;700&display=swap" rel="stylesheet">

    
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Urbanist', sans-serif;
            background: linear-gradient(135deg, #c850c0, #4158d0);
            display: flex;
            flex-direction: column;
        }

        .content-wrapper {
            flex: 1;
            padding: 20px;
        }

        .glass-container {
            max-width: 95%;
            margin: 40px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            color: #fff;
        }

        h3.title {
            text-align: center;
            font-weight: 700;
            margin-bottom: 30px;
            letter-spacing: 1px;
        }

        .table {
            color: #fff;
            background-color: transparent;
        }

        .table th {
            background: rgba(255, 255, 255, 0.2);
            color: #ffffff;
        }

        .table td {
            background: rgba(255, 255, 255, 0.05);
            color: #f0f0f0;
        }

        .no-data {
            text-align: center;
            font-size: 1.4rem;
            background: rgba(255, 255, 255, 0.08);
            padding: 20px;
            border-radius: 15px;
            margin-top: 40px;
        }

        footer {
            background-color: rgba(0, 0, 0, 0.3);
            padding: 15px;
            text-align: center;
            color: #ffffff;
            font-size: 14px;
        }

        @media screen and (max-width: 768px) {
            .table th, .table td {
                font-size: 0.8rem;
                padding: 0.5rem;
            }

            .glass-container {
                padding: 15px;
            }
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
 <%@include file="/user/user_header.html"%>
 <%
	String mess = (String) request.getAttribute("msg");
	if (mess != null) {
	%>
	<div class="alert alert-info alert-dismissible fade show " role="alert" style="margin-top:50px;  ">
		<h4><%=mess%></h4>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
	}
	%>
  <div class="content-wrapper">
    <div class="glass-container">
        <h3 class="title">Expert Response</h3>
     
    <%
        String email = (String) session.getAttribute("sessionEmail");
        if (email == null || session.isNew()) {
            request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
            RequestDispatcher rd = request.getRequestDispatcher("/user/user_login.jsp");
            rd.forward(request, response);
        } else {
            UserDao dao = new UserDao();
            ArrayList<Booking>bookingList = dao.expertResponse(email);
            if (bookingList.size() > 0) {
    %>
    

   
   

    <div class="table-responsive">
            <table class="table table-bordered table-hover text-center align-middle">
                <thead>
                    <tr>
                          <th>Id</th>
                        <th>User_Email</th>
                        <th>Expert_Email</th>
                        <th>Class_Id</th>
                        <th>Join_Date</th>
                        <th>Expert_Response</th>
                        <th>Time</th>
                        <th>Meeting Status</th>
                        <th>Booking_Status</th>
                        
                        <th>ClassStatus</th>                      
                    </tr>
                </thead>
                <tbody>
                    <% for(Booking b : bookingList) {
                         %>
                        <tr>
                            <td><%= b.getId() %></td>
                            <td><%= b.getUser_email() %></td>
                            <td><%= b.getExpert_email() %></td>
                            <td><%= b.getClass_id()%></td>
                            <td><%= b.getJoin_date() %></td>
                            <td><%= b.getExpert_response() %></td>
                            <td><%= b.getTime() %></td>
                            <td><%= b.getMeeting_status()%></td>
                             <td><%= b.getBooking_status() %></td>
                             
  <td><a class="meet-btn" style="text-decoration: none;" href="/ProMeet/UserJoinClass?clId=<%=b.getClass_id()%>">Join Class</a></td>
                            
                              
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <% }  %>
            
    
    <%} %>
 </div>
</div>


   <script>
   
   $(".meet-btn").hover(
	        function () {
	            $(this).css({
	                "box-shadow": "0 0 15px rgba(108, 99, 255, 0.8)",
	                "letter-spacing": "1px"
	            });
	        },
	        function () {
	            $(this).css({
	                "box-shadow": "none",
	                "letter-spacing": "normal"
	            });
	        }
	    );
   </script>

   <footer>
                  
    &copy; 2025 ProMeet. All rights reserved.Created By Prince
</footer>


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
