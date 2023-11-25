<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta content="width=device-width, initial-scale=1.0" name="viewport">	
	<title>Admin Activity</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
body{
	background-image:url(Laboratory.jpg);
	background-repeat: no-repeat;
	background-size:cover;
	height:100vh;
}
form{
	background-color:beige;
	width:800px;
	height:800px;
	margin-left:250px;
	}
table,tr,td{
 	border:none;  
	}
table{
	border-spacing: 50px;
	}
input{
 	width:250px;
 	height:35px;
	}
.in1{
	width: 150px;
	height: 30px;
}
h2{
	color:brown;
	text-align: center;
	}
button{
	background-color: lightblue;
	width:100px;
	height:30px;
	margin-left: 250px;
	margin-top: 30px;
	}
	.select1{
		width: 150px;		
	}
	h3{
		text-decoration-color: blueviolet;
	}
</style>
</head>
<body>
<div class="container border">
		<h3 class="text-primary">Admin</h3>
		<ul class="nav nav-tabs">		  
		  <li class="dropdown active">
			<a class="dropdown-toggle text-primary" data-toggle="dropdown" href="#">Reception</a>
			<ul class="dropdown-menu text-primary">
			  <li><a href="Toregistration.html" class="text-primary">Patient Registration</a></li>
			  <li><a href="voucher.html" class="text-primary">Make Voucher</a></li>
			  <li><a href="viewpthistory.html" class="text-primary">View Patient History</a></li>
			  <li><a href="viewptlist.html" class="text-primary">View Patient List By Day/Month/Year</a></li>			   
			  <li><a href="viewvoucher.html" class="text-primary">View Vouchers</a></li>
			  <li><a href="viewtest.html" class="text-primary">View Daily Test Lists</a></li>
			  <li><a href="testcancel.html" class="text-primary">Cancel Test</a></li> 
			  <li><a href="viewcanceltest.html" class="text-primary">View Cancel Test Lists</a></li>                    
			</ul>
		  </li>
		  <li class="active"><a href="save.html" class="text-primary">Save</a></li>
		  <li class="active"><a href="#" class="text-primary">Edit</a></li>
		  <li class="active"><a href="#" class="text-primary">Delete</a></li>
		  <li class="active"><a href="LMS.html" class="text-primary">Close</a></li>		  
		</ul>
	</div>
</body>
</html>