<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
</head>
<body class="bg-warning">
<form:form action="searchbyme" method="POST" modelAttribute="patient">
 <div class="container pt-5">
 <a href="showList"> <button type="button" class="text-primary bg-light" style="width:80px;">Close</button> </a><br><br>
        <table class="table table-bordered table-hover table-light">
        <thead class="table-info">
            <tr style="border-color: green; text-align: center;">
           	    <th style="border-color: green;">Patient ID</th>
                <th style="border-color: green;">Patient Name</th>               
                <th style="border-color: green;">Age</th>
                <th style="border-color: green;">Sex</th>
                <th style="border-color: green;">Phone</th>
                <th style="border-color: green;">Address</th>
                <th style="border-color: green;">Email Address</th>
                <th style="border-color: green;">Father Name</th>
                <th style="border-color: green;">Refer Doctor</th>
                <th style="border-color: green;">NRC No</th>
                <th style="border-color: green;">Date Of Birth</th>
                <th style="border-color: green;">Nation</th>                
                <th style="border-color: green;">Country</th>
                <th style="border-color: green;">State</th>
                <th style="border-color: green;">Date</th>
            </tr>
            </thead>
            <tr style="border-color: green; text-align: center;">
                <td style="border-color: green;">${patient.pid }</td>
                <td style="border-color: green;">${patient.ptname }</td>
                <td style="border-color: green;">${patient.age }</td>
                <td style="border-color: green;">${patient.sex }</td>
                <td style="border-color: green;">${patient.fathername }</td>
                <td style="border-color: green;">${patient.nrc}</td>
                <td style="border-color: green;">${patient.dob}</td>
                <td style="border-color: green;">${patient.email}</td>
                <td style="border-color: green;">${patient.address}</td>
                <td style="border-color: green;">${patient.phone}</td>
                <td style="border-color: green;">${patient.refer}</td>
                <td style="border-color: green;">${patient.nation}</td>               
                <td style="border-color: green;">${patient.country}</td>
                <td style="border-color: green;">${patient.state}</td>
                <td style="border-color: green;">${patient.date}</td>
            </tr>
         </table>
        </div>       
        </form:form>
</body>
</html>