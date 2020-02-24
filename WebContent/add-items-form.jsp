<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<title>List Items</title>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>



<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>

<div class="container">
<nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
      <a href="ItemController" class="navbar-brand">Pharmacy</a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item px-2">
            <a href="ItemController" class="nav-link active">Home</a>
          </li>
             
        </ul>

        <ul class="navbar-nav ml-auto">
        
           <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fa fa-user-times"></i> 
            </a>
          </li>
          
          <li class="nav-item mr-3">
            <a href="welcome.jsp" class="nav-link">
              <i class="fa fa-user"></i>welcome: ${user.firstName }
            </a>
           
          </li>
          <li class="nav-item">
            <a href="UserController?command=LOGOUT" class="nav-link">
              <i class="fa fa-user-times"></i> Logout
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</div>
<div class="container">
<header id="main-header" class="py-2 bg-warning text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
         <img src="image/p2.jpg" class="rounded float-left" alt="sanjeev"> <h1>Item Stock Management</h1>
        </div>
      </div>
    </div>
  </header>
  </div>

<div class="container">
<h3>ADD Item</h3>
<form action="ItemController" name="post">
<input type="hidden" name="command" value="ADD" />

<table>
<tbody>

<tr>		<!-- table row -->
<td>Item Name</td>		<!-- table data -->
<td> <input type="text" name="itemName" required="required" placeholder="Enter Item Name"> </td> <!--  -->
</tr>

<tr>
<td> Unit</td>
<td> <input type="text" name="unit" required="required" placeholder="Eg 20ml 200pcs"> </td>
</tr>

<tr>
<td>begning Inventery</td>
<td> <input type="number" name="begningInventery" required="required" placeholder="Enter begningInventery"></td>
</tr>

<tr>
<td>quantity On Hand</td>
<td> <input type="number" name="quantityOnHand" required="required" placeholder="Enter Quantity on hand"></td>
</tr>

<tr>
<td> Price Per Unit</td>
<td> <input type="number" name="pricePerUnit" required="required" placeholder="Enter  Price Per Unit" min="0"></td>
</tr>

<tr>
<td>Date Of Manufacture</td>
<td> <input type="date" name="dateOfManufacture" required="required" placeholder="Enter Date Of Manufacture"></td>
</tr>

<tr>
<td>Date of Expiry</td>
<td> <input type="date" name="dateOfExpiry" required="required" placeholder="Enter Date Of Expiry"></td>
</tr>


<tr>
<td>Location</td>
<td>
<select name="location" required="required" style="background-color: silver;">
<option value="" selected disabled hidden>choose here</option>
<option>Bulk Zone</option>
<option>Distribution Center</option>
<option>Pick Zone</option>
</select>
</td>
<option value="Bulk Zone">
</tr>

<tr>
<td>Item Category</td>
<td> <select name="itemCategory" required="required" placeholder="Enter Item Category">
<option value="" disabled selected hidden>choose here</option>
<option>Pharmacy Drug</option>
<option>Health and Personal Care</option>
<option>Medical Supplies and Equipment</option>
</select>
</td>
</tr>

<tr>
<td><label></label></td>
<td><button type="submit" class="btn btn-primary">Add Item</button></td>
</tr>

</tbody>
</table>
</form>
<form action="ItemController">
<button type="submit" class="btn btn-success">Back to List</button>
</form>
</div>


<body style="background-color: gray;">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>