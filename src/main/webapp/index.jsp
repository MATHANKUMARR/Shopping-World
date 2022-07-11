<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Online Shopping World</title>
<link rel="icon" href="https://www.freepnglogos.com/uploads/world-map-png/world-map-world-earth-globe-vector-graphic-pixabay-25.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
<style>
	body{
		background-color: #80ffdf;
	}
	
	.slg{
		margin: 130px 150px 0px 150px;
		padding:50px;
		font-family: "Algerian", Times, serif;
	}
	
	.pic{
		padding:50px 50px 200px 50px;
		margin: 5px 500px 0px 500px;
		background: url("https://www.freepnglogos.com/uploads/shopping-bag-png/shopping-bag-png-transparent-image-png-transparent-best-9.png");
		background-size:cover;
	}
	.login:hover{
		font-weight:bold;
	}
</style>
</head>
<body>
	<div class="bg">
	
	
		<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light mt-3">
  <!-- Container wrapper -->
  <div class="container">
    <!-- Navbar brand -->
    <a class="navbar-brand me-2" href="#">
      <img
        src="https://www.freepnglogos.com/uploads/world-map-png/world-map-world-earth-globe-vector-graphic-pixabay-25.png"
        height="50"
        alt=""
        loading="lazy"
        style="margin-top: -1px;"
      />
    </a>

    <!-- Collapsible wrapper -->
    <div class="collapse navbar-collapse" id="navbarButtonsExample">
      <!-- Left links -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link text-dark h5 m-0" href="#">Online World</a>
        </li>
      </ul>
      <!-- Left links -->

      <div class="d-flex align-items-center">
      	<a href="/register" class="login btn btn-dark me-3">Login</a>
      </div>
    </div>
    <!-- Collapsible wrapper -->
  </div>
  <!-- Container wrapper -->
</nav>
<!-- Navbar -->

		<!-- Slogen -->
		<div class="slg text-center display-4">
			<i>Don't Worry, We have it!</i>
		</div>
		
		<!-- Front page picture -->
		<div class="pic text-center">
		</div>
	</div>
</body>
</html>
