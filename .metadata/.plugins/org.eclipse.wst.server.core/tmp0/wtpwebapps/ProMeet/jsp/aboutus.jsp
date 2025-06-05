<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us - ProMeet</title>
    <%@include file="/common_html/all_css.html" %>

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        /* Background Gradient */
        body {
            background: linear-gradient(45deg, #001f3f, #003366, #004080);
            background-size: 300% 300%;
            animation: gradientAnimation 8s infinite alternate;
            font-family: "Poppins", sans-serif;
            color: white;
            text-align: center;
            padding-top: 80px; /* Space for fixed navbar */
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            100% { background-position: 100% 50%; }
        }

        /* Fixed Top Navbar */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(10px);
        }

        /* About Us Section */
        .about-section {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 6px 18px rgba(0, 128, 255, 0.5);
            transition: transform 0.3s ease-in-out;
        }

        .about-section:hover {
            transform: scale(1.05);
            box-shadow: 0px 10px 30px rgba(0, 128, 255, 0.8);
        }

        .about-title {
            font-size: 2.8rem;
            font-weight: bold;
            color: #00ccff; /* Light blue */
            text-shadow: 2px 2px 10px rgba(0, 204, 255, 0.6);
        }

        /* Responsive About Image */
        .about-img {
            width: 220px;
            height: 220px;
            border-radius: 50%;
            box-shadow: 0px 8px 20px rgba(0, 128, 255, 0.6);
            transition: transform 0.4s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .about-img:hover {
            transform: scale(1.1);
            box-shadow: 0px 15px 30px rgba(0, 128, 255, 0.8);
        }

        /* Contact Button */
        .contact-btn {
            background: linear-gradient(45deg, #0066ff, #00ccff);
            border: none;
            padding: 12px 24px;
            color: black;
            font-size: 18px;
            font-weight: bold;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            box-shadow: 0px 4px 10px rgba(0, 128, 255, 0.5);
            margin-top: 20px;
        }

        .contact-btn:hover {
            background: linear-gradient(45deg, #00ccff, #0066ff);
            transform: scale(1.1);
            box-shadow: 0px 8px 20px rgba(0, 128, 255, 0.8);
        }

        /* About Illustration */
        .illustration-img {
            max-width: 100%;
            height: auto;
            border-radius: 15px;
            box-shadow: 0px 6px 18px rgba(0, 128, 255, 0.5);
            margin-top: 20px;
        }

        @media (max-width: 768px) {
            .about-img {
                width: 180px;
                height: 180px;
            }
        }
    </style>
</head>
<body>

<!-- Fixed Navbar -->
<%@include file="/WEB-INF/common/navbar.html" %>

<!-- About Us Section -->
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-10 about-section text-center">
            <h1 class="about-title">ABOUT US</h1>
            <p class="lead">
                <img class="about-img" src="/ProMeet/images/promeet1.jpg" alt="ProMeet Logo">
            </p>
            <p>
                Welcome to <strong>ProMeet</strong>, a cutting-edge platform that redefines professional networking.
                In today's fast-paced world, meaningful connections are crucial. Our goal is to create an ecosystem where
                professionals across industries can <strong>collaborate, learn, and grow</strong> together.
            </p>

            <h2>🚀 Our Vision</h2>
            <p>
                To be the leading professional networking hub, fostering a diverse and collaborative environment
                where individuals can find opportunities, resources, and support for their career growth.
            </p>

            <h3>🔹 What We Offer</h3>
            <ul class="list-unstyled">
                <li><i class="fa fa-users"></i> **Global Networking** - Connect with professionals worldwide.</li>
                <li><i class="fa fa-chalkboard-teacher"></i> **Learning & Development** - Webinars & expert talks.</li>
                <li><i class="fa fa-briefcase"></i> **Job & Business Opportunities** - Find career-changing deals.</li>
                <li><i class="fa fa-lightbulb"></i> **Innovative Career Growth Tools** - Personalized recommendations.</li>
            </ul>

            <h3>🌟 Why Choose ProMeet?</h3>
            <p>
                Unlike traditional networking platforms, **ProMeet is built for real engagement**—not just business card exchanges.
                Whether you’re looking for **mentorship, partnerships, or inspiration**, we provide the tools to help you **flourish**.
            </p>

            <!-- Contact Button -->
            <a href="/ProMeet/jsp/contact_us.jsp" style="text-decoration: none;">
            <button class="btn contact-btn">
                <i class="fa fa-envelope"></i> CONTACT US
            </button>
            </a>

            <!-- About Illustration -->
            <div>
                <img class="illustration-img" src="/ProMeet/images/depositphotos_167005130-stock-photo-businessman-touching-word-screen-digital.jpg" alt="Professional Networking">
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function () {
    // Fade in the entire about section
    $(".about-section").hide().fadeIn(1500);

    // Fade in the logo image with a delay
    $(".about-img").hide().delay(500).fadeIn(1500);

    // Fade in the illustration image with a longer delay
    $(".illustration-img").hide().delay(500).fadeIn(1500);

    // Scroll effect to change heading color
    $(window).on('scroll', function () {
        let scrollTop = $(this).scrollTop();
        if (scrollTop > 50) {
            $(".about-title").css({
                "color": "#ffcc00",
                "text-shadow": "2px 2px 10px rgba(255, 204, 0, 0.7)"
            });
        } else {
            $(".about-title").css({
                "color": "#00ccff",
                "text-shadow": "2px 2px 10px rgba(0, 204, 255, 0.6)"
            });
        }
    });

    // Hover effect on contact button
    $(".contact-btn").hover(
        function () {
            $(this).css("letter-spacing", "2px");
        },
        function () {
            $(this).css("letter-spacing", "normal");
        }
    );
});
</script>

<!-- Footer -->
<%@include file="/WEB-INF/common/footer.html" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body>
</html>
