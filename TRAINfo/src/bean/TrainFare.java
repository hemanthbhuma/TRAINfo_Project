package bean;

public class TrainFare {
	//	Java Bean Class For Products Information
	private String tclass;
	private double startdist, enddist, totdist, fare;
	private int class_no;
	
	//	Zero-Argumented Constructor
	public TrainFare() {}

	public String getTclass() {
		return tclass;
	}

	public void setTclass(String tclass) {
		this.tclass = tclass;
	}

	public double getStartdist() {
		return startdist;
	}

	public void setStartdist(double startdist) {
		this.startdist = startdist;
	}

	public double getEnddist() {
		return enddist;
	}

	public void setEnddist(double enddist) {
		this.enddist = enddist;
	}

	public double getTotdist() {
		return totdist;
	}

	public void setTotdist(double totdist) {
		this.totdist = totdist;
	}

	public double getFare() {
		return fare;
	}

	public void setFare(double fare) {
		this.fare = fare;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
}
