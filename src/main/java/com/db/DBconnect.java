
package com.db;


import java.sql.*;

public class DBconnect {
	private static Connection conn;
public static Connection getconn() {
	
	
      try {
    	  if(conn==null) {
    	 
		Class.forName("com.mysql.jdbc.Driver");
		   conn = DriverManager.getConnection("jdbc:mysql://localhost/job_portal", "root", "Aa1@Aa1@");
		   System.out.println(conn);
    	  }
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
     
	return conn;
}
}