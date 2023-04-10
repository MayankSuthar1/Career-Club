package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSet.*;
import java.sql.SQLException;




public class DBconnection {
	public static Connection con;
	public static Connection initializeDatabase() 
			throws SQLException,ClassNotFoundException
	{
		String dbDriver ="com.mysql.cj.jdbc.Driver";
		String dbURL = "jdbc:mysql:// localhost:3306/";
		String dbName = "pro";
		String dbUsername ="root";
		String dbPassword = "root";
		 
		Class.forName(dbDriver);
		con = DriverManager.getConnection(dbURL + dbName,dbUsername,dbPassword);
		return con;
		
	}
public static ResultSet getResultFormSqlQuery(String SqlQueryString) {
	ResultSet rs = null ;
	try {
		if (con == null) {
			initializeDatabase();
		}
		rs=con.createStatement().executeQuery(SqlQueryString);
	} catch (Exception ex) {
		ex.printStackTrace();
		}
	return rs;
	}
}