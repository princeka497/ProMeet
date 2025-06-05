<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jquery Demo</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$(document).ready(
		function(){

		/* alert("Hello JQuery ") */
		$("#btnshow").click(function(){
             /* alert("ShowButton IS Clicked")  */
             //document.getElementById("div1).style.display="block"
             $("#div1").show()//show built-In
             
		});//btn show is close
		
		$("#btnhide").click(function(){

		$("#div1").hide()
		
		
		});//hideclose

		
		
		
		});//takes gurantee until unless whole document gets loaded no code will get executed
</script>
</head>
<body>
<button id="btnshow">show</button><br><br>
<button id="btnhide">Hide</button>

<div id="div1" style="width:200px;height:200px; background-color: red; display:none;">
<h1>This is Div</h1>
</div>
</body>
</html>