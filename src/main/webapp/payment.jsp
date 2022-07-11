<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="https://www.thymeleaf.org">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Online Shopping World</title>
<link rel="icon"
	href="https://www.freepnglogos.com/uploads/world-map-png/world-map-world-earth-globe-vector-graphic-pixabay-25.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<style>
body {
	background-color: gray;
}

.box {
	margin: 100px 500px 0px 500px;
	border-radius: 10px;
}

.box1 {
	margin-top: 30px;
	margin-left: 50px;
}

#int {
	border: 2px solid red;
	border-radius: 10px;
	padding: 7px;
}

#int:hover {
	border: 2px solid green;
	border-radius: 10px;
	padding: 7px;
}

 #int.visited {
 	border: 2px solid green;
	border-radius: 10px;
	padding: 7px;
 }

.headline {
	padding-top: 30px;
}

.button {
	position: relative;
	padding-bottom: 20px;
	padding-top: 50px;
}

.pay {
	border-radius: 25px;
	padding: 10px 90px 10px 90px;
	font-weight: bold;
}

.profile {
    position: relative;
    text-align: right;
}

.profile img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    border: 2px solid green;
    cursor: pointer
}

.dropdown-content {
    display: none;
    //position: absolute;
    background-color: #f1f1f1;
    min-width: 100px;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    z-index: 1;
    transition: all 2s
}

.dropdown{
	float: right;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.profile ul {
    background-color: gray;
    width: 200px;
    height: 100px;
    border-radius: 10px;
    right: -75px;
    top: 57px;
    position: absolute;
    padding: 8px;
    transition: all 0.5s;
    z-index: 1
}

.profile ul::before {
    content: '';
    position: absolute;
    background-color: gray;
	text-align: center;
    height: 10px;
    width: 10px;
    top: -5px;
	right: 95px;
    transform: rotate(45deg)
}

.profile ul li {
    list-style: none;
    text-align: left;
    font-size: 15px;
    padding: 10px;
    display: flex;
    align-items: center;
    transition: all 0.5s;
    cursor: pointer;
    border-radius: 4px
}

.profile ul li:hover {
    background-color: #eee
}

.profile ul li i {
    margin-right: 7px
}
a{
	color: black;
	text-decoration: none !important;
}
</style>
</head>
<body>
	<div class="container">
		<div class="dropdown">
			<div class="profile">
				<img class="dropbtn" src="http://www.arve.tech/iot/user/assets/login_user_image_light_blue.png">
				<div class="dropdown-content">
					<ul>
						<li><a href="#">Hi! ${username}</a></li>
						<li><a href="/customerLogout">Logout</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<form action="/payment_process">
		<div class="box bg-light">
			<div class="headline text-center">
				<h4>Debit Card</h4>
				</center>
			</div>
			<div class="box1">
				<input id="int" type="text" placeholder="Card Holder Name" onchange="this.className=(this.value=='')?'':'visited';" required />
			</div>
			<div class="box1">
				<input id="int" type="text"
					onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))"
					minlength="16" maxlength="16" placeholder="Card Number" onchange="this.className=(this.value=='')?'':'visited';" required />
			</div>
			<div class="box1">
				<input id="int" type="month" value="2022-01" placeholder="Expiration Date" onchange="this.className=(this.value=='')?'':'visited';"/><input id="int"
					type="password"
					onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))"
					placeholder="CVV" minlength="3" maxlength="3" onchange="this.className=(this.value=='')?'':'visited';" required />
			</div>
			<div class="button text-center">
				<input type="submit" class="pay btn btn-success text-center"
					value="Pay">
			</div>
		</div>
	</form>
</body>
</html>