package bean;
import java.io.Serializable;
public class Train implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//	Java Bean Class For Products Information
	private String trainName, fromStation, toStation, avail;
	private int trainNo;
	private double dist; 
	
	//	Zero-Argumented Constructor
	public Train() {}

	public String getTrainName() {
		return trainName;
	} 

	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}

	public String getFromStation() {
		return fromStation;
	}

	public void setFromStation(String fromStation) {
		this.fromStation = fromStation;
	}

	public String getToStation() {
		return toStation;
	}

	public void setToStation(String toStation) {
		this.toStation = toStation;
	}

	public String getAvail() {
		return avail;
	}

	public void setAvail(String avail) {
		this.avail = avail;
	}

	public int getTrainNo() {
		return trainNo;
	}

	public void setTrainNo(int trainNo) {
		this.trainNo = trainNo;
	}

	public double getDist() {
		return dist;
	} 

	public void setDist(double dist) {
		this.dist = dist;
	}
	
}
