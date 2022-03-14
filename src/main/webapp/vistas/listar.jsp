<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.util.List"%>
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


<title>Listado de personas</title>
</head>
<body>
<div class="container">
	<h1>Personas</h1>
	
	<div class="col-md-1">
		<a class="btn btn-success" href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
	</div>
	
	<div class="col-md-2 col-xs-6">
		<a class="btn btn-success" href="Controlador?action=add"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
	</div>
	<br> <br> <br>
	<table class="table table-bordered table-hover">
	  <thead>
	  	<tr>
	  		<th class="text-center">ID</th>
	  		<th class="text-center">DNI</th>
	  		<th class="text-center">Nombres</th>
	  		<th class="text-center">Acciones</th>
	  		
	  	</tr>
	  </thead>
	  <%
	  	PersonaDAO dao = new PersonaDAO();
	  	List<Persona> list = dao.listar();
	  	Iterator<Persona> iter = list.iterator();
	  	Persona per = null;
	  	while(iter.hasNext()){
	  		per = iter.next();
	  		
	  %>
	  <tbody class="text-center">
	  		<tr>
	  			<td><%= per.getId() %></td>
	  			<td><%= per.getDni() %></td>
	  			<td><%= per.getNom() %></td>
	  			<td>
	  				<a class="btn btn-warning" href="Controlador?action=edit&id=<%= per.getId() %>"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
	  				<a class="btn btn-danger" href="Controlador?action=delete&id=<%= per.getId() %>"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
	  			</td>
	  			
	  		</tr>
	  		<%
	  			}
	  		%>
	  </tbody>
	</table>
</div>
</body>
</html>