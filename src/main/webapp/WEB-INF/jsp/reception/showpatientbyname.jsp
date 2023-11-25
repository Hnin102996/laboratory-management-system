<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<style>
			.bg_body{
					background-color: lightblue;
					}
					
			
			tr:hover{
					background-color:lightskyblue;
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
        			<li class="breadcrumb-item text-lg text-info active" aria-current="page">Show Patient List</li>
      				</ol>
      				<h6 class="font-weight-bolder mb-0 text-info">Show Patient List</h6>      
    			</nav>    
  			</div>
		</nav>
	<div class="container-fluid py-4">
	<h3 class="text-center text-info">Show Patient List</h3>
<form:form action="searchByName/${patient.ptname}" method="POST" modelAttribute="patient">
 <div class="container pt-5">
        <table class="table align-items-center mb-0 bg-light">
        <thead class="bg-gradient-light">
            <tr style=" text-align: center;" class="text-dark table-info">
           	    <th>Patient ID</th>
                <th>Patient Name</th>               
                <th>Age</th>
                <th>Sex</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Email Address</th>
                <th>Father Name</th>
                <th>Refer Doctor</th>
                <th>NRC No</th>
                <th>Date Of Birth</th>
                <th>Nation</th>                
                <th>Country</th>
                <th>State</th>
                <th>Date</th>
            </tr>
            </thead>
            <c:forEach var="patient" items="${list}">
            <tr style="text-align: center;">
                <td>
                	${patient.pid }
                </td>
                <td>${patient.ptname }</td>
                <td>
                	 ${patient.age }
                </td>  
                <td>
                	 ${patient.sex }
               </td>
               <td>
                	${patient.phone }
                </td>                  
                <td>
                	${patient.address }
                </td>
                <td>
                	 ${patient.email }
                </td>
                <td>
                	 ${patient.fathername }
                </td>
                <td>
                	 ${patient.refer }
                </td>
                <td>
                	 ${patient.nrc }
                </td>              
                <td>
                	${patient.dob}
                </td>
                <td>
                	${patient.nation }
               </td>                
                <td>
                	${patient.country }
                </td>
                <td>
                	${patient.state}
                </td>
                             
                <td>
                	${patient.date}
                </td> 
            </tr>
             </c:forEach>
         </table>
        </div>       
        </form:form>
        </div>
        </main>
</body>
</html>