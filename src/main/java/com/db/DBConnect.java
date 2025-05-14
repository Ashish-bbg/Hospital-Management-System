package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static Connection conn;

	public static Connection getConn() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/Hospital_Management_System";
			conn = DriverManager.getConnection(url, "root", "root");
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

}
