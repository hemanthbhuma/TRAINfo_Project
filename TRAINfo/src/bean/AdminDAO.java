package bean;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
public class AdminDAO {
	
	//	Admin Validation Method
	public boolean adminvalidate(String aname, String pword)
	{
		try
		{
			Connection con = DBConnection.getCon();

			//	Creating a common Prepared Statement for Admin Validation
			PreparedStatement ps = con.prepareStatement("select * from trainadminlogin where aname=? and pword=?");
			ps.setString(1, aname);
			ps.setString(2, pword);
			
			ResultSet rs = ps.executeQuery();
			return rs.next();	//	Returns True if Valid Admin	
		}	//	end of try
		catch (Exception e)
		{
			e.printStackTrace();
		}
		// Default case
		return false;
	}
	
	//	method to return the Admin object
	public Admin getAdmin(String aName)
	{
		try
		{			
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select * from trainadminlogin where aname=?");
			ps.setString(1, aName);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				Admin a = new Admin();
				
				a.setaName(rs.getString(1));
				a.setfName(rs.getString(3));
				a.setlName(rs.getString(4));
				
				return a;		//	Add each product object reference to the collection object
			}
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return null;
	}
	
	
	//	method to return the Collection of the Users
	public Collection<User> getUsers()
	{
		try
		{
			//	Create ArrayList Collection Object
			ArrayList<User> users = new ArrayList<>();
			
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select * from trainreg");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				User u = new User();
				
				u.setuName(rs.getString(1));
				u.setfName(rs.getString(3));
				u.setlName(rs.getString(4));
				u.setaddr(rs.getString(5));
				u.setphno(rs.getLong(6));
				u.setmid(rs.getString(7));
				
				users.add(u);		//	Add each User object reference to the collection object
			}
			
			return users;
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return null;
	}

}
