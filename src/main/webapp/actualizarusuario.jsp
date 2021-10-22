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
<title>Actualizar usuario</title>
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
			Datos a actualizar del usuario
			</h3>

			<div id="error" class="alert alert-danger visually-hidden"
				role="alert">Error al actualizar el usuario, verifique que la
				cedula y usuario dados sean validos</div>

			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Usuario actualizado con exito</div>

			<form id="form1">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Cedula</span> <input
						type="text" class="form-control"
						placeholder="Inserte cedula aqui..."
						aria-describedby="basic-addon1" required id="cedula_usuario">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon2">Email</span> <input
						type="text" class="form-control"
						placeholder="Inserte nuevo email aqui..."
						aria-describedby="basic-addon2" required id="email_usuario">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon3">Nombre
						completo</span> <input type="text" class="form-control"
						placeholder="Inserte nuevo nombre aqui..."
						aria-describedby="basic-addon3" required id="nombre_usuario">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon4">Username</span> <input
						type="text" class="form-control"
						placeholder="Inserte nuevo username aqui..."
						aria-describedby="basic-addon4" required id="user">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon5">Password</span> <input
						type="text" class="form-control"
						placeholder="Inserte nuevo password aqui..."
						aria-describedby="basic-addon5" required id="password">
				</div>
			</form>

			<button id="btn1" type="button" class="btn btn-warning"
				onclick="actualizar_usuario()">
				<i class="fas fa-edit"></i> Actualizar usuario
			</button>
			
		</div>
		<div id="botonesUsuarios" class="container-fluid">
				<button id="btn1" type="button" class="btn btn-success"
					onclick="window.location.href='/insertarusuario.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar usuario
				</button>
				<button id="btn2" type="button" class="btn btn-danger"
					onclick="window.location.href='/eliminarusuario.jsp'">
					<i class="fas fa-trash"></i> Eliminar usuario
				</button>
				<button id="btn3" type="button" class="btn btn-warning"
					onclick="window.location.href='/actualizarusuario.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar usuario
				</button>
				<button id="btn4" class="btn btn-primary"
					onclick="window.location.href='/buscarusuario.jsp'">
					<i class="fas fa-search"></i> Buscar un usuario
				</button>
				<button id="btn5" type="button" class="btn btn-primary"
					onclick="window.location.href='/listausuarios.jsp'">
					<i class="fas fa-search"></i> Listar todos los usuarios
				</button>
			
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
		var caja = document.getElementById("cedula_usuario");

		caja.addEventListener("keyup", function(event) {
			if (event.keyCode == 13) {
				traer_datos_usuario();
			}
		});

		function traer_datos_usuario() {
			window.alert("Trayendo datos");
			var req = new XMLHttpRequest();
			var coincidencia = false;
			var cedula = document.getElementById("cedula_usuario").value;
			req.open('GET',
					'http://localhost:8080/consultarusuariocedula?cedula='
							+ cedula, false);
			req.send(null);
			var usuario = null;
			if (req.status == 200)
				usuario = JSON.parse(req.responseText);

			if (usuario.toString() != "") {
				window.alert("Encontre el usuario con cedula " + cedula);
				document.getElementById("email_usuario").value = usuario[0].email_usuario;
				document.getElementById("nombre_usuario").value = usuario[0].nombre_usuario;
				document.getElementById("user").value = usuario[0].usuario;
				document.getElementById("password").value = usuario[0].password;
			} else {
				window.alert("No se encontro el usuario con cedula " + cedula);
				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
			}
		}

		function actualizar_usuario() {
			//window.alert("Entre");

			var y = document.getElementById("cedula_usuario").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarusuarios', false);
			req.send(null);
			var usuarios = null;
			if (req.status == 200)
				usuarios = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < usuarios.length; i++) {
				console.log(usuarios[i].cedula_usuario);
				if (usuarios[i].cedula_usuario == y) {
					//window.alert("Encontre la cedula "+ y);
					console.log(usuarios[i].cedula_usuario + " " + y);
					coincidencia = true;
					break;
				}
			}//fin for busqueda cedula

			console.log(coincidencia);

			if (coincidencia != false) {
				var formData = new FormData();
				window
						.alert("Voy a enviar la informaci�n del del usuario con cedula "
								+ y);
				formData.append("cedula_usuario", document
						.getElementById("cedula_usuario").value);
				formData.append("email_usuario", document
						.getElementById("email_usuario").value);
				formData.append("nombre_usuario", document
						.getElementById("nombre_usuario").value);
				formData.append("password",
						document.getElementById("password").value);
				formData.append("usuario",
						document.getElementById("user").value);
				var xhr = new XMLHttpRequest();
				xhr.open("PUT", "http://localhost:8080/actualizarusuarios");

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
				xhr.send(formData);

			} else {
				window.alert("No encont� el usuario con cedula " + y);
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
			}
		}
	</script>

</body>
</html>