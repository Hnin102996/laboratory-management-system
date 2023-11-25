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
			.text_center{
			 		text-align:center;
			}
	</style>
<title>Show Test List</title>
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
	<form:form action="" method="POST" modelAttribute="test">
		<div class="container pt-5 text-left">      
        <label name="searchtest">Search</label>        	      
        <input style="height:30px;" type="text" placeholder="Search by test name" id="searchInput"></input> 
        </div>   
	   <div class="container pt-5" class="tl">
	   	<div class="bg-gradient-info shadow-primary border-radius-xl pt-4 pb-3" style="width:1100px; height:70px;">
       	<h6 class="text-white text-capitalize ps-3">Test Table</h6>
   		</div> 
		<table class="table align-items-center mb-0 bg-gradient-light">
			<thead class="table-info" style="text-align:center;">
				<tr style="text-align: center;">
					<th >Test ID</th>
					<th >Test Name</th>
                	<th >Test Group</th>
                	<th >Price</th>                
                	<th >Refer Group</th>               	               	
				</tr>
			</thead>
			 <tbody id="myTable"  data-current-page="1" aria-live="polite" >
			<c:forEach var="test" items="${tlist}">
				<tr style="text-align: center;">
					<td class="text-dark">
					${test.tid}
					</td>
					<td class="text-dark">
					${test.test_name}
					</td>
					<td class="text-dark">
					${test.testgroup}
					</td>
					<td class="text-dark">
					${test.price}
					</td>
					<td class="text-dark">
					${test.refergroup}
					</td>			
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</form:form>
	<div class="container">        
        <h5 style="text-align: left;">Total Count: ${count} </h5>
        </div>
	 <div class="d-flex justify-content-center mt-4">
    		<nav aria-label="Test Pagination">
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
	<!--  <script>
		function submitTest(){
			const form = document.querySelector('form');
			form.addEventListener('submit', (e) => {
				e.preventDefault();
				let tl = [];
				document.querySelectorAll('[type="checkbox"]').forEach(item => {
					if(item.checked === true){	
						tl.push(item.value);
						}
					})
					console.log(tl);
			});
			
			
			
				$.ajax({
					  url: "showVoucher",
					 data: {"tl":tl}
					 });
		
	</script>-->
	<script>
  var win = navigator.platform.indexOf('Win') > -1;
  if (win && document.querySelector('#sidenav-scrollbar')) {
    var options = {
      damping: '0.5'
    }
    Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
  }
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
	    $('#searchInput').keyup(function() {
	        var inputText = $(this).val();

	        $('table tbody tr').each(function() {
	            var testname = $(this).find('td:nth-child(2)').text();

	            if (testname.toLowerCase().includes(inputText.toLowerCase())) {
	                $(this).show();
	            } else {
	                $(this).hide();
	            }
	        });
	    });
	});
	
	</script> 
	<script>
	const testsPerPage = 10; // Number of vouchers per page
	const testRows = document.querySelectorAll("#myTable tr");
	const paginationButtons = document.getElementById("paginationButtons");
	const prevButton = document.getElementById("prevPage");
	const nextButton = document.getElementById("nextPage");

	let currentPage = 1;
	const pageNumber=12;
	updateButtonState();

	function displayPage(pageNumber) {
    	const startIndex = (pageNumber - 1) * testsPerPage;
    	const endIndex = startIndex + testsPerPage;

    	testRows.forEach((row, index) => {
    		const rowNumber = index + 1; // Add 1 to match your row numbering
            const displayStyle = rowNumber >= startIndex + 1 && rowNumber <= endIndex ? "table-row" : "none";
            row.style.display = displayStyle;
    });

    currentPage = pageNumber;
    updateButtonState();
}

	function updateButtonState() {
	    prevButton.disabled = currentPage === 1;
	    nextButton.disabled = currentPage === Math.ceil(testRows.length / testsPerPage);
	}

	prevButton.addEventListener("click", () => {
	    if (currentPage > 1) {
	        displayPage(currentPage - 1);
	    }
	});

	nextButton.addEventListener("click", () => {
	    const totalPages = Math.ceil(testRows.length / testsPerPage);
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
</body>
</html>