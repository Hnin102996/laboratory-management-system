<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
     <%@ page import="java.sql.*" %> 
   <%
    if(session.getAttribute("userObject")==null){
    	response.sendRedirect("ReceptionLogin");
    }

%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
        
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
            body{
               
                background-repeat: no-repeat;
                background-size: cover;
                height: 100vh;
            }
            .table1{
                border:2px solid green;
                margin-left:0px;                
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
					
		.canceled-voucher-row {
    						background-color: #ffcccc; /* You can change the color as per your preference */
							}
					  
        </style>
<title>Show Voucher</title>
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
        			<li class="breadcrumb-item text-lg text-info active" aria-current="page">View Voucher List</li>
      				</ol>
      				<h6 class="font-weight-bolder mb-0 text-info">View Voucher List</h6>      
    			</nav>    
  			</div>
		</nav>
	<div class="container-fluid py-4">
	<h3 class="text-center text-info">Show Voucher List</h3>	                          
  	<form:form action="searchbyall" method="POST" modelAttribute="voucher">
  	 <div class="container"><h5 style="color:red;">${ermes }</h5></div>
      <div class="container pt-5 text-left">      
        <label name="searchvoucher">Search</label>        	      
        <input style="height:30px;" type="text" placeholder="Search voucher by test name or doctor name" id="searchInput"></input>         
        <!--  <label name="date">Search Date</label>        	      
        <input type ="date" id="searchDate" style="height:30px;" placeholder="Enter Date"/>   -->
        <!-- <button type="submit" class="btn btn-info text-white" style="width:80px;">Search</button>-->   
         <a href="showAddVoucher"> <button type="button" class="btn btn-info text-white" style="width:80px;">New</button> </a>
         <!--  <a href="showReturnReceptionHome"> <button type="button" class="btn btn-info text-white" style="width:80px;">Close</button> </a>-->
      </div><br><br> 
  	</form:form>
  	<div class="bg-gradient-info shadow-primary border-radius-xl pt-4 pb-3" style="width:1150px; height:70px;">
       	<h6 class="text-white text-capitalize ps-3">Voucher Table</h6>
   	</div>
   	      
      <div class="table align-items-center mb-0 bg-light">
      	
        <table class="table align-items-center mb-0 bg-gradient-light">
          <thead class="table-info">
            <tr style="text-align: center;">
             	<th>Voucher ID</th>
            	<!--  <th style="border-color: green;">Patient ID</th>-->
                <th style="width:300px">Patient Name</th>
                <!-- <th style="border-color: green;width:300px">Patient Password</th> -->                
                <th >Age</th>                                               
                <th >Refer Doctor</th>
                <th >Tests</th>
                <th>Price</th>                        
                <th >Date</th>
                <th>Time</th>
                <th>Status</th>                
                <th >Action</th>
            </tr>
          </thead>   
          <tbody id="myTable"  data-current-page="1" aria-live="polite" >       
            <c:forEach var="voucher" items="${vlist}">
             <tr id="row-${voucher.vid}" style="text-align: center;"> <!--  <c:if test="${param.cstatus eq 'Deactive'}" >
                    background-color: #ffcccc;--> 
                    <!-- Set the background color for canceled vouchers -->
               <!--   </c:if> class="canceled-voucher-row" id="tablerow">-->
             	
                
             	<td class="text-dark">${voucher.vid}</td>         
                <td class="text-dark">${voucher.ptname }</td>
                <td class="text-dark">${voucher.age }</td>              
                <td class="text-dark">${voucher.refer }</td>
                <td class="text-dark">${voucher.test_name }</td>
                <td class="text-dark">${voucher.price } </td>                                           
                <td class="text-dark">${voucher.date} </td>
                <td class="text-dark">${voucher.time}</td>
                <td class="text-dark">${voucher.status}</td>                
                <td class="text-dark">
                <!-- <a href="editvoucher/${voucher.vid}">Edit</a>  --> 
                <form:form action="cancelvoucher/${voucher.vid}" method="post"> 
                <button type="submit" class="btn btn-light text-danger" onclick="cancelVoucher(${voucher.vid})">Cancel</button> 
                </form:form>
                </td>   			              
             </tr>
           </c:forEach>  
           </tbody>         
        </table>
        </div>
        
        
        <div class="container">        
        <h5 style="text-align: left;">Total Count: ${count} </h5>
        </div>                      
      	<div class="d-flex justify-content-center mt-4">
    		<nav aria-label="Voucher Pagination">
        		<ul class="pagination" id="paginationButtons">
            		<li class="page-item" id="prevPage">
                		<a class="page-link" href="#" aria-label="Previous" onclick="handlePreviousClick()">
                    		<span aria-hidden="true">&laquo;</span>
                		</a>
            		</li>
            		<li>           </li>
            		<li class="page-item" id="nextPage">
                		<a class="page-link" href="#" aria-label="Next" onclick="handleNextClick()">
                    		<span aria-hidden="true">&raquo;</span>
               			 </a>
            		</li>
        		</ul>
   			 </nav>
		</div>

    	
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script>
      $(document).ready(function() {
          $('#searchInput').keyup(function() {
              var inputText = $(this).val().toLowerCase();

              $('table tbody tr').each(function() {
                  var patientName = $(this).find('td:nth-child(2)').text().toLowerCase();
                  var testName = $(this).find('td:nth-child(5)').text().toLowerCase();
                  var doctorName = $(this).find('td:nth-child(4)').text().toLowerCase();

                  if (patientName.includes(inputText) || testName.includes(inputText) || doctorName.includes(inputText)) {
                      $(this).show();
                  } else {
                      $(this).hide();
                  }
              });
          });
      });
      </script>
     <script>
	$(document).ready(function() {
    $('#searchDate').keyup(function() {
        var inputDate = $(this).val();
        var formattedInputDate = convertDateFormat(inputDate); // Convert the date format

        $('table tbody tr').each(function() {
            var rowDate = $(this).find('td:nth-child(7)').text(); // Assuming date is in the 5th column

            // Compare formatted input date with row date
            if (rowDate.includes(formattedInputDate)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });

    // Function to convert date format (mm/dd/yyyy to yyyy/mm/dd)
    function convertDateFormat(inputDate) {
        var parts = inputDate.split("/");
        return parts[2] + "/" + parts[0] + "/" + parts[1];
    }
	});
</script>
<script>
	const vouchersPerPage = 10; // Number of vouchers per page
	const voucherRows = document.querySelectorAll("#myTable tr");
	const paginationButtons = document.getElementById("paginationButtons");
	const prevButton = document.getElementById("prevPage");
	const nextButton = document.getElementById("nextPage");

	let currentPage = 1;
	const pageNumber=12;
	updateButtonState();

	function displayPage(pageNumber) {
    	const startIndex = (pageNumber - 1) * vouchersPerPage;
    	const endIndex = startIndex + vouchersPerPage;

    	voucherRows.forEach((row, index) => {
    		const rowNumber = index + 1; // Add 1 to match your row numbering
            const displayStyle = rowNumber >= startIndex + 1 && rowNumber <= endIndex ? "table-row" : "none";
            row.style.display = displayStyle;
    });

    currentPage = pageNumber;
    updateButtonState();
}

	function updateButtonState() {
	    prevButton.disabled = currentPage === 1;
	    nextButton.disabled = currentPage === Math.ceil(voucherRows.length / vouchersPerPage);
	}

	prevButton.addEventListener("click", () => {
	    if (currentPage > 1) {
	        displayPage(currentPage - 1);
	    }
	});

	nextButton.addEventListener("click", () => {
	    const totalPages = Math.ceil(voucherRows.length / vouchersPerPage);
	    if (currentPage < totalPages) {
	        displayPage(currentPage + 1);
	    }
	});

	

// Initial setup
	//const totalPages = Math.ceil(voucherRows.length / vouchersPerPage);
	//updatePaginationButtons(totalPages);
	displayPage(currentPage); // Show the first page

</script>
<script>
<script>
function cancelVoucher(vid) {
    // Send an AJAX request to update the voucher status
    fetch(`/cancel-voucher/${vid}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
    })
    .then((response) => {
        if (response.ok) {
            // Update the background color of the row
            const row = document.getElementById(`row-${vid}`);
            if (row) {
                row.style.backgroundColor = '#ffcccc';
            }
        } else {
            console.error('Failed to cancel the voucher.');
        }
    })
    .catch((error) => {
        console.error('Error occurred:', error);
    });
}
</script>

</script>

      
	</div>
      </main>  
      
</body>
</html>