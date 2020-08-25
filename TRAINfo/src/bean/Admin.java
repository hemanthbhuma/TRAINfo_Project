package bean;
import java.io.*;
public class Admin implements Serializable{

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//	Java Bean Class For Admin Information
	private String aName, fName,lName;
	
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
}
