package bean;
import static bean.Provider.*;

import java.sql.*;
@SuppressWarnings("unused")
public class DBConnection {
	
	/*
	 * private constructor is used
	 * to prevent this object creation outside this class
	 */
	private DBConnection() {}
	
	private static Connection con;
	
	
	// static block executes at the loading of this class, so initialization of connection object is done
	static
	{
		try
		{
			Class.forName(DRIVER);
			if(USERNAME != "" && PASSWORD != "") {
				con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);
			}
			else {
				con = DriverManager.getConnection(CONNECTION_URL);
			}
				
			if(con!=null) {
				System.out.println("DB Connection established");
			}
			else {
				System.out.println("Failed to connect to DB");
			}
				
		}
	    catch(Exception e)
	    {
		      // if the error message is "out of memory", 
		      // it probably means no database file is found
		      e.printStackTrace();
	    }
	}
	
	public static Connection getCon()
	{
		return con;
	}
}
