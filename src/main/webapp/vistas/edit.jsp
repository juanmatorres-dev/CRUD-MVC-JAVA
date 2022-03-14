<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>


<title>Editar persona</title>
</head>
<body>
	<%
		PersonaDAO dao = new PersonaDAO();
		int id = Integer.parseInt((String)request.getAttribute("idper"));
		Persona p = (Persona)dao.list(id);
		
		System.out.println("[DNI]: " + p.getDni());
		System.out.println("[Nombres]: " + p.getNom());
		System.out.println("[ID]: " + p.getId());
		System.out.println("-------");
	%>
	<div class="container">
	<div class="col-lg-6">
		<h1>Editar persona</h1>
		<a class="btn btn-info" href="Controlador?action=listar"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a>
		<br> <br>
		<form action="Controlador">
			DNI: <br>
			<input class="form-control" type="text" name="txtDNI" value="<%= p.getDni() %>"> <br>
			Nombres:  <br>
			<input class="form-control" type="text" name="txtNom" value="<%= p.getNom() %>"> <br>
			<input type="hidden" name="txtid" value="<%= p.getId() %>">
			<input class="btn btn-primary" type="submit" name="action" value="Actualizar"> <br>
		</form>
	</div>
	</div>
</body>
</html>