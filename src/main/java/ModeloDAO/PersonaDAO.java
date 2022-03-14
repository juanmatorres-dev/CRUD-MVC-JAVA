/**
 * 
 */
package ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import Config.Conexion;
import Interfaces.CRUD;
import Modelo.Persona;

/**
 * @author Juan Manuel Torres Martínez
 *
 */
public class PersonaDAO implements CRUD {

	Conexion cn = new Conexion();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	Persona p = new Persona();
	
	
	@Override
	/**
	 * Lista todas las personas
	 */
	public List listar() {
		ArrayList<Persona> list = new ArrayList<>();
		String sql = "SELECT * FROM persona;";
		
		try {
			con = cn.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Persona per = new Persona();
				per.setId(rs.getInt("id"));
				per.setDni(rs.getString("DNI"));
				per.setNom(rs.getString("Nombres"));
				list.add(per);
			}
			
		} catch (Exception e) {
			System.out.println("[Error] : " + e);
		}
		
		return list;
	}

	@Override
	 /**
	  * Lista una sola persona dado un id
	  */
	public Persona list(int id) {
		
		String sql = "SELECT * FROM persona where id=" + id + ";";
		
		try {
			con = cn.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				p.setId(rs.getInt("id"));
				p.setDni(rs.getString("DNI"));
				p.setNom(rs.getString("Nombres"));
			}
			
		} catch (Exception e) {
			System.out.println("[Error] : " + e);
		}
		
		
		return p;
	}

	@Override
	/**
	 * Añade una persona
	 */
	public boolean add(Persona per) {
		
		String sql = "INSERT INTO persona (DNI, Nombres) VALUES ('" + per.getDni() + "','" + per.getNom() + "');";
		
		try {
			con = cn.getConnection();
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[Error] : " + e);
		}
		
		return false;
	}

	@Override
	/**
	 * Edita una persona
	 */
	public boolean edit(Persona per) {
		
		String sql = "UPDATE persona SET DNI= '" + per.getDni() + "',Nombres= '" + per.getNom() + "' WHERE id= '" + per.getId()  + "';";
		
		try {
			con = cn.getConnection();
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[Error] : " + e);
		}
		
		return false;
	}

	@Override
	/**
	 * Elimina una persona dado un id
	 */
	public boolean eliminar(int id) {
		
		String sql = "DELETE FROM persona WHERE id=" + id + ";";
		
		try {
			con = cn.getConnection();
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("[Error] : " + e);
		}
		
		return false;
	}

}
