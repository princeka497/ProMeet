<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="promeet_web.dao.*,promeet_web.beans.*,java.util.*,ProMeet.utilities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<!-- Google Fonts -->

<style>
h1 {
    font-family: 'Roboto' 	;
    font-weight: 700;
      /* Bold weight */
}
.div-items{
width:20%;
height:200px;
background-color: red;
margin-left: 2%;
border-radius: 20px;
margin-top: 30px;
text-align: center;


}
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
        border-radius: 20px;
        padding: 20px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        color: white;
        text-align: center;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 100%;
        transition: transform 0.3s ease;
        	
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

    .stars {
        color: #ffdd00;
        font-size: 20px;
    }

    .feedback-content p {
        font-style: italic;
        font-size: 14px;
    }

.feedback-card1 {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(15px);
        padding: 20px;
        border-radius: 15px;
        text-align: center;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        color: #fff;
        border-radius: 20px;
        padding: 20px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        color: white;
        text-align: center;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 100%;
        transition: transform 0.3s ease;
        	
    }

    .feedback-card1:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
    }


.gradient-header {
    font-family: 'Poppins', sans-serif;
    font-size: 3rem;
    text-align: center;
    background: linear-gradient(90deg, #00f0ff, #7b2ff7, #f107a3);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    animation: typing 4s steps(30, end) forwards, blink 0.75s step-end infinite;
    overflow: hidden;
    white-space: nowrap;
    border-right: 3px solid #00f0ff;
    width: 0;
    text-shadow: 0 0 10px rgba(0,255,255,0.3), 0 0 20px rgba(255,0,255,0.3);
}

@keyframes typing {
    from { width: 0 }
    to { width: 100% }
}

@keyframes blink {
    50% { border-color: transparent; }
}

    .feedback-content h5 {
        font-weight: 600;
        font-size: 1.1rem;
    }

    .feedback-content p {
        font-style: italic;
        font-size: 0.95rem;
    }

    .feedback-date {
        font-size: 0.85rem;
        margin-top: 10px;
        opacity: 0.8;
    }
.scrolling-container {
    height: 300px; /* Adjust height as needed */
    overflow: hidden;
    position: relative;
    
}

#scrollContent {
    animation: scrollUp 10s linear infinite;
}

@keyframes scrollUp {
    0% {
        transform: translateY(0%);
    }
    100% {
        transform: translateY(-100%);
    }
}

/* Feedback Card Styling */
.feedback-card1 {
    background: #2a4a8c;
    padding: 15px;
    border-radius: 10px;
    color: white;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

</style>
<script>
let colors=["RED","GREEN","BLUE"]
let idx=0
function changeColor()
{
let tg=document.getElementById("msg")
tg.style.color=colors[idx]
idx++
if (idx>2)
	idx=0
}


setInterval(changeColor,1000)
</script>




<%@include file="/common_html/all_css.html" %>
</head>
<body>
<div class="main-body">
<div class="container-fluid">
    <h1 class="gradient-header">ProMeet Welcomes You</h1>
</div>

<%@include file="/WEB-INF/common/navbar.html" %>
	
<%@include file="/WEB-INF/common/carousel.html" %>
</div>
<!-- feedback Code Here -->

<div class="container my-5 feedback-section">
    <h2 class="text-center text-white mb-4">💬 What Our Users FeedBack</h2>
    <div class="row d-flex justify-content-center">

        <% GuestDao dao = new GuestDao();
        ArrayList<User> userList = dao.allFeedbacks();
        for (User u : userList) {
            String picName = u.getProfile_pic();
            String picPath = request.getContextPath() + "/" + picName;
            Feedback f = u.getFd(); // Feedback object
            String rating = f.getRating();
        %>

        <!-- Feedback Card -->
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="feedback-card">
                <div class="feedback-img">
                    <img src="<%=picPath%>" alt="User Pic">
                </div>
                <div class="feedback-content">
                    <h5><%= f.getName() %></h5>
                    <p class="stars"><%= rating %></p>
                    <p>"<%= f.getRemark() %>"</p>
                </div>
            </div>
        </div>

        <% } %>
        
        

    </div>
</div>


<div class="container my-5 feedback-section">
    <h2 class="text-center text-white mb-4">💬 What Our Expert Tips</h2>

    <!-- Scrollable Container -->
    <div class="scrolling-container" id="autoScrollBox">
        <div class="row flex-column" id="scrollContent">
            <%
                GuestDao dao1 = new GuestDao();
                ArrayList<Expert> expertList = dao1.allTips();
                for (Expert e : expertList) {
                    Tips t = e.getTips();
            %>
                <div class="col-lg-12 mb-3">
                    <div class="feedback-card1">
                        <div class="feedback-content">
                            <h5>Posted By: <%= e.getName() %></h5>
                            <p>"<%= t.getContent() %>"</p>
                            <small><%= t.getDate() %></small>
                        </div>
                    </div>
                </div>
            <%
                }
            %>
        </div>
    </div>
</div>

<script>
    const scrollBox = document.getElementById('autoScrollBox');
    const scrollContent = document.getElementById('scrollContent');

    scrollBox.addEventListener('mouseenter', () => {
        scrollContent.style.animationPlayState = 'paused';
    });

    scrollBox.addEventListener('mouseleave', () => {
        scrollContent.style.animationPlayState = 'running';
    });
</script>

<%@include file="/WEB-INF/common/footer.html" %>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>