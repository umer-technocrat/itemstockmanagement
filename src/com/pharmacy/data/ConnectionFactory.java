package com.pharmacy.data;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
	
	public static Connection getCon()
	throws Exception
	{
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/item_stock_management","root","root");//first userid than password (root root)
		
		
		return con;
		
	}
	

}
