<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Register Lists</title>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="formatDate"/>
<table class="table table-center">
	<tr>
		<th>Patient Name</th>
		<th>Patient ID </th>
		<th>Password</th>
		<th>Age</th>
		<th>Sex</th>
		<th>Refer Doctor</th>
		<th>Date and Time</th>		
		<th>Staff Name</th>
	</tr>
	<tr>
		<td>${reception.name}</td>
		<td>${reception.id}</td>
		<td>${reception.getPassword()}</td>
		<td>${reception.age} Years</td>
		<td>${reception.gender}</td>
		<td>${reception.refer}</td>
		<td>${formatDate}</td>
		<td>${reception.username}</td>
	</tr>
</table>
<a href="reception/reception_home"><button type="button">Back</button></a>
</body>
</html>