<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Añadir personas</title>
</head>
<body>
	<h1>Agregar personas</h1>
	<form action="Controlador">
		DNI: <br>
		<input type="text" name="txtDNI"> <br>
		Nombres:  <br>
		<input type="text" name="txtNom"> <br>
		<input type="submit" name="action" value="Agregar"> <br>
		<a href="Controlador?action=listar">⬅ Volver</a>
	</form>
</body>
</html>