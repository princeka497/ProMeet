<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Slide Demo</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$(document).ready(function(){

    $("#div1").click(function(){
    /* $("#div2").slideDown(2000) */
    $("#div2").slideToggle(2000)

    
    
    });//div1 close
    
    
    $("#goal").fadeIn(2000)
    /* $("#img1").fadeOut(3000) */
    $("#img1").fadeTo(2000,.75)
    $("#img2").fadeIn(2000)
    
    
    
    $("#btnmsg").click(function(){

    $("#msg").css({"font-size":"30px","color":"green",})
    
    
    
    })//btnmsg

    


});//ready close



</script>
</head>
<body>
<div id="div1" style="width:100%; height:50px; background-color:red ">

</div>
<div id="div2" style="width:80%; height:100px; background-color:green;  margin:auto; display:none;">

</div>
<div id="about">
<h1 id="goal" >Our Goals</h1>

</div>
<img id="img1" alt="" src="/ProMeet/images/contactpro.jpg" style="width:200px;height:200px;">
<img id="img2" alt="" src="/ProMeet/images/contactpro.jpg" style="width:200px;height:200px ; display:none;" >
<p id="msg" style="color:red;font-size:20px;">Use Of JQuery</p>

<button id="btnmsg">ChangeStyle</button>

</body>
</html>