<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Date" %>
<%! Date birthdate = new Date(); %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta content="width=device-width, initial-scale=1.0" name="viewport">	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

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
    
<title>Patient Registration</title>
<style>

table,tr,td{
 	border: none;  
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
	h3{
	color:violet;
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
		height: 30px;				
	}
	label{
	width:150px;
	font-family:'Times New Roman', Times, serif;
	font-size:medium;
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
<body class="g-sidenav-show bg_body">
<form:form action="save" method="POST" modelAttribute="patient" class="bg_body">
<jsp:include page="mainnav.jsp" >
		<jsp:param value="" name=""/>
	</jsp:include>
 	<main class="main-content border-radius-lg ">
		<nav class="navbar navbar-main navbar-expand-sm px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
  			<div class="container-fluid py-1 px-3">
    			<nav aria-label="breadcrumb">
   					<ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-lg-20 me-5">
        			<li class="breadcrumb-item text-lg"><a class="opacity-7 text-info" href="javascript:;">Pages</a></li>
        			<li class="breadcrumb-item text-lg text-info active" aria-current="page">${pageName}</li>
      				</ol>
      				<h6 class="font-weight-bolder mb-0 text-info">${pageName}</h6>      
    			</nav>    
  			</div>
		</nav>
		<div class="container-fluid py-4">
	<h3 class="text-center text-info">Patient Registration Form</h3>
	<div class="container pt-5 justify-content-center">
		<div class="row g-2">
		<div class="col-5">			
			<div class="p-2 m-2 border bg-blue " ><label class="text-white">Patient Name:</label>
				<form:input path="ptname" required="true"></form:input>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>			
			  <div class="col-5">			
				<div class="p-2 m-2 border bg-blue"><label class="text-white">Password:</label>
					<input type="text" disabled/>
				</div>
			  </div>		  		 
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label class="text-white">Age:</label>       
				<form:input type="text" id="age" name="age" path = "age" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label class="text-white">Gender:</label>
				<form:select path="sex"  size="1" class="select1 bg-light text-info" required="true">
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
			<div class="p-2 m-2 border bg-blue"><label class="text-white">Father Name:</label>
				<form:input path="fathername" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label class="text-white">NRC No. :</label>				
				<form:input path="nrc" id="nrc" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label class="text-white">Date of Birth:</label>
				<form:input type="date" id="birthdate" name="birthdate" onchange="calculateAge()" path="dob" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label class="text-white">Email Address:</label>
				<form:input path="email" placeholder="example@gmail.com"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label class="text-white">Address:</label>
				<form:input path="address" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label class="text-white">Phone No. :</label>
				<form:input type="text" path="phone" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label class="text-white">Refer Physician:</label>
				<form:input type="text" path="refer" required="true"/>
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label class="text-white">Nation: </label>
				<form:select name="nat" path="nation" id="nati" size="1" class="select1 bg-light text-info">
					<form:option value="selectnation">Select Nation</form:option>
					<form:option value="Myanmar">Myanmar</form:option>
					<form:option value="Foreigner">Foreigner</form:option>					
				</form:select>
			</div>
		  </div>		  		  
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label class="text-white">Country:</label>
				<form:input type="text" path="country"/>
			</div>
		  </div>
		  <div class="col-5">
			<div class="p-2 m-2 border bg-blue"><label class="text-white">State:</label>
				<form:input type="text" path="state"/>
			</div>
		  </div>
		</div>
	  </div>
	   <button type="submit" class="btn btn-info text-white m-5" style="height:40px;">Register</button>
	   </div>
	   </main>	   
 </form:form>
 <!-- <script>
  var win = navigator.platform.indexOf('Win') > -1;
  if (win && document.querySelector('#sidenav-scrollbar')) {
    var options = {
      damping: '0.5'
    }
    Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
  }
</script> -->
<script>
  function calculateAge() {
    var birthdate = new Date(document.getElementById("birthdate").value);
    var currentDate = new Date();
    var age = currentDate.getFullYear() - birthdate.getFullYear();

    // Adjust the age if the current month is before the birth month or
    // if the current month is the same but the current day is before the birth day
    if (
      currentDate.getMonth() < birthdate.getMonth() ||
      (currentDate.getMonth() === birthdate.getMonth() &&
        currentDate.getDate() < birthdate.getDate())
    ) {
      age--;
    }

    document.getElementById("age").value = age;
  }
</script>




<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
 
</body>
</html>