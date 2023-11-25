<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lab Management System</title>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<LINK REL="STYLESHEET" HREF="${pageContext.request.contextPath}/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script> 
<style>
body{
	background-image:url(Laboratory.jpg);
	background-repeat: no-repeat;
	background-size:cover;
	height:100vh;
}
.interactive-link {
            cursor: pointer; /* Change the cursor style */
        }

</style>
</head>
<body>
<img src="${pageContext.request.contextPath}/images/iLab.jfif" class="img1"/>	
<br>
<h1 align="center" style="color:blueviolet">iLab Laboratory</h1>
<h2 align="center" style="color:blueviolet">High Quality Health Care Service</h2><br><br><br>
<table align="center" cellspacing="20" cellpadding="10">
		<tr>
			<td><a href="Adminlogin"><img src="${pageContext.request.contextPath}/images/admin.png" class="img2"/></a><br>
				<h3 style="color:blueviolet">Admin</h3>
			</td>
			<td><a href="ReceptionLogin"><img src="${pageContext.request.contextPath}/images/rec.jfif" class="img2"/></a><br>
				<h3 style="color:blueviolet">Reception</h3>
			</td>
			<td><a href="PhlebotomyLogin"><img src="${pageContext.request.contextPath}/images/bloodcollect.jfif" class="img2"/></a><br>
				<h3 style="color:blueviolet">Phlebotomy</h3>
			</td>
			<td><a href="LaboratoryLogin"><img src="${pageContext.request.contextPath}/images/labimage.png" class="img2"/></a><br>
				<h3 style="color:blueviolet">Laboratory</h3>
			</td>
			<td><a href="MicrobiologyLogin"><img src="${pageContext.request.contextPath}/images/micro.jfif" class="img2"/></a><br>
				<h3 style="color:blueviolet">Microbiology</h3>
			</td>
			<td><a href="PathologyLogin"><img src="${pageContext.request.contextPath}/images/patho.jfif" class="img2"/></a><br>
				<h3 style="color:blueviolet">Pathology</h3>
			</td>
		</tr>
	</table>
</body>
</html>