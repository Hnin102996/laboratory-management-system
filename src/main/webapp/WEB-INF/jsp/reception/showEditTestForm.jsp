<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta content="width=device-width, initial-scale=1.0" name="viewport">	
	<title>Make Voucher</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script src="${common.url}/assets/js/mvd.js"></script>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
	tr,th,td{
		border: 2px solid green;
	}
	  
</style>
</head>
<body>
   	<!-- ------------------------------------------------------------- -->
  <div style="overflow:scroll;max-height:600px;display:inline-block;margin-left:150px;">
   <c:if test="${isError}">
		<div class="container pt-5"><h4 class="text-danger">${errormsg}</h4></div>
	</c:if>
	<form:form action="LMS/editsavetest" method="POST" modelAttribute="test">
	<form:input type="text" path="pid" value="${pid}" style="width:30px;"></form:input>
	 <label name="searchtest">Search Tests</label>
	  <input type="text" placeholder="search test by name" id="searchInput">
	   <div class="container pt-5">	   
		<table class="table table-bordered table-hover table-light">
			<thead class="bg-info">
				<tr style="border-color: green; text-align: center;">
					<th style="border-color: green;" id="select">Select</th>
					<th style="border-color: green;" id="testid">Test ID</th>
					<th style="border-color: green;" id="testname">Test Name</th>
                	<th style="border-color: green;" id="testgroup">Test Group</th>
                	<th style="border-color: green;" id="price">Price</th>                
                	<th style="border-color: green;" id="refergroup">Refer Group</th>                	               	
				</tr>
			</thead>
			<tbody>
			<c:forEach var="test" items="${testlist}">
				<tr style="border-color: green; text-align: center;">
					<td style="border-color: green;"><input type="checkbox" name="selecttestid"value="${test.tid}"></td>
					<td style="border-color: green;">${test.tid}</td>
					<td style="border-color: green;">${test.test_name}</td>
					<td style="border-color: green;">${test.testgroup}</td>
					<td style="border-color: green;">${test.price}</td>
					<td style="border-color: green;">${test.refergroup}</td>					
				</tr>
			</c:forEach>
		</tbody>
		</table>
		</div>
		<button type="submit">Edit Save</button>
	   <a href="showVoucher"><button type="submit">Cancel</button></a>
	</form:form>
</div>
</body>
</html>