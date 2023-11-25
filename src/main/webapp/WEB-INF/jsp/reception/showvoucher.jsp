<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%
    if(session.getAttribute("userObject")== null){
    	response.sendRedirect("ReceptionLogin");
    }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
	    	a:visited {color: blue;}
			.bg-blue{
				background-color:#6495ed;
				}
			.bg_body{
				background-color: lightblue;
				}
			tr:nth-child(even){background-color:whitesmoke;}
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
        			<li class="breadcrumb-item text-lg text-info active" aria-current="page">View Test List</li>
      				</ol>
      				<h6 class="font-weight-bolder mb-0 text-info">View Test List</h6>      
    			</nav>    
  			</div>
		</nav>
	<div class="container-fluid py-4">
	<h3 class="text-center text-info">Show Test List</h3>
	<form:form action="" method="POST" modelAttribute="voucher">
 		<div class="container pt-5">
 		<a href="showVoucherlist"> <button type="button" class="btn btn-info text-white" style="width:80px;">Close</button> </a><br><br>
        <table class="table table-bordered table-hover table-light">
        <thead class="table-info" style="text-align:center;">
            <tr style="border-color: green; text-align: center;">
            	<th style="border-color: green;">Voucher ID</th>
           	    <th style="border-color: green;">Patient ID</th>
                <th style="border-color: green;">Patient Name</th>
                <th style="border-color: green;">Password</th>                
                <th style="border-color: green;">Age</th>                
                <th style="border-color: green;">Refer Doctor</th>               
                <th style="border-color: green;">Test Name</th>
                <th style="border-color: green;">Date</th>
            </tr>
            </thead>
            <c:forEach var="voucher" items="${vdlist}">
            
            <tr style="border-color: green; text-align: center;">
            <c:if test="${cstatus == 'Deactive'}" style="background-color: #cd5c5c;"></c:if>
                <td style="border-color: green;">${voucher.vid }</td>
                <td style="border-color: green;">${voucher.pid }</td>
                <td style="border-color: green;">${voucher.ptname }</td>
                <td style="border-color: green;">${voucher.pt_password}</td>
                <td style="border-color: green;">${voucher.age }</td>                
                <td style="border-color: green;">${voucher.refer}</td>                
                <td style="border-color: green;">${voucher.test_name}</td>
                <td style="border-color: green;">${voucher.date}</td>
            </tr>
             </c:forEach>
         </table>
        </div>       
        </form:form>
        </div>
        </main>
</body>
</html>