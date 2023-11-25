<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<LINK REL="STYLESHEET" HREF="${pageContext.request.contextPath}/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>

	 <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">

	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">

	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">

	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">

	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">

	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Reception Login Page</title>
<style>
 	body{
 		 font-family: 'Times New Roman', Times, serif;
 		 background-color: lightblue;
	 }
	
</style>
</head>
<body class="g-sidenav-show bg_body">
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(Laboratory.jpg);">
					<span class="login100-form-title-1">
						Reception Login In
					</span>
				</div>

				<form:form class="login100-form validate-form" action="validReception" method="POST" modelAttribute="reception">
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required" >
						<span class="label-input100">Username</span>
						<form:input class="input100" type="text" path="username" placeholder="Enter username" required="true"/>
						<span class="focus-input100"></span>
    					<div class="invalid-feedback">Please fill out this field.</div>											
					</div>
					<c:if test="${param.resultFlag == '0' && param.errorname ne null}">
					<div><h6 style="color:red">${param.errorname}</h6></div>
					</c:if>						
					<div class="wrap-input100 validate-input m-b-18" data-validate="Password is required" >
						<span class="label-input100">Password</span>
						<form:input class="input100" type="password" path="password" placeholder="Enter password" required="true"/>
						<span class="focus-input100"></span>
						<div class="invalid-feedback">Please fill out this field.</div>					
					</div>
					<c:if test="${param.resultFlag == '0' && param.errorpass ne null}">
					<div><h6 style="color:red">${param.errorpass}</h6></div>
					</c:if>
					<c:if test="${param.resultFlag == '0' && param.errormessage ne null}">
					<div><h6 style="color:red">${param.errormessage}</h6></div>
					</c:if>			
					<div class="container-login100-form-btn mt-5">
						<!--<button class="login100-form-btn">--><input type="submit" class="login-form-btn btn-info rounded text-center" style="width:110px;height:30px;" value="Login" autofocus />
							<!--  <img src="${pageContext.request.contextPath}/images/key.png" width="55px" height="30px"><a href="#" class="btn btn-info rounded text-center">Forget Password?</a>-->	
						
					</div>
				</form:form>
			</div>
		</div>
	</div>	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<script src="js/main.js"></script>	
</body>
</html>