/**
 * 
 */
package ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	
	@Override
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
	public Persona list(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean add(Persona per) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean edit(Persona per) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean eliminar(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
