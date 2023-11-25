<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assests/img/apple-icon.png">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
<script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js" ></script>
<script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js" ></script>
<!-- <script src="${pageContext.request.contextPath}/assets/js/plugins/perfect-scrollbar.min.js" ></script> -->
<!--  <script src="${pageContext.request.contextPath}/assets/js/plugins/smooth-scrollbar.min.js" ></script>-->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/material-dashboard.min.js?v=3.1.0"></script>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />

<!-- Nucleo Icons -->
<link href="${pageContext.request.contextPath}/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />

<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>

<!-- Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">

<!-- CSS Files -->

<link id="pagestyle" href="${pageContext.request.contextPath}/assets/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />

<!-- Nepcha Analytics (nepcha.com) -->
<!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
<script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
<title>Patient Registration</title>
<style>
.bg-blue{
		background-color:slateblue;
	}
</style>
</head>
<body class="g-sidenav-show  bg-gray-100">
<form:form action="" method="POST" modelAttribute="patient">
<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-info" id="sidenav-main">

  	<div class="sidenav-header">
    	<i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
    	<a class="navbar-brand m-0" href=" https://demos.creative-tim.com/material-dashboard/pages/dashboard " target="_blank">
     	<img src="${pageContext.request.contextPath}/images//iLab.jfif" style="width:40px;height:50px;" class="navbar-brand-img h-100 rounded" alt="main_logo">
     	<span class="ms-1 font-weight-bold text-white">Reception Department</span>
    	</a>
  	</div>
 	 <hr class="horizontal light mt-0 mb-2">
	 <div class="collapse navbar-collapse  w-auto sidenav-body" id="sidenav-collapse-main">
    	<ul class="navbar-nav">
     		<li class="nav-item">
    			<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white " href="./dashboard.html">
    			<span class="nav-link-text ms-1">Dashboard</span>
  				</a>
  				</div>
			</li>

  			<li class="nav-item">  				
    			<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white " href="ShowRegistrationPage">
    			<img src="${pageContext.request.contextPath}/images/register2.jpg" style="height: 40px;width: 50px;"><span class="nav-link-text ms-1">Patient Registration</span>
  				</a>
  				</div>
			</li>
			
			<li class="nav-item">
  				<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white " href="ReceptionVoucherPage">
    			<img src="${pageContext.request.contextPath}/images/voucher.png" style="width: 50px;height: 40px;"><span class="nav-link-text ms-1">Make Voucher</span>
  				</a>
  				</div>
			</li>

  			<li class="nav-item">
  				<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
   				<a class="nav-link text-white " href="showList">
    			<img src="${pageContext.request.contextPath}/images/view.jpg" style="height: 40px;width: 50px;"> <span class="nav-link-text ms-1">View Patient Detail Lists</span>
  				</a>
  				</div>
			</li>

  			<li class="nav-item">
  				<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white " href="showVoucherlist">
    			<img src="${pageContext.request.contextPath}/images/view.jpg" style="height: 40px;width: 50px;"> <span class="nav-link-text ms-1">View Voucher</span>
  				</a>
  				</div>
			</li>

  			<li class="nav-item">
  				<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white " href="showTest">
    			<img src="${pageContext.request.contextPath}/images/view.jpg" style="height: 40px;width: 50px;"> <span class="nav-link-text ms-1">View Tests</span>
  				</a>
  				</div>
			</li>
  			<li class="nav-item">
  				<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white text-center " href="./sign-in.html">
         		<span class="nav-link-text ms-1">Logout</span>    			  
  				</a>
  				</div> 
			</li>      
    	</ul>
  	</div>
 </aside>
<main class="main-content border-radius-lg ">

		<nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
  			<div class="container-fluid py-1 px-3">
    			<nav aria-label="breadcrumb">
   					<ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
        			<li class="breadcrumb-item text-sm"><a class="opacity-5 text-info" href="javascript:;">Pages</a></li>
        			<li class="breadcrumb-item text-sm text-info active" aria-current="page">index</li>
      				</ol>
      				<h6 class="font-weight-bolder mb-0 text-info">index</h6>      
    			</nav>    
  			</div>
		</nav>
		<div class="container-fluid py-4">
	<h3 class="text-center text-info">Patient Registration Form</h3>
	
	<div class="container pt-5 justify-content-center">
		<div class="row g-2">
		<div class="col-5">			
			<div class="p-2 m-2 border bg-blue " ><label>Patient Name:</label>
				<form:input path="ptname" required="true"></form:input>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>			
			  <div class="col-5">			
				<div class="p-2 m-2 border bg-blue"><label>Password:</label>
					<input type="text" disabled/>
				</div>
			  </div>		  		 
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label>Age:</label>       
				<form:input type="text" path = "age" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-3 m-2 border bg-blue"><label>Gender:</label>
				<form:select path="sex"  size="1" class="select1 bg-info" required="true">
					<form:option value="selectgen" label="Select Gender"/>
					<form:option value="Male" label="Male"/>
					<form:option value="Female" label="Female"/>
					<form:option value="Other Gender" label="Other Gender"/>
				</form:select>
	           	<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label>Father Name:</label>
				<form:input path="fathername" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label>NRC No. :</label>				
				<form:input path="nrc" id="nrc" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label>Date of Birth:</label>
				<form:input type="date" path="dob" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label>Email Address:</label>
				<form:input path="email" placeholder="example@gmail.com"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label>Address:</label>
				<form:input path="address" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label>Phone No. :</label>
				<form:input type="text" path="phone" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label>Refer Physician:</label>
				<form:input type="text" path="refer" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-3 m-2 border bg-blue"><label>Nation: </label>
				<form:select name="nat" path="nation" id="nati" size="1" class="select1 bg-info">
					<form:option value="selectnation">Select Nation</form:option>
					<form:option value="Myanmar">Myanmar</form:option>
					<form:option value="Foreigner">Foreigner</form:option>					
				</form:select>
			</div>
		  </div>		  		  
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label>Country:</label>
				<form:input type="text" path="country"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label>State:</label>
				<form:input type="text" path="state"/>
			</div>
		  </div>
		</div>
	  </div>
	   <button type="submit" class="btn btn-info text-white">Register</button>
	   </div>
	</main>
</form:form>
</body>
</html>