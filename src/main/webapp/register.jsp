	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online shopping World</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="https://www.freepnglogos.com/uploads/world-map-png/world-map-world-earth-globe-vector-graphic-pixabay-25.png">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
  
body{
  background-image: url(https://images.pexels.com/photos/1631677/pexels-photo-1631677.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940);
  background-size: cover;
}

span{
	color:red;
}


#user_admin{
	width:100%;
}
</style>
</head>
<body>

<!-- if you want to create login page and register page together in one page ...you have to only chnage his name...that's it...                 -->
<div class="container" style="margin-top: 5%;">
  <div class="row">
    <div class="col-sm-4"> </div>
<div class="col-md-4">
  

<br/>
	
<div class="col-sm-12">

  <ul class="nav nav-pills" >



    <li class="" style="width:50%"><a class="btn btn-lg btn-default" data-toggle="tab" href="#home">Owner</a></li>
   
    <li class=" " style="width:48%"><a class=" btn btn-lg btn-default" data-toggle="tab" href="#menu1">Customer</a></li>



  </ul>

<br/>


  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
	<h1 class="text-center text-success"> Login page</h1>
      
<form class="col-5 w-100" action="/checkAdmin"  method="post">

			<div class="form-group">
				<label for="adminname" class="form-label">User Name</label>
				<input type="text"  name="username" placeholder="Username" class="form-control width" id="username" required>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1" class="form-label">Password</label>
				<input type="password"  name="password" placeholder="Password" class="form-control" id="password" required>
			</div>
			
			<button type="submit" class="btn btn-success">Login</button>
		</form><br><br>
		<span id="msg">${SPRING_SECURITY_LAST_EXCEPTION.message}</span>
<br/>






</div>

    <div id="menu1" class="tab-pane fade">
    				<span><h6>${error}</h6></span>
	<h1 class="text-center text-success"> Register page</h1>

	<form class="col-5" id="register"  method="post">

			<div class="form-group">
				<label for="exampleFormControlInput1" class="form-label">User Name *</label>
				<input type="text" name="customername" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1" class="form-label">Email *</label>
				<input type="text" name="email" class="form-control"  title="Eg -> expleo@montbleu.in" required>
				<!-- pattern="[A-Za-z0-9]{5,}[@]{1}[A-Za-z]{3,}[.]{1}[A-Za-z]{3,}" -->
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1" class="form-label">Password *</label>
				<input type="text" name="password" class="form-control" minlength="4" required>
			</div>
			
			<button type="submit" onclick="addNewCustomer()" class="btn btn-success">Submit</button>
		</form>
<br/>
<a href="/customerLogin" class="pull-right btn btn-block btn-success" > Already Register ?   </a><br><br>
 </div>
   </div>
  </div>
</div>
</div>
</div>


<script type="text/javascript">
$(document).ready(function(){

	  $("#myForm").validate({
	    rules:{
	    	productName:{required:true},
	    	productPrice:{required:true},
	      },
	    messages:{
	    	productName:"Enter Product Name",
	    	productPrice:"Enter product Price"    
	    }
	  });
	});
	
function addNewCustomer(){
	var flag = false;
	const thisForm = document.getElementById('register');
	thisForm.addEventListener('submit', async function (e) {
	    e.preventDefault();
	    const formData = new FormData(thisForm).entries()
	    	
	    	const response = await fetch('http://localhost:8081/user/addCustomer', {
	    		method: 'POST',
	    		headers: { 'Content-Type': 'application/json' },
	    		body: JSON.stringify(Object.fromEntries(formData))
	    	})
	    	window.location.href="/customerLogin";
	});
}

xhttp.open("POST","http://localhost:8081/user/addCustomer",true);
xhttp.send();

</script>

</body>
</body>
</html>
    