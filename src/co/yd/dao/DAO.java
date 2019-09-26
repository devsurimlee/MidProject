package co.yd.dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DAO {
	
	DataSource ds;
	Connection conn;
	
	
	public DAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/myoracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

/*
 * public class DAO {
 * 
 * String driver="oracle.jdbc.driver.OracleDriver"; String
 * url="jdbc:oracle:thin:@localhost:1521:xe"; String user="hr"; String
 * password="hr";
 * 
 * Connection conn;
 * 
 * public DAO() { try { Class.forName(driver);
 * conn=DriverManager.getConnection(url, user, password); } catch
 * (ClassNotFoundException | SQLException e) { e.printStackTrace(); }
 * 
 * } }
 */