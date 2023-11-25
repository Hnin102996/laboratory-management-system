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
    @media print {
        @page {
            size: 6.5in 9in; /* Set the desired print page size */
            margin: 1in; /* Set the desired print margins */
        	}
        
        body {
            width: 2in; /* Set the desired width within print boundaries */
            height: 1in; /* Set the desired height within print boundaries */
            margin-top: 1in;
            margin-bottom: 2in; /* Remove any default body margin */
        	}
    }
    	body{
    		background-color:lightblue;
    		}
  
            h1{
                text-align: center;
                color: blueviolet;
                
            }
            .center{
                display: block;
                margin-left: auto;
                margin-right: auto;
                width: 80px;
            }
            .table1{                
                border-top: 2px solid black;              
                border-spacing: 25px;                             
            }                  
            tr,th,td{
                padding-right: 20px;
                padding-left: 20px;
            }
            .b{
                border-bottom: 2px;
                border-color: darkblue;
                border-style: dashed;
            	}
            @ media print{body{
            		width: 300px;
            	height:50px;
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
        			<li class="breadcrumb-item text-lg text-info active" aria-current="page">Preview Voucher</li>
      				</ol>
      				<h6 class="font-weight-bolder mb-0 text-info">Preview Voucher</h6>      
    			</nav>    
  			</div>
		</nav>
	<div class="container-fluid py-4">
	<!-- <h3 class="text-center text-info">Preview Voucher</h3>-->
	<div class="container"></div>
	<div class="container">
        <img src="iLab.jfif" class="center">
        <h3 style="text-align: center; color: blueviolet;">iLab Laboratory</h3>
        <h4 style="text-align: center; color: blueviolet;">High Quality Helath Care Service</h4>
        <h6 style="text-align: center; color: blueviolet;">Between 65st*66st, Theikpan Street, Chan Mya Thar Si Township, Mandalay </h6>
        <h6 style="text-align: center; color: blueviolet;">&#128222; Phone - 024065551,02406552,02406553</h6>
    </div>
    <div class="container">
    <form:form   modelAttribute="voucher">
        <table align="center" class="table1">
       
            <tr>
                <td class="text-dark">Paitent ID: ${patient.pid}</td>
                <td class="text-dark">Password: ${patient.pt_password}</td>
            </tr>
            <tr>
                <td class="text-dark">Patient Name: ${patient.ptname}</td>
                <td  class="text-dark">Refer Physician: ${patient.refer}</td>
            </tr>
            <tr>
                <td class="text-dark">Slip No. ${idv }</td>
                <td class="text-dark">Staff Name: ${userName}</td>
            </tr>
            <tr>
                <td class="text-dark">Time: ${ctime }</td>
                <td class="text-dark">Date: ${cdate }</td>
            </tr>
            <tr style="border: 2px dashed black; border-left: none; border-right: none;">
                <th style="text-align: left;" class="text-dark">Test Name</th>
                <th style="text-align: left;" class = "text-dark">Amount</th>                  
            </tr>
            
            <c:forEach var="selectTest" items="${selectTests}">
            	<c:forEach var="test" items="${testlist}">
            		<c:if test="${selectTest eq test.tid}">
           				 <tr>
                			<td class="text-dark">${test.test_name}</td>
                			<td class="text-dark">${test.price}</td>
                			<c:set var="totalPrice" value="${totalPrice + test.price}"/>
            			 </tr>
            		</c:if>
             	</c:forEach>
             </c:forEach>
            <tr style="border: 2px dashed black; border-left: none; border-right: none;">
                <td style="text-align: left;" class="text-danger">Total Amount:</td> 
                <td style="text-align: left;" class="text-danger"> ${totalPrice}</td>                              
            </tr>                                 
        </table><br><br><br>
         <div class="container text-center">
    		<button class="btn btn-secondary text-primary me-md-4"  type="button" onclick = "PrintVoucher()">Print</button>
    		<a href="editvoucher/${idv}"><button class="btn btn-secondary text-primary " type="button">Edit</button></a>
    		<a href="ReceptionVoucherPage" class="btn btn-secondary text-primary" role="button">Close</a>      
    	</div>        
    </form:form>  
    </div>
     <script>
     	function PrintVoucher(){
     		window.print();
     	}
     </script>
     </div>
     <script>
    // Check if the voucher ID is already set in localStorage
    let voucherId = localStorage.getItem('vid');

    if (!voucherId) {
        // Generate a new voucher ID if it doesn't exist
        voucherId = generateVoucherId();
        localStorage.setItem('vid', voucherId);
    }

    // Use the voucher ID in your code where needed
    // For example, you can set it as the value of an input field or display it in the page
</script>
     
     </main>
</body>
</html>