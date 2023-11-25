<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%
    if(session.getAttribute("userObject")==null){
    	response.sendRedirect("ReceptionLogin");
    }

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="${common.url}/assets/js/mvd.js"></script>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  	
  	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assests/img/apple-icon.png">

	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">

	<script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js" ></script>
	<script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js" ></script>

	<script async defer src="https://buttons.github.io/buttons.js"></script>

	<script src="${pageContext.request.contextPath}/assets/js/material-dashboard.min.js?v=3.1.0"></script>

	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />

	<link href="${pageContext.request.contextPath}/assets/css/nucleo-icons.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/assets/css/nucleo-svg.css" rel="stylesheet" />

	<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
	<link id="pagestyle" href="${pageContext.request.contextPath}/assets/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />
	<script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script> 
  <title>Edit Patient</title>
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
		height: 20px;
				
	}
	background-color: lightblue;
	}
	form{
	background-color:whitesmoke;
	
	}
	.bg-blue{
		background-color:#6495ed;
	}
	
    a:visited {color: blue;}
    .bg_body{
					background-color: lightblue;
					}
	
</style>
</head>
<body class="g-sidenav-show bg_body">
<jsp:include page="mainnav.jsp" >
		<jsp:param value="" name=""/>
	</jsp:include>
 	<main class="main-content border-radius-lg ">
		<nav class="navbar navbar-main navbar-expand-sm px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
  			<div class="container-fluid py-1 px-3">
    			<nav aria-label="breadcrumb">
   					<ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-lg-20 me-5">
        			<li class="breadcrumb-item text-lg"><a class="opacity-7 text-info" href="javascript:;">Pages</a></li>
        			<li class="breadcrumb-item text-lg text-info active" aria-current="page">Patient Registration</li>
      				</ol>
      				<h6 class="font-weight-bolder mb-0 text-info">Patient Registration</h6>      
    			</nav>    
  			</div>
		</nav>
	<div class="container-fluid py-4">
	<h3 class="text-center text-info">Patient Registration Form</h3>
	<form:form action="/LMS/editsave" method="POST" modelAttribute="patient">
	<div class="container pt-5">
		<div class="row g-2">
			<div class="col-5">			
				<div class="p-3 m-2 border bg-blue text-dark">Patient ID:
					<form:hidden path="pid"/>
				</div>
			  </div>
			  <div class="col-5">			
				<div class="p-2 m-2 border bg-blue text-dark">Password:
					<input type="text" disabled/>
				</div>
			  </div>
		  <div class="col-5">			
			<div class="p-2 m-2 border bg-blue text-dark">Patient Name:
				<form:input path="ptname"/>
			</div>
		  </div>		 
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue text-dark">Age:       
				<form:input type="text" path = "age"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-3 m-2 border bg-blue text-dark">Gender:
				<form:select path="sex"  size="1" class="select1 bg-light">
					<form:option value="selectgen" label="Select Gender"/>
					<form:option value="Male" label="Male"/>
					<form:option value="Female" label="Female"/>
					<form:option value="Other Gender" label="Other Gender"/>
				</form:select>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue text-dark">Father Name:
				<form:input path="fathername"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue text-dark">NRC No. :				
				<form:input path="nrc" id="nrc"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue text-dark">Date of Birth:
				<form:input type="date" path="dob"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue text-dark">Email Address:
				<form:input path="email" placeholder="example@gmail.com"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue text-dark">Address:
				<form:input path="address"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue text-dark">Phone No. :
				<form:input type="text" path="phone"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue text-dark">Refer Physician:
				<form:input type="text" path="refer"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-3 m-2 border bg-blue text-dark">Nation: 
				<form:select name="nat" path="nation" id="nati" size="1" class="select1 bg-light">
					<form:option value="selectone">Select Nation</form:option>
					<form:option value="Myanmar">Myanmar</form:option>
					<form:option value="Foreigner">Foreigner</form:option>					
				</form:select>
			</div>
		  </div>		  		  
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue text-dark">Country:
				<form:input type="text" path="country"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue text-dark">State:
				<form:input type="text" path="state"/>
			</div>
		  </div>
		</div>
	  </div>
	   <button type="submit" class="btn bg-info text-white">Edit Save</button>
	   <a href="showList"><button type="submit" class="btn bg-info text-white">Cancel</button></a>
	  </form:form>
	 </div>
</main>
 
</body>
</html>