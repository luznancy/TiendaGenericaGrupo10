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
<title>Lista de proveedores</title>
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
	var baseurl = "http://localhost:8080/listarproveedores";
	function loadproveedores() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseurl, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var proveedores = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-hover'><tr><th>Nit Proveedor</th><th>Ciudad Proveedor</th><th>Direccion Proveedor</th><th>Nombre Proveedor</th><th>Telefono Proveedor</th></tr>";
				var main = "";
				for (i = 0; i < proveedores.length; i++) {
					main += "<tr><td>" + proveedores[i].nit_proveedor
							+ "</td><td>" + proveedores[i].ciudad_proveedor
							+ "</td><td>" + proveedores[i].direccion_proveedor
							+ "</td><td>" + proveedores[i].nombre_proveedor
							+ "</td><td>" + proveedores[i].telefono_proveedor
							+ "</td></tr>";
				}
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("proveedoresinfo").innerHTML = tbl;
			}
		};
		xmlhttp.send();
	}
	window.onload = function() {
		loadproveedores();
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
	<!-- contenido  -->

	<div id="ponerimagen" style="display: flex;">

		
		<div class="container-fluid">
		<h3>
		Tabla de proveedores
		</h3>
				<!--  Aqui es donde se autogenera la tabla basado en el script -->
				<div class="col align-self-center" id="proveedoresinfo"></div>
		</div>
		<div class="container-fluid">
		
				<button id="btn6" type="button" class="btn btn-success"
					onclick="window.location.href='/insertarproveedor.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar proveedor
				</button>
				<button id="btn7" type="button" class="btn btn-danger"
					onclick="window.location.href='/eliminarproveedor.jsp'">
					<i class="fas fa-trash"></i> Eliminar proveedor
				</button>
				<button id="btn8" type="button" class="btn btn-warning"
					onclick="window.location.href='/actualizarproveedor.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar proveedor
				</button>
				<button id="btn9" type="button" class="btn btn-primary"
					onclick="window.location.href='/buscarproveedor.jsp'">
					<i class="fas fa-search"></i> Buscar un proveedor
				</button>
				<button id="btn10" type="button" class="btn btn-primary"
					onclick="window.location.href='/listaproveedores.jsp'">
					<i class="fas fa-search"></i> Listar todos los proveedores
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