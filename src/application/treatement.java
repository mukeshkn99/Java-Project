package application;

import java.sql.Connection;
import java.sql.DriverManager;

public class treatement {

	static Connection con;
	public static Connection getconnection()
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/treatement","root","admin");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	}

