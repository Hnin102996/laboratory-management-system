<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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
	<title>Make Voucher</title>
	
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
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
form{
	width:auto;
	height:auto;
	}
table,tr,td{
 	border:none;  
 	max-height:500px;
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

	.select1{
		width: 150px;		
	}
	h3{
		text-decoration-color: blueviolet;
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
        			<li class="breadcrumb-item text-lg text-info active" aria-current="page">Edit Voucher</li>
      				</ol>
      				<h6 class="font-weight-bolder mb-0 text-info">Edit Voucher</h6>      
    			</nav>    
  			</div>
		</nav>
	<div class="container-fluid py-4">
	<h3 class="text-center text-info">Edit Voucher</h3>
<c:if test="${isError}">
<div class="container pt-5"><h4 class="text-danger">${errormsg}</h4></div>
</c:if>
	<form:form action="showptinfo" method="POST" modelAttribute="patient">		
	  <div class="container pt-5">	  	   
		<div class="row g-2">
			<div class="col-5">			
				<div class="p-2 m-2 border bg-info text-white">Patient ID:
				<input name="ptid" type="text" value="${voucher.pid}">
				<button type="submit">Enter</button>
				</div>
			</div>			  
		  <div class="col-5">			
			<div class="p-2 m-2 border bg-info text-white">Patient Name:
				<input name="ptname" type="text" value="${voucher.ptname}"/>
			</div>
		  </div>		 
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">Age & Sex:       
				<input name="age" type="text" value ="${voucher.age}" style="width:80px;">
				<input name="sex" type="text" style="width:150px;" value="${voucher.sex}">
			</div>
		  </div>		  			  
		  <div class="col-5">
			<div class="p-2 m-2 border bg-info text-white">Refer Physician:
				<input name="refer" type="text" value="${voucher.refer}">
			</div>
		  </div>
	   </div>
	   </div>
    </form:form><br>
   	<!-- ------------------------------------------------------------- -->
    <div style="overflow:scroll;max-height:600px;display:inline-block;margin-left:150px;">
   <c:if test="${isError}">
		<div class="container pt-5"><h4 class="text-danger">${errormsg}</h4></div>
	</c:if>
	<form:form action="/LMS/editsavevoucher" method="POST" modelAttribute="voucher">
	<input type="text" name="pid" value="${voucher.pid}" style="width:30px;">
	 <label name="searchtest">Search Tests</label>
	  <input type="text" placeholder="search test by name" id="searchInput">
	   <div class="container pt-5">	   
		<table class="table align-items-center mb-0 bg-gradient-light">
			<thead class="table-info">
				<tr style="text-align: center;">
					<th  id="select">Select</th>
					<th  id="testid">Test ID</th>
					<th id="testname">Test Name</th>
                	<th  id="testgroup">Test Group</th>
                	<th  id="price">Price</th>                
                	<th  id="refergroup">Refer Group</th>                	               	
				</tr>
			</thead>
			<tbody>
			<c:forEach var="test" items="${testlist}">
				<tr style="text-align: center;">
				
					<td >
					<input type="checkbox" name="selecttestid" value="${test.tid}" 
					<c:if test="${id1
					.contains(test.tid)}">checked
					</c:if>
					>
					</td>
					
					<td class="text-dark">${test.tid}</td>
					<td class="text-dark">${test.test_name}</td>
					<td class="text-dark">${test.testgroup}</td>
					<td class="text-dark">${test.price}</td>
					<td class="text-dark">${test.refergroup}</td>					
				</tr>
			</c:forEach>
		</tbody>
		</table>
		</div>		
		<button type="submit" class="btn btn-info text-white" style="width:150px;">Save</button>
	     <a href="ReceptionVoucherPage"> <button type="button" class="btn btn-info text-white" style="width:80px;">Cancel</button> </a><br>
	</form:form>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!--  <script>
	$(document).ready(function() {
	    $('#searchInput').keyup(function() {
	        var inputText = $(this).val();

	        $('table tbody tr').each(function() {
	            var testname = $(this).find('td:nth-child(3)').text();

	            if (testname.toLowerCase().includes(inputText.toLowerCase())) {
	                $(this).show();
	            } else {
	                $(this).hide();
	            }
	        });
	    });
	});
	
	</script>-->
	<!--  <script>
		var checkbox = document.getElementById('testCheckbox');
		if (checkbox.checked){
			
		}
	</script> -->  
    </div>
    </div>
    </main>
    <!-- ----------------------------------------------------------- -->
</body>
</html>