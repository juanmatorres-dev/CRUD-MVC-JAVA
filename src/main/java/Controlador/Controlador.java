package Controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelo.Persona;
import ModeloDAO.PersonaDAO;

/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String listar = "vistas/listar.jsp";
	String add = "vistas/add.jsp";
	String edit = "vistas/edit.jsp";
	Persona per = new Persona();
	PersonaDAO dao = new PersonaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controlador() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String acceso = "";
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("listar")) {
			acceso = listar;
		}else if(action.equalsIgnoreCase("add")) {
			acceso = add;
		}else if(action.equalsIgnoreCase("Agregar")) {
			
			String dni = request.getParameter("txtDNI");
			String nom = request.getParameter("txtNom");
			
			per.setDni(dni);
			per.setNom(nom);
			dao.add(per);
			acceso = listar;
		}
		
		
		RequestDispatcher vista = request.getRequestDispatcher(acceso);
		vista.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
