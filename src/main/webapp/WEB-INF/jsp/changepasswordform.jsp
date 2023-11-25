<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    if(session.getAttribute("userObject")==null){
    	response.sendRedirect("ReceptionLogin");
    }

%>
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
	
<title>Change Password</title>
<style>
 	body{
 		 font-family: 'Times New Roman', Times, serif;
	 }
	 .space {
  			width: 15px;
  			height: auto;
  			display: inline-block;
			}
		
</style>
</head>
<body>
<div class="limiter">
<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(Laboratory.jpg);">
					<span class="login100-form-title-1">
						Change Password
					</span>
				</div>
<form:form class="login100-form validate-form" action="changePassword" modelAttribute="staff" method="POST">

		<div class="wrap-input100 validate-input m-b-26" data-validate="Current Password is required">
			<span class="label-input100">Current Password</span>			
			<input class="input100" type="password" name="currentPassword" placeholder="Enter current password"/>
			<span class="focus-input100"></span>						
		</div>
		 <div><h6 style="color:red">${cuerrormsg}</h6></div>					
		<div class="wrap-input100 validate-input m-b-18" data-validate = "New Password is required">
			<span class="label-input100">New Password</span>
			<input class="input100" type="password" name="newPassword" placeholder="Enter new password"/>
			<span class="focus-input100"></span>
		</div>
		<div class="wrap-input100 validate-input m-b-18" data-validate = "Confirm Password is required">
			<span class="label-input100">Confirm Password</span>
			<input class="input100" type="password" name="confirmPassword" placeholder="Enter confirm password"/>
			<span class="focus-input100"></span>						
		</div>	   
    <div><h6 style="color:red">${ncerrormsg}</h6></div>
    <div class="container-login100-form-btn mt-5 m-2">
        <input type="submit" class="login-form-btn btn-info rounded" style="width:150px;height:30px;" value="Change Password"/>
     	<div class="space"> </div>  
        <a href="ReceptionLogin" class="login-form-btn btn-info text-center rounded" style="width:100px;height:30px;">Cancel</a>
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