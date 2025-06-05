<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="promeet_web.dao.*,promeet_web.beans.*,ProMeet.utilities.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmed Requests</title>
    <%@include file="/common_html/all_css.html" %>

    
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
    </style>
</head>
<body>

<%@include file="/expert/expert_header.html" %>

<div class="content-wrapper">
    <div class="glass-container">
        <h3 class="title">Confirmed Requests</h3>

        <%
            String email = (String) session.getAttribute("sessionEmail");
            if (email == null || session.isNew()) {
                request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
                RequestDispatcher rd = request.getRequestDispatcher("/expert/expert_login.jsp");
                rd.forward(request, response);
            } else {
                ExpertDao dao = new ExpertDao();
                ArrayList<User> responseList = dao.viewAllResponses(email);
                if (responseList.size() > 0) {
        %>
        <div class="table-responsive">
            <table class="table table-bordered table-hover text-center align-middle">
                <thead>
                    <tr>
                        <th>Sr. No</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Message</th>
                        <th>Response</th>
                        <th>Status</th>
                        <th>Class ID</th>
                        <th>Time</th>
                        <th>Join Date</th>
                        <th>Join Class</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(User u : responseList) {
                        Booking b = u.getBk(); %>
                        <tr>
                            <td><%= b.getId() %></td>
                            <td><%= u.getName() %></td>
                            <td><%= u.getEmail() %></td>
                            <td><%= u.getPhone() %></td>
                            <td><%= b.getMessage() %></td>
                            <td><%= b.getExpert_response() %></td>
                            <td><%= b.getBooking_status() %></td>
                            <td><%= b.getClass_id() %></td>
                            <td><%= b.getTime() %></td>
                            <td><%= b.getJoin_date() %></td>
                            <td><button>
                                <a href="/ProMeet/StartClass?clId=<%=b.getClass_id()%>">StartClass</a>
                                 
                                 </button></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <% } else { %>
            <div class="no-data">No Confirmed Requests Found</div>
        <% } } %>
    </div>
</div>

<footer>
                  
    &copy; 2025 ProMeet. All rights reserved.Created By Prince
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
