package net.colegio.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlConectar {
	
	public Connection getConectar(){
		Connection cn=null;
		try {
			String url,user,pass;
			//driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			url="jdbc:mysql://localhost:3306/instituto_2023?serverTimezone=UTC";
			user="root";
			pass="root";
			cn=DriverManager.getConnection(url,user,pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cn;
	}
	
	
	
}
