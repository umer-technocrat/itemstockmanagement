<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>Sign up</title>
</head>
<body style="background-color: gray;">
<center>
<div class="text-center">
  <img src="image/p1.jpg" class="rounded" alt="logo">
</div>
<h1>Sign up</h1>
<form action="UserController" method="post">
<input type="hidden" name="command" value="ADD"/>
	<%
	String msg=(String)request.getAttribute("msg");			
	if (msg != null)
		{ 
		%>
		<h3 style="color: red;"><%=msg%></h3>
		<%}
	%>
<table>
<tr>		<!-- table row -->
<td>User ID :</td>		<!-- table data -->
<td> <input type="text" name="userId" required="required" placeholder="Enter user ID"> </td> <!--  -->
</tr>

<tr>
<td> password</td>
<td> <input type="password" name="password" required="required" placeholder="Enter Password"> </td>
</tr>

<tr>
<td> First Name:</td>
<td> <input type="text" name="FirstName" required="required" placeholder="Enter First Name"></td>
</tr>

<tr>
<td> Last Name:</td>
<td> <input type="text" name="LastName" required="required" placeholder="Enter Last Name"></td>
</tr>

<tr>
<td> Address:</td>
<td> <textarea rows="4" cols="21" name="address" placeholder="Enter Address"></textarea> </td>
</tr>

<tr>
<td> City:</td>
<td>
<select name="city" style="background-color: silver;">
<option>Delhi</option>
<option>Chandigarh</option>
<option>Hydrabad</option>
<option>Banglore</option>
</select>
</td>
<option value="Delhi">
</tr>

<tr>
<td colspan="2" align="center"><input type="submit" value="sign up"></td>
</tr>


</table>
</form>
</center>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>