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
<title>Listado de personas</title>
</head>
<body>
	<h1>Personas</h1>

	<table border="1">
	  <thead>
	  	<tr>
	  		<th>ID</th>
	  		<th>DNI</th>
	  		<th>Nombres</th>
	  		<th>Acciones</th>
	  		
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
	  <tbody>
	  		<tr>
	  			<td><%= per.getId() %></td>
	  			<td><%= per.getDni() %></td>
	  			<td><%= per.getNom() %></td>
	  			<td>
	  				<a>Editar</a>
	  				<a>Borrar</a>
	  			</td>
	  			
	  		</tr>
	  		<%
	  			}
	  		%>
	  </tbody>
	</table>

</body>
</html>