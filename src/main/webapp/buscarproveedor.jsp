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
<title>Buscar Proveedor</title>
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
			<a class="nav-link active" aria-current="page" href="listaventas.jsp"> <i
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
		

	<!-- Navbar modulos-->
	
	</nav>

	<div id="ponerimagen" style="display: flex;">
		
		<div class="container-fluid">
			<h3>
			Buscando un proveedor
			</h3>

			<div id="error" class="alert alert-danger visually-hidden"
				role="alert">Error al buscar el proveedor, el proveedor no
				existe</div>

			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Proveedor encontrado con exito</div>

			<form id="form1">

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon4">Proveedor a
						buscar</span> <input type="text" class="form-control"
						placeholder="Inserte nit proveedor aqui..."
						aria-describedby="basic-addon4" required id="proveedor_search">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Nit
						Proveedor</span> <input type="text" class="form-control"
						aria-describedby="basic-addon1" required id="nit_proveedor"
						disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon2">Ciudad
						Proveedor</span> <input type="text" class="form-control"
						aria-describedby="basic-addon2" required id="ciudad_proveedor"
						disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon3">Direccion
						Proveedor</span> <input type="text" class="form-control"
						aria-describedby="basic-addon3" required id="direccion_proveedor"
						disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon4">Nombre
						Proveedor</span> <input type="text" class="form-control"
						aria-describedby="basic-addon4" required id="nombre_proveedor"
						disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon5">Telefono
						Proveedor</span> <input type="text" class="form-control"
						aria-describedby="basic-addon5" required id="telefono_proveedor"
						disabled="disabled">
				</div>
			</form>

			<button id="btn1" type="button" class="btn btn-primary"
				onclick="enviar_proveedor()">
				<i class="fas fa-search"></i> Buscar Proveedor
			</button>

			

		</div>
			<div id="botonesUsuarios" class="container-fluid">
				<div class="row">
					<button id="btn1" type="button" class="btn btn-success"
						onclick="window.location.href='/insertarproveedor.jsp'">
						<i class="fas fa-plus-circle"></i> Agregar proveedor
					</button>
					<button id="btn2" type="button" class="btn btn-danger"
						onclick="window.location.href='/eliminarproveedor.jsp'">
						<i class="fas fa-trash"></i> Eliminar proveedor
					</button>
					<button id="btn3" type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarproveedor.jsp'">
						<i class="fas fa-pen-alt"></i> Actualizar proveedor
					</button>
					<button id="btn4" type="button" class="btn btn-primary"
						onclick="window.location.href='/buscarproveedor.jsp'">
						<i class="fas fa-search"></i> Buscar un proveedor
					</button>
					<button id="btn5" type="button" class="btn btn-primary"
						onclick="window.location.href='/listaproveedores.jsp'">
						<i class="fas fa-search"></i> Listar todos los proveedores
					</button>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-light" style="background-color: #F4FDB1">
		<div class="row justify-content-bottom">
			<div class="col-4">
				<a class="navbar-brand links" href="#">
					Dise�ado por Grupo 10 </a>
			</div>
		</div>
		</nav>	
		<script>
			function enviar_proveedor() {

				//window.alert("Entre");
				var req = new XMLHttpRequest();
				var coincidencia = false;
				var dato = document.getElementById("proveedor_search").value;
				req.open('GET',
						'http://localhost:8080/consultarproveedores?proveedor='
								+ dato, false);
				req.send(null);
				var proveedor = null;
				if (req.status == 200)
					proveedor = JSON.parse(req.responseText);
				console.log(JSON.parse(req.responseText));

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				console.log(proveedor.toString());

				if (proveedor.toString() != "") {
					window.alert("Encontre Proveedor con Nit  " + dato);

					document.getElementById("nit_proveedor").value = proveedor[0].nit_proveedor;
					document.getElementById("ciudad_proveedor").value = proveedor[0].ciudad_proveedor;
					document.getElementById("direccion_proveedor").value = proveedor[0].direccion_proveedor;
					document.getElementById("nombre_proveedor").value = proveedor[0].nombre_proveedor;
					document.getElementById("telefono_proveedor").value = proveedor[0].telefono_proveedor;

					document.getElementById("proveedor_search").value = "";

				} else {
					window.alert("No Encontre Proveedor con nit  " + user);
					var element = document.getElementById("error");
					element.classList.remove("visually-hidden");
					var element2 = document.getElementById("correcto");
					element2.classList.add("visually-hidden");
					document.getElementById("nit_proveedor").value = "";
					document.getElementById("ciudad_proveedor").value = "";
					document.getElementById("direccion_proveedor").value = "";
					document.getElementById("nombre_proveedor").value = "";
					document.getElementById("telefono_proveedor").value = "";
				}
			}
		</script>
</body>
</html>