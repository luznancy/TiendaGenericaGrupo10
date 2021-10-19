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
<title>Actualizar cliente</title>
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
		

	<!-- Navbar modulos-->
	
	</nav>

	<div id="ponerimagen" style="display: flex;">
		
		<div class="container-fluid">
			<h3>
			Datos a actualizar del cliente
			</h3>

			<div id="error" class="alert alert-danger visually-hidden"
				role="alert">Error al actualizar el cliente, verifique que la
				cedula dada sea valida</div>

			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Cliente actualizado con exito</div>

			<form id="form1">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Cedula
						Cliente</span> <input type="text" class="form-control"
						placeholder="Inserte cedula aqui..."
						aria-describedby="basic-addon1" required id="cedula_cliente">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon2">Direccion
						Cliente</span> <input type="text" class="form-control"
						placeholder="Inserte nueva direccion aqui..."
						aria-describedby="basic-addon2" required id="direccion_cliente">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon3">Email
						Cliente</span> <input type="text" class="form-control"
						placeholder="Inserte nuevo email aqui..."
						aria-describedby="basic-addon3" required id="email_cliente">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon4">Nombre
						Cliente</span> <input type="text" class="form-control"
						placeholder="Inserte nuevo nombre aqui..."
						aria-describedby="basic-addon4" required id="nombre_cliente">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon5">Telefono
						Cliente</span> <input type="text" class="form-control"
						placeholder="Inserte nuevo telefono aqui..."
						aria-describedby="basic-addon5" required id="telefono_cliente">
				</div>
			</form>

			<button id="btn1" type="button" class="btn btn-warning"
				onclick="actualizar_cliente()">
				<i class="fas fa-edit"></i> Actualizar Cliente
			</button>

			</div>
		<div id="botonesUsuarios" class="container-fluid">
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
				<button id="btn4" class="btn btn-primary"
					onclick="window.location.href='/buscarcliente.jsp'">
					<i class="fas fa-search"></i> Buscar un cliente
				</button>
				<button id="btn5" type="button" class="btn btn-primary"
					onclick="window.location.href='/listaclientes.jsp'">
					<i class="fas fa-search"></i> Listar todos los clientes
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
		var caja = document.getElementById("cedula_cliente");
		caja.addEventListener("keyup", function(event) {
			if (event.keyCode == 13) {
				traer_datos_cliente();
			}
		});

		function traer_datos_cliente() {
			window.alert("Trayendo datos");
			var req = new XMLHttpRequest();
			var coincidencia = false;
			var dato = document.getElementById("cedula_cliente").value;
			req.open('GET',
					'http://localhost:8080/consultarclientes?cedula_cliente='
							+ dato, false);
			req.send(null);
			var cliente = null;
			if (req.status == 200)
				cliente = JSON.parse(req.responseText);

			if (cliente.toString() != "") {
				window.alert("Encontre el cliente con cedula" + dato);
				document.getElementById("direccion_cliente").value = cliente[0].direccion_cliente;
				document.getElementById("email_cliente").value = cliente[0].email_cliente;
				document.getElementById("nombre_cliente").value = cliente[0].nombre_cliente;
				document.getElementById("telefono_cliente").value = cliente[0].telefono_cliente;
			} else {
				window.alert("No se encontro el cliente con cedula " + dato);
				document.getElementById("cedula_cliente").value = "";
				document.getElementById("direccion_cliente").value = "";
				document.getElementById("email_cliente").value = "";
				document.getElementById("nombre_cliente").value = "";
				document.getElementById("telefono_cliente").value = "";
			}
		}//fin funcion

		function actualizar_cliente() {
			//window.alert("Entre nuevo");
			var y = document.getElementById("cedula_cliente").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarclientes', false);
			req.send(null);
			var clientes = null;
			if (req.status == 200)
				clientes = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < clientes.length; i++) {
				console.log(clientes[i].cedula_cliente);
				if (clientes[i].cedula_cliente == y) {
					//window.alert("Encontre cedula cliente " + y);
					console.log(clientes[i].cedula_cliente + " " + y);
					coincidencia = true;
					break;

				}
			}//fin for busqueda usuario y cedula

			//window.alert("Coincidencia " + coincidencia);
			console.log(coincidencia);

			if (coincidencia != false) {
				window
						.alert("Voy a enviar la informaci�n del cliente con cedula  "
								+ y);
				var formData = new FormData();
				formData.append("cedula_cliente", document
						.getElementById("cedula_cliente").value);
				formData.append("direccion_cliente", document
						.getElementById("direccion_cliente").value);
				formData.append("email_cliente", document
						.getElementById("email_cliente").value);
				formData.append("nombre_cliente", document
						.getElementById("nombre_cliente").value);
				formData.append("telefono_cliente", document
						.getElementById("telefono_cliente").value);
				var xhr = new XMLHttpRequest();
				xhr.open("PUT", "http://localhost:8080/actualizarclientes");

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_cliente").value = "";
				document.getElementById("direccion_cliente").value = "";
				document.getElementById("email_cliente").value = "";
				document.getElementById("nombre_cliente").value = "";
				document.getElementById("telefono_cliente").value = "";
				xhr.send(formData);

			} else {
				window.alert("No encontre el cliente con cedula  " + y);
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("cedula_cliente").value = "";
				document.getElementById("direccion_cliente").value = "";
				document.getElementById("email_cliente").value = "";
				document.getElementById("nombre_cliente").value = "";
				document.getElementById("telefono_cliente").value = "";

			}
		}
	</script>

</body>
</html>