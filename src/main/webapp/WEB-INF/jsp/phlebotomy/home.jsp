<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
        <meta content="width=device-width" name="viewport">
        <meta charset="utf-8">
    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
        <style>
             a:visited {color: blue;}
        </style>
</head>
<body class="g-sidenav-show  bg-gray-100">
<form:form action="" method="POST" modelAttribute="phle">
	<jsp:include page="mainnav.jsp" >
		<jsp:param value="" name=""/>
	</jsp:include>
	
 <!--  </div>-->
 
  <!--  <div class="col-lg-15">-->
	<main class="main-content border-radius-lg ">

		<nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
  			<div class="container-fluid py-1 px-3">
    			<nav aria-label="breadcrumb">
   					<ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
        			<li class="breadcrumb-item text-sm"><a class="opacity-5 text-info" href="javascript:;">Pages</a></li>
        			<li class="breadcrumb-item text-sm text-info active" aria-current="page">Phlebotomy Dashboard</li>
      				</ol>
      				<h6 class="font-weight-bolder mb-0 text-info">Phlebotomy Dashboard</h6>      
    			</nav>    
  			</div>
		</nav>
		<c:if test="${not empty successmsg }">
		<script>
			alert("${successmsg}");
		</script>
		</c:if>
		<!-- <div><h6 style="color:blue">${successmsg}</h6></div> -->
		<div class="container-fluid py-4">
			<img src="${pageContext.request.contextPath}/images/phle1.jpg" style="width: 1100px; height: 600px;">
		</div>
	</main>
</form:form>
   
</body>
</html>