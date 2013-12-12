<!DOCTYPE html>
<html lang="en">

<head>

<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<meta charset="utf-8">
<title>ISI</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="css/flat-ui.css" rel="stylesheet">
<link href="shortcut icon" rel="images/favicon.ico">

<style>
			.center{
				width:800px;
				margin:0px auto;
				}
				
			.center2{
			background-color:#fff;
			width:1000px;
			margin:0px auto;
			}
			
			.navbar .nav li a{
			padding:22px 2px;
			}
			
			th{
			width:200px;
			text-align:center;
			}
			
</style>

</head>


<body style="background-color:#69BC9C;width:1200px;height:700px;	margin:0px auto;
">
<br>

<nav class="navbar navbar-default center" role="navigation">


  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">

    <a class="navbar-brand" href="#">
	<button type="button" class="btn btn-default btn-lg">
	<span class="glyphicon glyphicon-user"></span>
	</button>	ISI 

	</a>
	
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    
    <ul class="nav navbar-nav navbar-right btn-group"">

		 <li ><a href="#"><button type="button" class="btn btn-default">Contul meu</button></a></li>
		  <li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><button type="button" class="btn btn-default">Sistem de pontare <b class="caret"></b></button></a>
			<ul class="dropdown-menu">
			  <li><a href="#">Completeaza timesheet</a></li>
			  <li><a href="#">Timesheet angajati</a></li>
			  <li class="divider"></li>
			  <li><a href="#">Rapoarte angajati</a></li>
			  <li class="divider"></li>
			  <li><a href="#">Servicii</a></li>
			</ul>
		  </li>

		  <li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><button type="button" class="btn btn-default">Rapoarte <b class="caret"></b></button></a>
			<ul class="dropdown-menu">
			  <li><a href="#">Rezumat Angajat</a></li>
			  <li><a href="#">Sumar Proiect</a></li>
			  <li><a href="#">Sumar Proiecte</a></li>

			  
			</ul>
		  </li>
		  
		  <li><a href="#"><button type="button" class="btn btn-default">Ajutor</button></a></li>

    </ul>

  </div><!-- /.navbar-collapse -->
</nav>
<hr>
<ol class="breadcrumb">
  <li><a href="#">Sistem de pontare</a></li>
  <li class="active">Completeaza timesheet</li>
</ol>
<hr>
<div class="center2">
	<table>
		<tr>
			<td style="width:800px;height:300px" valign="top">
				<table border=1>
					<tr>
						<th>Saptamana 1</th>
						<th>Saptamana 2</th>
						<th>Saptamana 3</th>
						<th>Saptamana 4</th>
					</tr>
					<?php for($i=1;$i<6;$i++){ 
						echo "<tr>";
						$j=$i;
						 echo "<td>Ziua{$j}</td>"; 
						 $j+=7;
						 echo "<td>Ziua{$j}</td>"; 
						 $j+=7;
						 echo "<td>Ziua{$j}</td>"; 
						 $j+=7;
						 echo "<td>Ziua{$j}</td><tr>"; 

						 }?>

					

				</table>
			</td>
			<td style="width:200px;height:300px;background-color:#ECEEF0;" valign="top">
				<table width="100%">
					<tr>
						<td align="center">
							Completeaza
						</td>
					</tr>
					<tr>
						<td align="center">
							Trimite timesheet
						</td>
					</tr>
					
				</table>
			</td>
		</tr>
	</table>

</div>




</body>

</html>