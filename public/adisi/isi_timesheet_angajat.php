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
			
			.detalii_angajat th,tr{
			text-align:center;
			}
			
			.detalii_angajat th{
			border-bottom:solid 1px;
			}
			
			tr.activitate_extra{
			border-top:solid 3px;
			}
			
</style>

</head>


<body style="background-color:#69BC9C;width:1200px;height:700px;	margin:0px auto;">
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
		  <li><a href="#"><button type="button" class="btn btn-default">Ajutor</button></a></li>

    </ul>

  </div><!-- /.navbar-collapse -->
</nav>
<hr>
<ol class="breadcrumb">
  <li><a href="#">Sistem de pontare</a></li>
  <li><a href="#">Timesheet angajati</a></li>
    <li><a href="#">Cristian Almariei</a></li>

   <li class="active">09-11-2013</li>

</ol>
<hr>
<div class="center2">

	<table >
		<tr>
			<td style="width:800px;height:300px" valign="top">
				<table class="detalii_angajat" width="100%">
					<tr>
						<th colspan=3>
								Timesheet 9/11/2013
						</th>
					</tr>
					<?php for($i=1;$i<4;$i++)
					echo "<tr>
						<td>
							<div class='input-group'>
							  <span class='input-group-addon'>Proiect</span>
							  <input type='text'  placeholder='Tipografie'>
							</div>
						</td>
						<td>
							<div class='input-group'>
							  <span class='input-group-addon'>Client</span>
							  <input type='text'  placeholder='DOMINIUM SRL'>
							</div>
						</td>
					
						<td>
							<div class='input-group'>
							  <span class='input-group-addon'>Ore</span>
							  <input type='text'  placeholder={$i}>
							</div>
						</td>
						
					</tr>"; ?>
					<tr>
						<td>
							<div class='input-group'>
							  <span class='input-group-addon'>Proiect</span>
							  <input type='text'  placeholder='JavaSys'>
							</div>
						</td>
						<td>
							<div class='input-group'>
							  <span class='input-group-addon'>Client</span>
							  <input type='text'  placeholder='ComplexSoftware'>
							</div>
						</td>
					
						<td>
							<div class='input-group'>
							  <span class='input-group-addon'>Ore</span>
							  <input type='text'  placeholder=2>
							</div>
						</td>
						
					</tr>
					
					<tr class="activitate_extra">
					<td>
							<div class="input-group">
							  <span class="input-group-addon">Proiect</span>
							  <input type="text"  placeholder="Symfony">
							</div>
						</td>
						<td>
							<div class="input-group">
							  <span class="input-group-addon">Client</span>
							  <input type="text"  placeholder="Atria">
							</div>
						</td>
					
						<td>
							<div class="input-group">
							  <span class="input-group-addon">Ore</span>
							  <input type="text"  placeholder="2">
							</div>
						</td>
					<tr>
					
				</table>
			</td>
			<td style="width:200px;height:300px;background-color:#ECEEF0" align="center">
				<table>
					<tr>
						<td >
						Necesita atentie?
						</td>
					</tr>
					<tr>
					<td>
					<div class="row">
  <div class="col-lg-6">
    <div class="input-group">
      <span class="input-group-addon">
        <input type="radio">
      </span>
      <input type="text" class="form-control" placeholder="Y">
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="col-lg-6">
    <div class="input-group">
      <span class="input-group-addon">
        <input type="radio">
      </span>
      <input type="text" class="form-control" placeholder="N">
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->
			</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</div>




</body>

</html>