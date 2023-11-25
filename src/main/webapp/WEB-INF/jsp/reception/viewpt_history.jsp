<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta content="width=device-width, initial-scale=1.0" name="viewport">	
	<title>View Patient History</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>

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
	.tr1{
		border-color: blueviolet;
		border-style: groove;
	}
	.td{
		border-color: blueviolet;
		border-style: groove;
	}
	.in2{
		width: 160px;
		height: 30px;
	}

</style>
</head>
<body>
	<div class="container border">
		<h3 class="text-primary">Patient History</h3>
		<ul class="nav nav-tabs">		  
		  <li class="dropdown">
			<a class="dropdown-toggle text-primary" data-toggle="dropdown" href="#">Reception</a>
			<ul class="dropdown-menu text-primary">
			  <li><a href="ReceptionRegisterPage" class="text-primary">Patient Registration</a></li>
			  <li><a href="ReceptionVoucherPage" class="text-primary">Make Voucher</a></li>
			  <li><a href="ReceptionViewPatientHistoryPage" class="text-primary">View Patient History</a></li>
			  <li><a href="ReceptionViewPatientListPage" class="text-primary">View Patient List By Day/Month/Year</a></li>			   
			  <li><a href="ReceptionViewVoucherPage" class="text-primary">View Vouchers</a></li>
			  <li><a href="ReceptionViewTestListPage" class="text-primary">View Daily Test Lists</a></li>
			  <li><a href="ReceptionTestCancelPage" class="text-primary">Cancel Test</a></li> 
			  <li><a href="ReceptionViewCancelTestPage" class="text-primary">View Cancel Test Lists</a></li>                                       
			</ul>
		  </li>
		  <li><a href="#" class="text-primary">Save</a></li>
		  <li><a href="#" class="text-primary">Edit</a></li>
		  <li><a href="#" class="text-primary">Delete</a></li>	
		  <li><a href="Toregistration.html" class="text-primary">Close</a></li>	  
		</ul>
	</div>
	<div class="container pt-5">
		<div class="row g-2">
            <div class="col-3">
                <div class="p-2 m-2 border bg-info text-white" aria-placeholder="Enter Patient ID">Patient ID:
                    <input type="text" placeholder="Enter Patient ID" class="in1">
                </div>
              </div>
			  <div class="col-3">
				<div class="p-2 m-2 border bg-info text-white">Password:
					<input type="text" class="in1">
				</div>
			  </div>
		  <div class="col-3">
			<div class="p-2 m-2 border bg-info text-white">Patient Name:
				<input type="text" class="in2">
			</div>
		  </div>		  
		  <div class="col-3">
			<div class="p-2 m-2 border bg-info text-white">Age & Sex:       
				<input type="text" class="in1">
			</div>
		  </div>		  
		  <div class="col-3">
			<div class="p-2 m-2 border bg-info text-white">Father Name:
				<input type="text" class="in2">
			</div>
		  </div>
		  <div class="col-3">
			<div class="p-2 m-2 border bg-info text-white">NRC No. :		
				<input type="text" id="nrcno" class="in2">
			</div>
		  </div>
		  <div class="col-3">
			<div class="p-2 m-2 border bg-info text-white">Date of Birth:
				<input type="text" class="in1">
			</div>
		  </div>
		  <div class="col-4">
			<div class="p-2 m-2 border bg-info text-white">Email Address:
				<input type="text" placeholder="example@gmail.com">
			</div>
		  </div>
		  <div class="col-4">
			<div class="p-2 m-2 border bg-info text-white">Address:
				<input type="text">
			</div>
		  </div>
		  <div class="col-3">
			<div class="p-2 m-2 border bg-info text-white">Phone No. :
				<input type="text" class="in1">
			</div>
		  </div>
		  <div class="col-3">
			<div class="p-3 m-2 border bg-info text-white">Religion: 
				<input type="text" class="in1">
			</div>
		  </div>
		  <div class="col-3">
			<div class="p-2 m-2 border bg-info text-white">Refer Physician:
				<input type="text" class="in2">
			</div>
		  </div>
		  <div class="col-3">
			<div class="p-2 m-2 border bg-info text-white">Country:
				<input type="text" class="in1">
			</div>
		  </div>
		  <div class="col-4">
			<div class="p-2 m-2 border bg-info text-white">State:
				<input type="text" class="in2">
			</div>
		  </div>		  
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">Remark:
				<input type="text" class="form-control form-control-lg">
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-black">Test Lists:
				<table class="table table bordered">
					<tr class="tr1">
						<td class="td">Urea,Creatinine,Electrolye:</td>
						<td class="td">2/1/2023</td>
					</tr>
					<tr class="tr1">
						<td class="td">Potassium:</td>
						<td class="td">5/1/2023</td>
					</tr>					
				</table>
			</div>
		  </div>
		</div>
	  </div>	  
</body>
</html>