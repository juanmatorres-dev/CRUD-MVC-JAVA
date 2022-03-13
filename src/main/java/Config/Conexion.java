/**
 * 
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author Juan Manuel Torres Martínez
 *
 */
public class Conexion {
	Connection con;
	
	public Conexion() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_jsp_java","root","");
		} catch (Exception e) {
			System.out.println("[Error] : " + e);
		}
	}
	
	public Connection getConnection() {
		return con;
	}
}
