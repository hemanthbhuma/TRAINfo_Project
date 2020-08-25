package bean;
import java.io.Serializable;
public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//	Java Bean Class For User Information
	private String uName, fName,lName, addr, mid;
	private long phno;
	
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
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
	public String getaddr() {
		return addr;
	}
	public void setaddr(String addr) {
		this.addr = addr;
	}
	public String getmid() {
		return mid;
	}
	public void setmid(String mid) {
		this.mid = mid;
	}
	public long getphno() {
		return phno;
	}
	public void setphno(long l) {
		this.phno = l;
	} 

}  
