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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">

<style>
body {
	background-image:
		url(http://www.joburgchiropractor.co.za/images/background.jpg);
}

.payment {
	border: 1px solid #f2f2f2;
	height: 280px;
	border-radius: 20px;
	background: #fff;
}

.payment_header {
	background: green;
	padding: 20px;
	border-radius: 20px 20px 0px 0px;
}

.check {
	margin: 0px auto;
	width: 50px;
	height: 50px;
	border-radius: 100%;
	background: #fff;
	text-align: center;
}

.check i {
	vertical-align: middle;
	line-height: 50px;
	font-size: 30px;
}

.content {
	text-align: center;
}

.content  h1 {
	font-size: 25px;
	padding-top: 25px;
}

.content a {
	width: 200px;
	height: 35px;
	color: #fff;
	border-radius: 30px;
	padding: 5px 10px;
	background: green;
	transition: all ease-in-out 0.3s;
}

.content a:hover {
	text-decoration: none;
	background: #111;
	color:white;
}

.container {
	padding-top: 50px;
	padding-left: 400px;
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

.dropdown-content a {
	text-decoration: none;
	color:black;
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

	<div class="container">
		<div class="row">
			<div class="col-md-6 mx-auto mt-5">
				<div class="payment">
					<div class="payment_header">
						<div class="check">
							<i class="fa fa-check" aria-hidden="true"></i>
						</div>
					</div>
					<div class="content">
						<h1>Payment Success !</h1>
						<br> <a class="btn" href="/pdfGenerate">Get Report</a>
						<br>
						<br> <a href="/goToHome">Go to Home</a>
						
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>
