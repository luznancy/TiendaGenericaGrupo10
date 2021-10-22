<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- Tamaño de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pestaña -->
<title>Insertando y Listando Productos</title>
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
	
function subirArchivo() {

	try {
		var csvFile = document.getElementById("archivo");
		var input = csvFile.files[0];
		var reader = new FileReader();

		reader.onload = function(e) {

			var text = e.target.result;
			var arrayLineas = text.split("\n");
			var xhr = new XMLHttpRequest();
			xhr.open("DELETE","http://localhost:8080/eliminartodoproducto",true);
			xhr.send();

			for (var i = 0; i < arrayLineas.length; i += 1) {
				var arraydatos = arrayLineas[i].split(",");

				if (arrayLineas[i] == "") {
					continue;
				}

				for (var j = 0; j < arraydatos.length; j += 1) {
					console.log(i + " " + j + "->" + arraydatos[j]);
				}

				var formData = new FormData();
				formData.append("codigo_producto", arraydatos[0]);
				formData.append("nombre_producto", arraydatos[1]);
				formData.append("nit_proveedor", arraydatos[2]);
				formData.append("precio_compra", arraydatos[3]);
				formData.append("iva_compra", arraydatos[4]);
				formData.append("precio_venta", arraydatos[5]);
				var xhr = new XMLHttpRequest();
				xhr.open("POST","http://localhost:8080/registrarproducto");
				xhr.send(formData);
			}

			var element = document.getElementById("error");
			element.classList.add("visually-hidden");
			var element2 = document.getElementById("correcto");
			element2.classList.remove("visually-hidden");

			document.getElementById("archivo").value = "";
			
			window.alert("Archivo cargado con exito, se cargaron " +arrayLineas.length+ " productos");
			
			load_productos();
			

		};

		reader.readAsText(input);
	} catch (error) {
		var element = document.getElementById("error");
		element.classList.remove("visually-hidden");
		var element2 = document.getElementById("correcto");
		element2.classList.add("visually-hidden");

		document.getElementById("archivo").value = "";
	}
}
	
	
	function load_productos() {
		var baseurl = "http://localhost:8080/listarproductos";
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseurl, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var productos = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-dark table-striped'><tr><th>Codigo Producto</th><th>Iva Compra</th><th>Nit Proveedor</th><th>Nombre Producto</th><th>Precio Compra</th><th>Precio Venta</th></tr>";
				var main = "";
				for (i = 0; i < productos.length; i++) {
					main += "<tr><td>" + productos[i].codigo_producto
							+ "</td><td>" + productos[i].iva_compra + "%"
							+ "</td><td>" + productos[i].nit_proveedor
							+ "</td><td>" + productos[i].nombre_producto 
							+ "</td><td>" + productos[i].precio_compra  
							+ "</td><td>" + productos[i].precio_venta +
							"</td></tr>";			}//fin for
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("productosinfo").innerHTML = tbl;
			}//fin if 
		}; //fin xml onreadystatechange
		xmlhttp.send();
	}//fin funcion
	
	
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
			Tabla de Productos
			</h3>
			<div id="error" class="alert alert-danger visually-hidden"
				role="alert">Archivo vacio, extensi�n no valida o datos
				corruptos (El separador debe ser coma ",")</div>

			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Productos importados desde CSV con exito</div>

			<form id="form1">
				<div>
					<label for="formFileLg" class="form-label">Seleccionar
						archivo CSV con el inventario de productos</label> <input
						class="form-control form-control-lg" id="archivo" type="file"
						accept=".csv">
					<button type="button" class="btn btn-success"
						onclick="subirArchivo()">Subir archivo</button>
				</div>
			</form>

				<!--  Aqui es donde se autogenera la tabla basado en el script -->
				<div class="col align-self-center" id="productosinfo"></div>
		</div>

		<div id="botonesUsuarios" class="container-fluid">
			<div class="row">
				<button id="btn11" type="button" class="btn btn-success" onclick="#'">
					<i class="fas fa-plus-circle"></i> Agregar Producto
				</button>
				<button id="btn12" type="button" class="btn btn-danger" onclick="#'">
					<i class="fas fa-trash"></i> Eliminar Producto
				</button>
				<button id="btn13" type="button" class="btn btn-warning" onclick="#'">
					<i class="fas fa-pen-alt"></i> Actualizar Producto
				</button>
				<button id="btn14" type="button" class="btn btn-primary" onclick="#'">
					<i class="fas fa-search"></i> Buscar un producto
				</button>
				<button id="btn15" type="button" class="btn btn-primary"
					onclick="window.location.href='/listaproductos.jsp'">
					<i class="fas fa-search"></i> Listar todos los Productos
				</button>
			</div>
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