<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>Login form</title>
<link rel="stylesheet"  type="text/css" href="newlgn.css">
</head>
<!-- <body style="background-color:graytext;"> -->
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<!-- <div class="container-fluid">
<div class="row h-100">
   <div class="col-sm-12 my-auto">
     <div class="card card-block w-25">

<div style="background-image: url('image/p3.jpg');"> -->


						<!--  -->
	

<form class="box" action="UserController" method="post"> <!--this is use to make form -->
<input type="hidden" name="command" value="USER"/>
<h1>Login Form</h1>
<%
	String msg=(String)request.getAttribute("msg");			
	if (msg != null)
		{ 
		%>
		<h3 style="color:green; "><%= msg %></h3>
		<% }
	%>


<table>		<!-- to from the table in sequence -->
<tr>		<!-- table row -->
<td>User ID :</td>		<!-- table data -->
<td> <input type="text" name="userId" placeholder="Enter you UserId" required="required"> </td> <!-- required is use for mandatory -->
</tr>
<tr>
<td> password: </td>
<td> <input type="password" name="password" placeholder="Enter your password" required autofocus> </td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="Login"></td> <!-- colspan is use to  -->
</tr>
</table>
</form>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<!-- </div>
   </div>
</div>
</div>
</div> -->
</body>
</html>