package bean;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class UserDAO {
	
	//	User Validation Method
	public boolean validate(String uName, String pWord)
	{
		try
		{
			Connection con = DBConnection.getCon();

			//	Creating a common Prepared Statement for validation
			PreparedStatement ps = con.prepareStatement("select * from trainreg where uname=? and pword=?");
			ps.setString(1, uName);
			ps.setString(2, pWord);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())	//	Returns True if Valid User
				return true;
		}	//	end of try
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		// Default case
		return false;
	}
	
	//	User Registration Method
	public boolean register(String uname, String pword,String fname,String lname,String addr,long phno,String mid)
	{
		try
		{
			Connection con = DBConnection.getCon();

			// Creating a common callable Statement for validation (Doesn't work for SQLite. Hence switch back to insert statement)
     		// CallableStatement cs = con.prepareCall("{call TRAINREGISTRATION(?,?,?,?,?,?,?)}");
			PreparedStatement ps = con.prepareStatement("insert into trainreg values (?,?,?,?,?,?,?)");
			ps.setString(1, uname);
			ps.setString(2, pword);
			ps.setString(3, fname);
			ps.setString(4, lname);
			ps.setString(5, addr);
			ps.setLong(6, phno);
			ps.setString(7, mid);

			if(!ps.execute())	//	Returns true if User Registered
				return true;			
		}
		catch(Exception e) {	e.printStackTrace();    }
		return false;
	}
	
	
	
	//	method to return the User
	public User getUser(String uName)
	{
		try
		{			
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select * from trainreg where uname=?");
			ps.setString(1, uName);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				User u = new User();
				
				u.setuName(rs.getString(1));
				u.setfName(rs.getString(3));
				u.setlName(rs.getString(4));
				u.setaddr(rs.getString(5));
				u.setphno(rs.getLong(6));
				u.setmid(rs.getString(7));
				
				return u;		//	Add each product object reference to the colletion onject
			}
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return null;
	}
	
	//	method to check for the Existing User
	public boolean containsUser(String uName)
	{
		try
		{			
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select * from trainreg where uname=?");
			ps.setString(1, uName);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				return true;		//	Add each product object reference to the colletion onject
			}
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//	Default case
		return false;
	}
	
	
	//	method to Edit the User Details
	public boolean editUser(String fName, String lName, String addr, long phNo, String mId, String uName, String pWord)
	{
		try
		{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("update trainreg set fname=?,lname=?,addr=?,phno=?,mid=? where uname=? and pword=?");
			ps.setString(1, fName);
			ps.setString(2, lName);
			ps.setString(3, addr);
			ps.setLong(4, phNo);
			ps.setString(5, mId);
			ps.setString(6, uName);
			ps.setString(7, pWord);
			
			int p = ps.executeUpdate();
			if(p==1)
			{
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//	Default case
		return false;
	}
}
