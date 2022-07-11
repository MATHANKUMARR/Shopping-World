<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Online Shopping World</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js" ></script>
<style>
* {
  box-sizing: border-box;
}

input[type=password], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: center;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 50px;
  justify-content:center;
  margin:50px;
  margin-left:370px;
  width:50%;

}

#img_url {
  background: #ddd;
  width:100px;
  height: 90px;
  display: block;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

#but{
	margin-top:20px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>

<h2 align = "center">Update Product</h2>

<div class="container">
  <form id ="myForm" method="post" action="saveUpdateProduct" enctype="multipart/form-data">
  <div class="row" hidden>
      <div class="col-25">
        <label for="rollNo">Product Id</label>
      </div>
      <div class="col-75">
        <input type="text" id="productId" name="productId">
      </div>
    </div>
    <div class="row" hidden>
      <div class="col-25">
        <label for="rollNo">Path</label>
      </div>
      <div class="col-75">
        <input type="text" id="path" name="path">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="rollNo">Product Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="productName" name="productName" >
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="studentName">Product Price</label>
      </div>
      <div class="col-75">
        <input type="text" id="productPrice" name="productPrice">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="rollNo">Image</label>
      </div>
      <div class="col-75">
        <input type="file" id="image" name="image" accept="image/png, image/jpeg" onChange="img_pathUrl(this);"><img src="" id="img_url" alt="your image">
      </div>
    </div>
    <div class="row" id="but">
    <center>
      <input type="submit" value="Submit" style="text-align:center">
    </center>
    </div>
  </form>
</div>

<script type="text/javascript">
function img_pathUrl(input){
    $('#img_url')[0].src = (window.URL ? URL : webkitURL).createObjectURL(input.files[0]);

}

$(document).ready(function(){

	  $("#myForm").validate({
	    rules:{
	    	productName:{required:true},
	    	productPrice:{required:true},
	      },
	    messages:{
	    	productName:"Enter product name",
	    	productPrice:"Enter product price",
	      
	    }

	  });

	});
var path = sessionStorage.getItem("path");
var productId = sessionStorage.getItem("id");
var productName = sessionStorage.getItem("productName");
var productPrice = sessionStorage.getItem("productPrice");

document.getElementById('productId').value = productId.trim();
document.getElementById('productName').value = productName.trim();
document.getElementById('productPrice').value = productPrice.trim();
document.getElementById('path').value = path.trim();

//var img = document.createElement("img");

var path = path.split("\\");

var fairPath = path[path.length-2]+"\\"+path[path.length-1];

document.getElementById('img_url').src = fairPath;
/*
function updateExisting(){
	const thisForm = document.getElementById('myForm');
	thisForm.addEventListener('submit', async function (e) {
	    e.preventDefault();
	    const formData = new FormData(thisForm).entries()
	    const response = await fetch('http://localhost:8081/admin/updateProduct/'+productId, {
	        method: 'PUT',
	        headers: { 'Content-Type': 'application/json' },
	        body: JSON.stringify(Object.fromEntries(formData))
	    })
	    const result = await response.json();
	    window.location.href="/admin_home";
	});
}
*/
</script>
</body>
</html>
    