<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="java.sql.*" %>
  <%
    if(session.getAttribute("userObject")== null){
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
			.bg_green{
						background-color:lightgreen;
			}  
			
        </style>
<title>Patient Detail Table</title>
</head>
<body class="g-sidenav-show bg_body">
<!--<form:form action="" method="POST" modelAttribute="patient">-->
<jsp:include page="mainnav.jsp" >
		<jsp:param value="" name=""/>
	</jsp:include>
 <main class="main-content border-radius-lg ">
		<nav class="navbar navbar-main navbar-expand-sm px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
  			<div class="container-fluid py-1 px-3">
    			<nav aria-label="breadcrumb">
   					<ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-lg-20 me-5">
        			<li class="breadcrumb-item text-lg"><a class="opacity-7 text-info" href="javascript:;">Pages</a></li>
        			<li class="breadcrumb-item text-lg text-info active" aria-current="page">View Patient Detail List</li>
      				</ol>
      				<h6 class="font-weight-bolder mb-0 text-info">View Patient Detail List</h6>      
    			</nav>    
  			</div>
		</nav>
		
	<div class="container-fluid py-4">
	<!--  <h3 class="text-center text-info">Patient Detail List</h3>-->
	
 	<form:form action="searchbyme" method="POST" modelAttribute="patient">
  	 <div class="container"><h5 style="color:red;">${msg }</h5></div>
      <div class="container pt-5 text-left">      
        <label name="id">Search Patient</label>        	      
        <form:input path="searchvalue" style="height:30px;" placeholder="Search Patient"/>     
        <button type="submit" class="btn btn-info text-white" style="width:80px;">Search</button><br>   
      </div><br><br> 
  </form:form>
  <div class="bg-gradient-info shadow-primary border-radius-xl pt-4 pb-3" style="width:1250px; height:70px;">
       <h6 class="text-white text-capitalize ps-3">Patient Detail Table</h6>
   </div>       
      <div class="container-fluid">
        <table class="table align-items-center mb-0 bg-gradient-light">
          <thead class="table-info">
            <tr style="text-align: center;">
            	<th >Patient ID</th>
                <th >Patient Name</th>
                <th >Password</th>
                <th >Age</th>
                <th>Sex</th>                
                <th >Address</th>
                <th >Email Address</th>
                <th>Father Name</th>               
                <th>Refer Doctor</th>
                <th>NRC No</th>
                <th>Date Of Birth</th>
                <th>Nation</th>               
                <th>Country</th>
                <th>State</th>
                <th>Phone</th>                
                <th>Register Date</th>                
                <th>Action</th>
            </tr>
          </thead> 
          <tbody id="myTable"  data-current-page="1" aria-live="polite" >         
            <c:forEach var="patient" items="${patientList}">
             <tr style="text-align: center;"> 
             	<td class="text-dark">
             		${patient.pid }
             	</td>             
                <td class="text-dark">
                	${patient.ptname }
                </td>
                <td class="text-dark">
                	 ${patient.pt_password }
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
                	${patient.email }
                </td>
                <td class="text-dark">
                	 ${patient.fathername }
                </td>
                <td class="text-dark">
                	 ${patient.refer }
                </td>
                <td class="text-dark">
                	${patient.nrc }
                </td>              
                <td class="text-dark">
                	${patient.dob}
                </td>
                <td class="text-dark">
                	 ${patient.nation }
               </td>                
                <td class="text-dark">
                	${patient.country }
                </td>
                <td class="text-dark">
                	${patient.state}
                </td>
                <td class="text-dark">
                	${patient.phone }
                </td>               
                <td class="text-dark">
                	${patient.date}
                </td> 
                <td class="align-middle text-center">
                   		<a href="editpatient/${patient.pid}" class="text-info font-weight-bold text-sm text-center"><i class='fas fa-edit' style='font-size:15px;'></i></a>  
                		<a href="deletepatient/${patient.pid}" onclick="confirm()" class="text-info font-weight-bold text-sm text-center"><i class="fas fa-trash"></i></a>
                 </td>               
           </c:forEach>   
           </tbody>        
        </table>
        </div>
        <div class="container">        
        <h5 style="text-align: left;">Total Count: ${count} </h5>
        </div>
        <div class="d-flex justify-content-center mt-4">
    		<nav aria-label="Patient Pagination">
        		<ul class="pagination" id="paginationButtons">
            		<li class="page-item" id="prevPage">
                		<a class="page-link" href="#" aria-label="Previous" onclick="handlePreviousClick()">
                    		<span aria-hidden="true">&laquo;</span>
                		</a>
            		</li>
            		<li></li>
            		<li class="page-item" id="nextPage">
                		<a class="page-link" href="#" aria-label="Next" onclick="handleNextClick()">
                    		<span aria-hidden="true">&raquo;</span>
               			 </a>
            		</li>
        		</ul>
   			 </nav>
		</div>
                              
      <script>
      	function confirm(){
      		alert("<h4 text-color="red">Are you sure you want to delet!</h4>");
      	}
      </script>
      <script>
	const patientsPerPage = 10; // Number of vouchers per page
	const patientRows = document.querySelectorAll("#myTable tr");
	const paginationButtons = document.getElementById("paginationButtons");
	const prevButton = document.getElementById("prevPage");
	const nextButton = document.getElementById("nextPage");

	let currentPage = 1;
	const pageNumber=12;
	updateButtonState();

	function displayPage(pageNumber) {
    	const startIndex = (pageNumber - 1) * patientsPerPage;
    	const endIndex = startIndex + patientsPerPage;

    	patientRows.forEach((row, index) => {
    		const rowNumber = index + 1; // Add 1 to match your row numbering
            const displayStyle = rowNumber >= startIndex + 1 && rowNumber <= endIndex ? "table-row" : "none";
            row.style.display = displayStyle;
    });

    currentPage = pageNumber;
    updateButtonState();
}

	function updateButtonState() {
	    prevButton.disabled = currentPage === 1;
	    nextButton.disabled = currentPage === Math.ceil(patientRows.length / patientsPerPage);
	}

	prevButton.addEventListener("click", () => {
	    if (currentPage > 1) {
	        displayPage(currentPage - 1);
	    }
	});

	nextButton.addEventListener("click", () => {
	    const totalPages = Math.ceil(patientRows.length / patientsPerPage);
	    if (currentPage < totalPages) {
	        displayPage(currentPage + 1);
	    }
	});

	

// Initial setup
	//const totalPages = Math.ceil(voucherRows.length / vouchersPerPage);
	//updatePaginationButtons(totalPages);
	displayPage(currentPage); // Show the first page

</script>
      </div>
      </main>
     <!--   </form:form>-->
</body>
</html>