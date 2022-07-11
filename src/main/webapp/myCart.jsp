<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="https://www.freepnglogos.com/uploads/world-map-png/world-map-world-earth-globe-vector-graphic-pixabay-25.png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
<title>Online Shopping World</title>
<style>
table {
    width: 100%;
}

thead, tbody, tr, td, th { display: block; }

tr:after {
    content: ' ';
    display: block;
    visibility: hidden;
    clear: both;
}

thead th {
    height: 40px;
}

tbody {
    height: 420px;
    overflow-y: auto;
}
tbody td{
	height:50px;
}
tbody td, thead th {
    width: 20%;
    float:left
}
body {
    margin-top: 5px;
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
	<div class="container" ><br>
	<h1 class="text-center text-white bg-black p-2">My cart</h1>
	<div class="container">
    <div class="dropdown">
        <div class="profile"> <img class="dropbtn" src="http://www.arve.tech/iot/user/assets/login_user_image_light_blue.png">
            <div class="dropdown-content">
                <ul>
                    <li><a href="#">Hi! ${username}</a></li>
                    <li><a href="/customerLogout">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
	<table class="table table-hover" id="tableData">
  <thead>
    <tr class="text-center">
      <th scope="col">Product Id</th>
      <th scope="col">Product Name</th>
      <th scope="col">Product Price (Rupees)</th>
      <th scope="col">Quantity</th>
      <th scope="col">Remove</th>
    </tr>
  </thead>
  <tbody id="cartData"></tbody>
</table>
<hr>
<a  href="#recipt" class="btn btn-success float-end" onclick = "Javascript:fun()">Calculate Bill</a>
	</div>
	<!-- th:href="@{/calculate_bill}"-->
	
	<br><br><br><hr>
<center>	
<div style="padding-left: 550px; ">
    <div class="row" id="recipt">
        <div class=" well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
        <div class="text-center">
                    <h1>Receipt</h1>
                </div>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <strong>Online World</strong>
                        <br>
                        221, Barathi Nagar,
                        <br>
                        Coimbatore, Pin-641035
                        <br>
                        <abbr title="Phone">P:</abbr> (213) 484-6829
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <p>
                        <em>Date: <span id="date"></span> <span id="month"></span>, <span id="year"></span></em>
                    </p>
                    <p>
                        <em>Receipt #: <span id="num"></span>W</em>
                    </p>
                </div>
            </div>
            <div class="row">
                
              
                <div id="myDynamicTable"></div>
               <h4 ><div id="total" style="float:right"></div></h4> 
                <a type="button" href="/payment" class="btn btn-success btn-lg btn-block">
                    Pay Now<span class="glyphicon glyphicon-chevron-right"></span>
                </a></td>
                
            
        </div>
        <br><br><br><br><br><br><br><br>
    </div>
    

	
	
	<script type="text/javascript">
	

	
	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange =   function tableFromJson() {

	if(this.readyState ==4 && this.status ==200){
	       let products = JSON.parse(this.responseText);

	       const tableBody = document.getElementById("cartData");
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
	    	   dataHTML += "<tr class='text-center'><td>"+products[i][col[0]]+"</td><td>"+products[i][col[1]]+"</td><td>"+products[i][col[2]]+"</td><td><input class='text-center' type='number' name='quantity' id='quantity' value='1' min='1' max='1000' step='1'></input></td><td><a class='btn btn-dark' onclick='deleteFromCart("+products[i][col[0]]+")'>Remove</a></td></tr>";
	       }
	       
	       tableBody.innerHTML = dataHTML;
	       
	   }
	}

	function deleteFromCart(row){
	    var data1 = row;
	    const response = fetch('http://localhost:8081/user/removeFromCart/'+data1, {
	        method: 'DELETE',
	        headers: { 'Content-Type': 'application/json' }
	    })
	    location.reload();
	}

	xhttp.open("GET","http://localhost:8081/user/getCart",true);
	xhttp.send();

	//---------------------------------------------------------------------------------------------------------------------//
	
		function fun() {
			
			//Month array 
			const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
			
			//Date Object 
			const d = new Date(); 
			
			//Get current date and set id value
			document.getElementById("date").innerHTML = d.getDate();
			
			//Get current month name and set id value
			let month = months[d.getMonth()];
			document.getElementById("month").innerHTML = month;
			
			//Get current year and set id value
			document.getElementById("year").innerHTML = d.getFullYear();
			
			//Recipt number random generator
			
			let x = Math.floor((Math.random() * 1000000000) + 1);
			document.getElementById("num").innerHTML = x;
			
			var table = document.getElementsByTagName("table")[0];
			var tbody = table.getElementsByTagName("tbody")[0];
			var tr = table.getElementsByTagName("tr");
			
			var all = [];
			
			
			
			var tot=0;
			
			for(var i=0;i<tr.length;i++){
				var cells = tr[i].getElementsByTagName("td");
				var data = [];
				for(var j=0;j<cells.length;j++){
					if(j==3){
						var qty=cells[j].getElementsByTagName("input")[0].value;
						data.push(qty);
					}else if(j==2){
						var price=cells[j].innerHTML;
						data.push(price);
					}else if(j==4){ 
						var subtotal=price*qty;
						tot=tot+(price*qty); 
						data.push(subtotal);
					}else{
							data.push(cells[j].innerHTML);
					}
				}
				all.push(data);
			}
			
			all.push(localStorage.getItem("userName"));
			all.push(localStorage.getItem("pass"));
			localStorage.removeItem("userName");
			localStorage.removeItem("pass");
			
			//String jsonStr = JSONArray.toJSONString(all);
			
			//////////////////////////////////////////////////////////////////////
			
			const response = fetch('http://localhost:8081/user/addCart/'+all,
					{
		        method: 'POST',
		        headers: { 'Content-Type': 'application/json' }
		    })
		    
		    
		    
			//////////////////////////////////////////////////////////////////////
			
			
			var myTableDiv = document.getElementById("myDynamicTable");
		      
		    var table = document.createElement('TABLE');
		    
		    var tableBody = document.createElement('TBODY');
		    table.appendChild(tableBody);
		     
		    for (var k=0; k<tr.length;k++){
		       var tr1 = document.createElement('TR');
		       tableBody.appendChild(tr1);
		       
		       for (var l=0; l<cells.length; l++){
		           var td = document.createElement('TD');
		           
		           if(k==0){
		        	   if(l==0){
		        		   var bold = document.createElement("b");
		        		   var productId = document.createTextNode("Product ID");
		        		   bold.appendChild(productId);
		        		   td.appendChild(bold); 
		        	   }
		        	   else if(l==1){
		        		   var bold = document.createElement("b");
		        		   var productId = document.createTextNode("Name");
		        		   bold.appendChild(productId);
		        		   td.appendChild(bold); 
		        	   }else if(l==2){
		        		   var bold = document.createElement("b");
		        		   var productId = document.createTextNode("Price");
		        		   bold.appendChild(productId);
		        		   td.appendChild(bold); 
		        	   }else if(l==3){
		        		   var bold = document.createElement("b");
		        		   var productId = document.createTextNode("Qty");
		        		   bold.appendChild(productId);
		        		   td.appendChild(bold); 
		        	   }
		        	   else if(l==4){
		        		   var bold = document.createElement("b");
		        		   var productId = document.createTextNode("Sub Total");
		        		   bold.appendChild(productId);
		        		   td.appendChild(bold); 
		        	   }
		           }else{
		        	   td.appendChild(document.createTextNode(all[k][l])); 
		           }
		           
		           tr1.appendChild(td);
		       }
		    }
		    myTableDiv.appendChild(table);
		    document.getElementById("total").innerHTML="Total: Rs."+tot+".00/-";
		    
		   
		}
	
		
	
</script>
<h1 id="demo"></h1>

</body>

</html>