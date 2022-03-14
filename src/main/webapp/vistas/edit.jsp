<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<h1>Editar persona</h1>
	<form action="Controlador">
		DNI: <br>
		<input type="text" name="txtDNI" value="<%= p.getDni() %>"> <br>
		Nombres:  <br>
		<input type="text" name="txtNom" value="<%= p.getNom() %>"> <br>
		<input type="hidden" name="txtid" value="<%= p.getId() %>">
		<input type="submit" name="action" value="Actualizar"> <br>
		<a href="Controlador?action=listar">⬅ Volver</a>
	</form>
</body>
</html>