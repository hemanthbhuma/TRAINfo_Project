package bean;
import java.sql.*;
import java.util.*;		// 	For Collection Object Reference
public class TrainDAO {
	//	method to return the Collection of the Trains
	public Collection<Train> getTrains()
	{
		try
		{
			//	Create ArrayList Collection Object
			ArrayList<Train> trains = new ArrayList<>();
			
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select * from traindata");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Train t = new Train();
				
				t.setTrainNo(rs.getInt(1));
				t.setTrainName(rs.getString(2));
				t.setFromStation(rs.getString(3));
				t.setToStation(rs.getString(4));
				t.setAvail(rs.getString(5));
				t.setDist(rs.getDouble(6));
				
				trains.add(t);		//	Add each Train object reference to the collection object
			}
			
			return trains;
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return null;
	}
	
	//	method to return the Collection of the Train Fares
	public Collection<TrainFare> getTrainFares()
	{
		try
		{
			//	Create ArrayList Collection Object
			ArrayList<TrainFare> trainfares = new ArrayList<>();
			
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select * from trainfare ORDER BY CLASS_NO, PER_KM_FARE");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TrainFare tf = new TrainFare();
				
				tf.setTclass(rs.getString(1));
				tf.setStartdist(rs.getDouble(2));
				tf.setEnddist(rs.getDouble(3));
				tf.setTotdist(rs.getDouble(4));
				tf.setFare(rs.getDouble(5));
				tf.setClass_no(rs.getInt(6));
				
				trainfares.add(tf);		//	Add each Train object reference to the collection object
			}
			
			return trainfares;
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return null;
	}
	
	//	method to ADD a Train to the DB
	public boolean addTrain(int trainno, String trainname, String fromstation, String tostation, String avail, double dist)
	{
		try
		{
			Connection con = DBConnection.getCon();
			
			PreparedStatement ps = con.prepareStatement("insert into traindata values(?,?,?,?,?,?)");
			ps.setInt(1, trainno);
			ps.setString(2, trainname);
			ps.setString(3, fromstation);
			ps.setString(4, tostation);
			ps.setString(5, avail);			
			ps.setDouble(6, dist);			
			
			int k = ps.executeUpdate();
			if(k==1)
			{
				return true;
			}
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return false;
	}
	
	
	//	method to UPDATE a Train in the DB
	public boolean updateTrain(int trainno, String trainname, String fromstation, String tostation, String avail, double dist)
	{
		try
		{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("update traindata set trainname=?, from_station=?, to_station=?, availability=?, dist=? where trainno=?");
			ps.setString(1, trainname);
			ps.setString(2, fromstation);
			ps.setString(3, tostation);
			ps.setString(4, avail);
			ps.setDouble(5, dist);
			ps.setInt(6, trainno);
			
			int k = ps.executeUpdate();
			if(k==1)
			{
				return true;
			}
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return false;
	}
	
	//	method to UPDATE a Train in the DB
	public boolean updateTrainFare(String tclass, double startDist, double endDist, double totDist, double fare, int class_no)
	{
		try
		{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("update trainfare set tclass=?, startdist=?, enddist=?, totdist=?, fare=?, class_no=? where tclass=? and startdist=? and enddist=?");
			ps.setString(1, tclass);
			ps.setDouble(2, startDist);
			ps.setDouble(3, endDist);
			ps.setDouble(4, totDist);
			ps.setDouble(5, fare);
			ps.setInt(6, class_no);
			ps.setString(7, tclass);
			ps.setDouble(8, startDist);
			ps.setDouble(9, endDist);
			
			int k = ps.executeUpdate();
			if(k==1)
			{
				return true;
			}
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return false;
	}
	
	//	method to DELETE a Train in the DB
	public boolean deleteTrain(int trainno)
	{
		try
		{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("delete from traindata where trainno=?");
			ps.setInt(1, trainno);
			
			int k = ps.executeUpdate();
			if(k==1)
			{
				return true;
			}
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return false;
	}
	
	//	method to return the Train (based on TrainNo)
	public Train getTrain(int trainno)
	{
		try
		{			
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM TRAINDATA WHERE TRAINNO=?");
			ps.setInt(1, trainno);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				Train t = new Train();
				
				t.setTrainNo(rs.getInt(1));
				t.setTrainName(rs.getString(2));
				t.setFromStation(rs.getString(3));
				t.setToStation(rs.getString(4));
				t.setAvail(rs.getString(5));
				t.setDist(rs.getDouble(6));
				
				return t;
			}
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return null;
	}
	
	//	method to return the Collection of the Trains
	public Collection<Train> getTrains(String fromstation, String tostation)
	{
		try
		{
			//	Create ArrayList Collection Object Reference
			ArrayList<Train> trains = new ArrayList<>();
			
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select * from traindata where from_station=? and to_station=?");
			ps.setString(1, fromstation);
			ps.setString(2, tostation);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Train t = new Train();
				
				t.setTrainNo(rs.getInt(1));
				t.setTrainName(rs.getString(2));
				t.setFromStation(rs.getString(3));
				t.setToStation(rs.getString(4));
				t.setAvail(rs.getString(5));
				t.setDist(rs.getDouble(6));
				
				trains.add(t);		//	Add each Train object reference to the collection object
			}
			
			if(!trains.isEmpty())
				return trains;
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return null;
	}
	
	//	method to return the Collection of the Trains
	public Collection<TrainFare> getTrainFares(double dist)
	{
		try
		{
			//	Create ArrayList Collection Object Reference
			ArrayList<TrainFare> trainfares = new ArrayList<>();
			
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM TRAINFARE WHERE TOTDIST=? ORDER BY CLASS_NO");
			
			if(dist>=0 && dist<=50)
				ps.setDouble(1, 50);
			else if(dist>=51 && dist<=500)
				ps.setDouble(1, 449);
			else
				ps.setDouble(1, 9449);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TrainFare tf = new TrainFare();
				
				tf.setTclass(rs.getString(1));
				tf.setStartdist(rs.getDouble(2));
				tf.setEnddist(rs.getDouble(3));
				tf.setTotdist(rs.getDouble(4));
				tf.setFare(rs.getDouble(5));
				
				trainfares.add(tf);		//	Add each Train object reference to the collection object
			}
			
			if(!trainfares.isEmpty())
				return trainfares;
		}	//	end of try block
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//	Default case
		return null;
	}
}
