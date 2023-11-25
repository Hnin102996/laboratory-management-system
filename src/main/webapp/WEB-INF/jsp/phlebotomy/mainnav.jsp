<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Reception Dashboard</title>
<!--     Fonts and icons     -->
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
<title></title>
</head>
<body>
<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-info" id="sidenav-main">

  	<div class="sidenav-header">
    	<i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
    	<a class="navbar-brand m-0" href=" https://demos.creative-tim.com/material-dashboard/pages/dashboard " target="_blank">
     	<img src="${pageContext.request.contextPath}/images//iLab.jfif" style="width:40px;height:50px;" class="navbar-brand-img h-100 rounded" alt="main_logo">
     	<span class="ms-1 font-weight-bold text-white">Phlebotomy Department</span>
    	</a>
  	</div>
 	 <hr class="horizontal light mt-0 mb-2">
	 <div class="collapse navbar-collapse  w-auto sidenav-body" id="sidenav-collapse-main">
    	<ul class="navbar-nav">
     		<li class="nav-item">
    			<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white " href="showReturnReceptionHome">
    			<span class="nav-link-text ms-1">Dashboard</span>
  				</a>
  				</div>
			</li>

  			<li class="nav-item">  				
    			<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white " href="ShowRegistrationPage">
    			<img src="${pageContext.request.contextPath}/images/ptreg.jfif" style="height: 40px;width: 50px;"><span class="nav-link-text ms-1">Test Registration</span>
  				</a>
  				</div>
			</li>
			
			<li class="nav-item">
  				<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white " href="ReceptionVoucherPage">
    			<img src="${pageContext.request.contextPath}/images/voucher1.jfif" style="width: 50px;height: 40px;"><span class="nav-link-text ms-1">Make Voucher</span>
  				</a>
  				</div>
			</li>

  			<li class="nav-item">
  				<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
   				<a class="nav-link text-white " href="showDetailList">
    			<img src="${pageContext.request.contextPath}/images/view1.png" style="height: 40px;width: 50px;"> <span class="nav-link-text ms-1">View Patient Detail Lists</span>
  				</a>
  				</div>
			</li>

  			<li class="nav-item">
  				<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white " href="showVoucherlist">
    			<img src="${pageContext.request.contextPath}/images/view1.png" style="height: 40px;width: 50px;"> <span class="nav-link-text ms-1">View Voucher</span>
  				</a>
  				</div>
			</li>

  			<li class="nav-item">
  				<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white " href="showTest">
    			<img src="${pageContext.request.contextPath}/images/view1.png" style="height: 40px;width: 50px;"> <span class="nav-link-text ms-1">View Tests</span>
  				</a>
  				</div>
			</li>
			
			
  			<li class="nav-item">
  				<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white " href="changePasswordForm">
    			<img src="${pageContext.request.contextPath}/images/password.png" style="height: 40px;width: 50px;"> <span class="nav-link-text ms-1">Change Password</span>
  				</a>
  				</div>
			</li>
			
			
  			<li class="nav-item">
  				<div class="text-white text-center me-2 d-flex align-items-center justify-content-left">
    			<a class="nav-link text-white text-center " href="signOut">
         		<img src="${pageContext.request.contextPath}/images/logout4.jpg" style="height: 40px;width: 50px;"><span class="nav-link-text ms-1">Logout</span>    			  
  				</a>
  				</div> 
			</li>      
    	</ul>
  	</div>
 </aside>
</body>
</html>