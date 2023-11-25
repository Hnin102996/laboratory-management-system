<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">        
        <style>
            body{
                background-color: whitesmoke;
                background-repeat: no-repeat;
                background-size: cover;
                height: 100vh;
            }
            .table1{
                border:2px solid green;
                margin:5px;                                
            }
            .td{
                padding: 2px;
                border-style: groove;
                border-color: blue;
                }  
            .tr{
               border:2px solid blue;
               decoration-color: blueviolet;
             }
        </style>
</head>
<body>
<div class="container border border-color-dardblue">
            <h3 class="text-primary"> View Cancel Test Lists</h3>
            <ul class="nav nav-tabs margin-left-10">		  
              <li class="dropdown">
                <a class="dropdown-toggle text-primary" data-toggle="dropdown" href="#">Reception</a>
                <ul class="dropdown-menu text-primary">
                  <li><a href="ReceptionRegisterPage" class="text-primary">Patient Registration</a></li>
			  	  <li><a href="ReceptionVoucherPage" class="text-primary">Make Voucher</a></li>
			  	  <li><a href="ReceptionViewPatientHistoryPage" class="text-primary">View Patient History</a></li>
			 	  <li><a href="ReceptionViewPatientListPage" class="text-primary">View Patient List By Day/Month/Year</a></li>			   
			  	  <li><a href="ReceptionViewVoucherPage" class="text-primary">View Vouchers</a></li>
			  	  <li><a href="ReceptionViewTestListPage" class="text-primary">View Daily Test Lists</a></li>
			  	  <li><a href="ReceptionTestCancelPage" class="text-primary">Cancel Test</a></li> 
			  	  <li><a href="ReceptionViewCancelTestPage" class="text-primary">View Cancel Test Lists</a></li>                                        
                </ul>
              </li>
              <li><a href="view3.html" class="text-primary">Save</a></li>
              <li><a href="#" class="text-primary">Edit</a></li>
              <li><a href="#" class="text-primary">Delete</a></li>
              <li><a href="Toregistration.html" class="text-primary">Close</a></li>		  
            </ul>
        </div>
         <br><br>          
            <form>
            <div class="container">
                  <table class="table table-bordered table1">
            <tr>
                <th style="border-color: green; text-align: center;">Patient Name</th>
                <th style="border-color: green; text-align: center;">Age</th>                
                <th style="border-color: green; text-align: center;">Patient ID</th>               \
                <th style="border-color: green; text-align: center;">Refer Doctor</th>                
                <th style="border-color: green; text-align: center;">Test Name</th>
                <th style="border-color: green; text-align: center;">Staff Name</th>
                <th style="border-color: green; text-align: center;">Dept Name</th>
                <th style="border-color: green; text-align: center;">Date & Time</th>
            </tr>
            <tr style="border-color: green; text-align: center;">
                <td style="border-color: green;">U Win Mya</td>
                <td style="border-color: green;">50</td>
                <td style="border-color: green;">001</td>               
                <td style="border-color: green;">Dr Mg Mg Gyi</td>              
                <td style="border-color: green;">Electrolye</td>
                <td style="border-color: green;">Aye Aye</td>
                <td style="border-color: green;">Reception</td>
                <td style="border-color: green;">2/1/2023 10:00AM</td>
            </tr>
            <tr style="border-color: green; text-align: center;">
                <td style="border-color: green;">Daw May Mya</td>
                <td style="border-color: green;">38</td>
                <td style="border-color: green;">002</td>
                <td style="border-color: green;">Dr Mya Mya Hnin</td>
                <td style="border-color: green;">Cholesterol</td>
                <td style="border-color: green;">Mon Mon</td>
                <td style="border-color: green;">Phlebotomy</td>
                <td style="border-color: green;">2/1/2023 12:00</td>
            </tr>
        </table>
                </div>
            </form>
</body>
</html>