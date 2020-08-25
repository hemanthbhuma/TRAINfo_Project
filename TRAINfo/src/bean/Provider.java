package bean;
public interface Provider {
	// All variables are by default PUBLIC, STATIC and FINAL
	
	/*
	 * Use below details for connecting to oracle db, else comment out
	 */
//	String DRIVER = "oracle.jdbc.driver.OracleDriver";
//	String CONNECTION_URL = "jdbc:oracle:thin:@localhost:1521:server";
//	String USERNAME = "scott";
//	String PASSWORD = "tiger";
	
	/*
	 * Use below details for connecting to sqlite db, else comment out
	 */
	String DRIVER = "org.sqlite.JDBC";
//	String CONNECTION_URL = "jdbc:sqlite:./TRAINFO.db";
	String CONNECTION_URL = "jdbc:sqlite:F:\\STS Work space\\TRAINfo\\TRAINFO.db";
	String USERNAME = "";
	String PASSWORD = "";
}
