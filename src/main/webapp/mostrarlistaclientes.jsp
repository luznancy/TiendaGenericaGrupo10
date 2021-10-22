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
<title>Modulo reportes</title>
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
		
	<!-- contenido  -->
	
	<div id="ponerimagen" style="display: flex;">
	
			<div class="container-fluid">
			
					
					<button id="btn1" type="button" class="btn btn-primary" onclick="reporte_lista_clientes()">
						<i class="fas fa-clipboard-list"></i> Mostrar lista
					</button>
				
					<div class="row">
						<!--  Aqui es donde se autogenera la tabla basado en el script -->
						<div class="col align-self-center" id="clientes_info">					
						</div>
					</div>		
	
			</div>
	</div>

	<nav class="navbar navbar-light" style="background-color: #F4FDB1">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#">
					Dise�ado por Grupo 10</a>
			</div>
		</div>
	</nav>


<script>

	
	function reporte_lista_clientes() {
		var baseurlc = "http://localhost:8080/listarclientes";
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseurlc, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var clientes = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-hover'><tr><th>Cedula Cliente</th><th>Direccion Cliente</th><th>Email Cliente</th><th>Nombre Cliente</th><th>Telefono Cliente</th></tr>";
				var main = "";
				for (i = 0; i < clientes.length; i++) {
					main += "<tr><td>" + clientes[i].cedula_cliente
							+ "</td><td>" + clientes[i].direccion_cliente
							+ "</td><td>" + clientes[i].email_cliente
							+ "</td><td>" + clientes[i].nombre_cliente + "</td><td>"
							+ clientes[i].telefono_cliente + "</td></tr>";
				}
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("clientes_info").innerHTML = tbl;
			}//fin if
		};//fin xml onreadystatechange
		xmlhttp.send();
	}//fin funcion cargar clientes
	
	
	
</script>
</body>
</html>