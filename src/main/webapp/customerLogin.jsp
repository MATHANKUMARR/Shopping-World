<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Online Shopping World</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon"
	href="https://www.freepnglogos.com/uploads/world-map-png/world-map-world-earth-globe-vector-graphic-pixabay-25.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
body {
	background-image:
		url(https://images.pexels.com/photos/1631677/pexels-photo-1631677.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940);
	background-size: cover;
}

span {
	color: red;
}
</style>



</head>
<body>

	<!-- if you want to create login page and register page together in one page ...you have to only chnage his name...that's it...                 -->
	<div class="container" style="margin-top: 5%;">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-md-4">


				<br />

				<div class="col-sm-12">

					<br />


					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">
							<h1 class="text-center text-success">Customer Login</h1>

							<form method='POST' action="customerLogin">

								<div class="form-group">
									<label for="customername">User Name</label> <input type="text"
										id="username" name="username" class="form-control"
										placeholder="Username" required="" autofocus="">
								</div>

								<div class="form-group">
									<label for="pwd">Password</label> <input type="password"
										id="password" name="password" class="form-control"
										placeholder="Password" required="">
								</div>
								<input type="submit" onClick="fun()" value="submit" name="submit" class="btn btn-success"/>
							</form>
							<br> <br> <span>${SPRING_SECURITY_LAST_EXCEPTION.message}</span>
							<br />

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function fun(){
			localStorage.setItem("userName",document.getElementById("username").value);
			localStorage.setItem("pass",document.getElementById("password").value);
			
		}
	</script>
	
</body>
</html>
