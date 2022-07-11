<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon"
	href="https://www.freepnglogos.com/uploads/world-map-png/world-map-world-earth-globe-vector-graphic-pixabay-25.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">

<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<title>Online Shopping World</title>

<style>
.alert {
	background: #AFEDAF;
	padding: 20px 40px;
	min-width: 300px;
	position: fixed;
	right: 0;
	top: 10px;
	border-radius: 4px;
	border-left: 8px solid #59A359;
	overflow: hidden;
	opacity: 0;
	pointer-events: none;
	z-index: 3;
}

.alert.showAlert {
	opacity: 1;
	pointer-events: auto;
}

.alert.show {
	animation: show_slide 1s ease forwards;
}

@
keyframes show_slide { 0%{
	transform: translateX(100%);
}

40




%
{
transform




:




translateX


(




-10


%
)


;
}
80




%
{
transform




:




translateX


(




0


%
)


;
}
100




%
{
transform




:




translateX


(




-10px




)


;
}
}
.alert.hide {
	animation: hide_slide 1s ease forwards;
}

@
keyframes hide_slide { 0%{
	transform: translateX(-10px);
}

40




%
{
transform




:




translateX


(




0


%
)


;
}
80




%
{
transform




:




translateX


(




-10


%
)


;
}
100




%
{
transform




:




translateX


(




100


%
)


;
}
}
.alert .fa-check-circle {
	position: absolute;
	left: 20px;
	top: 50%;
	transform: translateY(-50%);
	color: #1C6E1C;
	font-size: 30px;
}

.alert .msg {
	padding: 0 20px;
	font-size: 18px;
	color: #1C6E1C;
}

.alert .close-btn {
	position: absolute;
	right: 0px;
	top: 50%;
	transform: translateY(-50%);
	background: #AFEDAF;
	padding: 20px 18px;
	cursor: pointer;
}

.alert .close-btn:hover {
	background: #69D569;
}

.alert .close-btn .fas {
	color: #1C6E1C;
	font-size: 22px;
	line-height: 40px;
}

body {
	background-color: #B3E5FC; //
	background-image: url('C:\Users\rmath\Desktop\Pics\1.jpg');
	border-radius: 10px
}

.card {
	border: none;
	border-radius: 0px;
	background-color: #fff
}

.text1 {
	font-size: 13px;
	color: #cbcbcb
}

.info {
	line-height: 17px
}

.cost span {
	color: #fb3531;
	font-weight: bold;
	font-size: 20px
}

.star {
	color: #FBC02D
}

.watchcost span {
	color: #286783;
	font-weight: bold;
	font-size: 20px
}

.watch {
	background: #286783
}

.tshirtcost span {
	color: #0012b2;
	font-weight: bold;
	font-size: 20px
}

.tshirt {
	background-color: #0012b2
}

.cursor {
	cursor: pointer
}

.profile {
	position: relative;
	text-align: right;
	z-index: 2;
}

.profile img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	border: 2px solid green;
	cursor: pointer
}

.dropdown-content {
	display: none; //
	position: absolute;
	background-color: #f1f1f1;
	min-width: 100px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	transition: all 2s
}

.dropdown {
	float: right;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.casb {
	position: relative;
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
	color: black;
}

.e-button-text {
	font-size: 15px;
	background-color: orange;
	padding: 10px;
	border-radius: 10px;
}
</style>

<script>

$(document).ready(function() {
	$('button').click(function(){
        $('.alert').addClass("show");
        $('.alert').removeClass("hide");
        $('.alert').addClass("showAlert");
        setTimeout(function(){
          $('.alert').removeClass("show");
          $('.alert').addClass("hide");
        },5000);
      });
      $('.close-btn').click(function(){
        $('.alert').removeClass("show");
        $('.alert').addClass("hide");
      });
});

var xhttp = new XMLHttpRequest();

xhttp.onreadystatechange =   function tableFromJson() {
if(this.readyState ==4 && this.status ==200){
       let products = JSON.parse(this.responseText);

       const tableBody = document.getElementById("products");
       let dataHTML = '';
       
       var col = [];
       for (var i = 0; i < products.length; i++) {
           for (var key in products[i]) {
               if (col.indexOf(key) === -1) {
                   col.push(key);
               }
           }
       }
       for (var i = 0; i < products.length; i++) {

			var pathrr = products[i][col[3]].split("\\");

			var fairPath = pathrr[pathrr.length - 2] + "\\"
					+ pathrr[pathrr.length - 1];
			
			var path =products[i][col[3]].replace(/\\/g, " ");

			dataHTML += "<div class='col-md-4 casb'><div class='card mt-3'><div class='product-1 align-items-center p-2 text-center'><img src='"+fairPath+"' class='rounded' width='150' height='150'><h5>"
			+ products[i][col[1]]
			+ "</h5><div class='mt-3 info'><span class='text1 d-block'>Include discounts</span></div><div class=' tshirtcost mt-3 text-dark'><span>Rs."
			+ products[i][col[2]]
			+ "/-</span><div class=' star mt-3 align-items-center'><i class='fa fa-star'></i> <i class='fa fa-star'></i> <iclass='fa fa-star'></i> <i class='fa fa-star'></i> <iclass='fa fa-star'></i></div></div></div><button class='btn btn-success' value = 'Edit' onclick='Update("
					+products[i][col[0]]+" ,\" "+products[i][col[1]]+" \",\""+products[i][col[2]]+" \",\""+path+"\")'>Edit</button><button id='del' class='btn btn-danger mt-1' value = 'Delete' onclick='Delete("+ products[i][col[0]]+ ")'>Delete</button></div></div>";

		}

       
       tableBody.innerHTML = dataHTML;
       
   }
}

function Update(id,name,price,path){

	sessionStorage.setItem("id",id);
	sessionStorage.setItem("productName",name.trim());
	sessionStorage.setItem("productPrice",price);
	sessionStorage.setItem("path",path.replace(/ /g, "\\"));
	
	window.location.href="/updateProduct";
}


function Delete(row){
    var data1 = row;
    const response = fetch('http://localhost:8081/admin/deleteProduct/'+data1, {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' }
    })
	

    
    window.location.reload();

}

xhttp.open("GET","http://localhost:8081/admin/getProducts",true);
xhttp.send();

</script>
</head>

<body>
	<div class="container">
		<br>
		<h1 class="text-center p-3 border bg-light">Product Page</h1>
		<a href="/addNewProduct" class="btn btn-primary btn-sm">Add
			Product</a> <a href="/adminLogout"
			class="float-end btn btn-danger btn-sm">Logout</a> <br> <br>
			<div class="alert hide">
			<span class="fas fa-check-circle"></span> <span class="msg">Added to the cart!</span>
			<div class="close-btn">
				<span class="fas fa-times"></span>
			</div>
		</div>
		<div class="container mb-5 mt-5">
			<div class="row" id="products"></div>

		</div>
	</div>
</body>


</html>