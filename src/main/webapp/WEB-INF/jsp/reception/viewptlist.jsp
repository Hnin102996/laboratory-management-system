<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
     <%@ page import="java.sql.*" %>
       <%
    if(session.getAttribute("userObject") == null){
    	response.sendRedirect("ReceptionLogin");
    }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            body{
               
                background-repeat: no-repeat;
                background-size: cover;
                height: 100vh;
            }
            .table1{
                border:2px solid green;
                margin-left:0px;                
            }
            .td{
                padding: 2px;
                border-style: groove;
                border-color: blue;
                }  
            .div{
                border-style: groove;
                border-color: blue;
            }
            h3{
				color:violet;
			} 
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
        			<li class="breadcrumb-item text-lg text-info active" aria-current="page">Show Paitient List</li>
      				</ol>
      				<h6 class="font-weight-bolder mb-0 text-info">Show Patient List</h6>      
    			</nav>    
  			</div>
		</nav>
	<div class="container-fluid py-4">
	<h3 class="text-center text-info">Show Patient List</h3>	                          
  <form:form action="searchbyme" method="POST" modelAttribute="patient">
  	 <div class="container"><h5 style="color:red;">${msg }</h5></div>
      <div class="container pt-5 text-left">      
        <label name="id" class="text-info">Search Patient</label>        	      
        <form:input path="searchvalue" style="height:30px;" placeholder="Search Patient"/>      
        <button type="submit" class="btn btn-info text-white" style="width:80px; height:30px; text-align:center;">Search</button> <br>  
         <a href="showAddForm"> <button type="button" class="btn btn-info text-white m-0" style="width:160px;">Add New Patient</button> </a>
      </div><br><br> 
  </form:form>       
      <div class="container-fluid">
        <table class="table align-items-center mb-0 bg-gradient-light">
          <thead class="table-info">
            <tr style="text-align:center;">
                <th >Patient Name</th>
                <th >Age</th>
                <th >Sex</th>                
                <th>Address</th>
                <th>Father Name</th>               
                <th>Refer Doctor</th>            
                <th>Register Date</th>                
                <th>Action</th>
            </tr>
          </thead>          
            <c:forEach var="patient" items="${patientList}">
             <tr style="text-align: center;">           
                <td class="text-dark">
                	${patient.ptname }
                </td>
                <td class="text-dark">
                	${patient.age }
                </td>  
                <td class="text-dark">
                	${patient.sex }     
                </td>                
                <td class="text-dark">
                	${patient.address }  
                </td>
                <td class="text-dark">
                	${patient.fathername }
                </td>
                <td class="text-dark">
                	${patient.refer }
                </td>               
                <td class="text-dark">
                	${patient.date}
                </td>                
                <td class="align-middle text-center">
                   		<a href="editpatient/${patient.pid}" class="text-info font-weight-bold text-sm text-center"><i class="fas fa-edit"></i></a>  
                		<a href="deletepatient/${patient.pid}" onclick="confirm()" class="text-info font-weight-bold text-sm text-center"><i class="fas fa-trash"></i></a>
                 </td>    			              
             </tr>
           </c:forEach>           
        </table>
        </div>
        <div class="container">        
        <h6 style="text-align: left;" class="text-dark">Total Count: ${count} </h6>
        </div>                      
      <script>
			function confirm() {
									alert("<h4 text-color="red">Are you sure you want to delete!</h4>");
								}
</script>
</div>
</main>
</body>
</html>