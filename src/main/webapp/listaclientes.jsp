<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- Tama�o de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pesta�a -->
<title>Lista de clientes</title>
<!-- bootstrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- font awesome -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<!-- Cargando mi hoja de estilo -->
<link href="style.css" rel="stylesheet" type="text/css" />


<script>
	var baseurl = "http://localhost:8080/listarclientes";
	function loadclientes() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseurl, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var clientes = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-hover'><tr><th>Cedula Cliente</th><th>Direccion Cliente</th><th>Email Cliente</th><th>Nombre Cliente</th><th>Telefono Cliente</th></tr>";
				var main = "";
				for (i = 0; i < clientes.length; i++) {
					main += "<tr><td>" + clientes[i].cedula_cliente
							+ "</td><td>" + clientes[i].direccion_cliente
							+ "</td><td>" + clientes[i].email_cliente
							+ "</td><td>" + clientes[i].nombre_cliente
							+ "</td><td>" + clientes[i].telefono_cliente
							+ "</td></tr>";
				}
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("clientesinfo").innerHTML = tbl;
			}
		};
		xmlhttp.send();
	}
	window.onload = function() {
		loadclientes();
	}
</script>

</head>


<body>
	<!-- Navbar-->
	<nav class="navbar navbar-light" style="background-color: #F4FDB1">
		<div class="container-fluid">
			<ul class="nav nav-tabs">
			<li class="nav-item">
			<a class="navbar-brand links" href="index.html"><i class="fas fa-shopping-basket"></i>Tienda Generica</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="listausuarios.jsp"> <i
				class="fas fa-users"></i> Usuarios
			</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="listaclientes.jsp"> <i
				class="fas fa-address-book"></i> Clientes
			</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="listaproveedores.jsp"> <i
				class="fas fa-truck"></i> Proveedores
			</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="listaproductos.jsp"> <i
				class="fas fa-apple-alt"></i> Productos
			</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="insertarventa.jsp"> <i
				class="fas fa-money-check-alt"></i> Ventas
			</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="listareportes.jsp"> <i
				class="fas fa-clipboard-list"></i> Reportes
			</a>
			</li>
			</ul>
		</div>
	</nav>
	<!-- Navbar modulos-->
	
		
	


	<!-- contenido  -->

	<div id="ponerimagen" style="display: flex;">

		
		<div class="container-fluid">
				<h3>
				Lista de clientes
				</h3>
				<!--  Aqui es donde se autogenera la tabla basado en el script -->
				<div class="col align-self-center" id="clientesinfo"></div>
				

		</div>

		
		<div class="container-fluid">

				<button id="btn1" type="button" class="btn btn-success"
					onclick="window.location.href='/insertarcliente.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar cliente
				</button>
				<button id="btn2" type="button" class="btn btn-danger"
					onclick="window.location.href='/eliminarcliente.jsp'">
					<i class="fas fa-trash"></i> Eliminar cliente
				</button>
				<button id="btn3" type="button" class="btn btn-warning"
					onclick="window.location.href='/actualizarcliente.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar cliente
				</button>
				<button id="btn4" type="button" class="btn btn-primary"
					onclick="window.location.href='/buscarcliente.jsp'">
					<i class="fas fa-search"></i> Buscar un cliente
				</button>
				<button id="btn5" type="button" class="btn btn-primary"
					onclick="window.location.href='/listaclientes.jsp'">
					<i class="fas fa-search"></i> Listar todos los clientes
				</button>

		</div>
		
	</div>


	<nav class="navbar navbar-light" style="background-color: #F4FDB1">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#">
					Dise�ado por Grupo 10 </a>
			</div>
		</div>
	</nav>


</body>
</html>