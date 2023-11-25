<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta content="width=device-width, initial-scale=1.0" name="viewport">	
	<title>Patient Registration</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
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
		<h3 class="text-primary">Patient Registration</h3>
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
	<div class="container pt-5">
		<div class="row g-2">
			<div class="col-5">			
				<div class="p-2 m-2 border bg-info text-white">Patient ID:
					<input type="text">
				</div>
			  </div>
			  <div class="col-5">			
				<div class="p-2 m-2 border bg-info text-white">Password:
					<input type="text" disabled>
				</div>
			  </div>
		  <div class="col-5">			
			<div class="p-2 m-2 border bg-info text-white">Patient Name:
				<input type="text">
			</div>
		  </div>		 
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">Age:       
				<input type="text">
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-3 m-2 border bg-info text-white">Gender:
				<select name="gender" if="gend" size="1" class="select1">
					<option value="selectgen">Select Gender</option>
					<option value="m">Male</option>
					<option value="f">Female</option>
					<option value="other">Other Gender</option>
				</select>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">Father Name:
				<input type="text">
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">NRC No. :
				<select id="selectno" name="select" size="1">
					<option value="1">1/</option>
					<option value="2">2/</option>
					<option value="3">3/</option>
					<option value="4">4/</option>
					<option value="5">5/</option>
					<option value="6">6/</option>
					<option value="7">7/</option>
					<option value="8">8/</option>
					<option value="9">9/</option>
					<option value="10">10/</option>
					<option value="11">11/</option>
					<option value="12">12/</option>
					<option value="13">13/</option>
					<option value="14">14/</option>
					<option value="15">15/</option>
					<option value="16">16/</option>
					<option value="17">17/</option>					
				</select>
				<select id="selectstate" name="select" size="1">
					<option value="kpt">Ka Pa Ta</option>
					<option value="nkt">Na Ka Ta</option>
				</select>
				<select id="selectone" name="select" size="1">
					<option value="naing">(နိုင်)</option>
					<option value="c">(C)</option>
				</select>
				<input type="text" id="nrcno" class="in1">
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">Date of Birth:
				<input type="text">
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">Email Address:
				<input type="text" placeholder="example@gmail.com">
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">Address:
				<input type="text">
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">Phone No. :
				<input type="text">
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">Refer Physician:
				<input type="text">
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-3 m-2 border bg-info text-white">Nation: 
				<select name="reli" id="relig" size="1" class="select1">
					<option value="selectone">Select Nation</option>
					<option value="budd">Myanmar</option>
					<option value="christ">Foreigner</option>					
				</select>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-3 m-2 border bg-info text-white">Religion: 
				<select name="reli" id="relig" size="1" class="select1">
					<option value="selectone">Select Religion</option>
					<option value="budd">Buddhist</option>
					<option value="christ">Christian</option>
					<option value="hin">Hinduism</option>
					<option value="norel">No Religion</option>
				</select>
			</div>
		  </div>		  
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">Country:
				<input type="text">
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">State:
				<input type="text">
			</div>
		  </div>
		</div>
	  </div>
</body>
</html>