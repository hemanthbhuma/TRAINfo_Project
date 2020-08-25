package admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AdminDAO;
import bean.TrainDAO;
import bean.TrainFare;
public class EditTrainFare extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	AdminDAO adminDao = null;
	TrainDAO trainDao = null;
	public void init()
	{
		trainDao = new TrainDAO();
		adminDao = new AdminDAO();
	}
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		
		//	HttpSession verification
		HttpSession hs = req.getSession(false);
	
			if(hs!=null)
			{
				String aName = (String) hs.getAttribute("aname");
				String pWord = (String) hs.getAttribute("pass");
				try
				{
					if(adminDao.adminvalidate(aName, pWord))
					{
						req.getRequestDispatcher("alink.jsp").include(req, res);
						
						if(req.getParameter("tclass")!=null && req.getParameter("startdist")!=null && req.getParameter("enddist")!=null)
						{
							int class_no = Integer.parseInt(req.getParameter("tclassno"));
							String tClass = req.getParameter("tclass");
							double startDist = Double.parseDouble(req.getParameter("startdist"));
							double endDist = Double.parseDouble(req.getParameter("enddist"));
							double totDist = Double.parseDouble(req.getParameter("totdist"));
							double fare = Double.parseDouble(req.getParameter("per_km_fare"));
							
							 if(trainDao.updateTrainFare(tClass, startDist, endDist, totDist, fare, class_no))
							 {
								 req.setAttribute("updated", "Train Fare Successfully Updated");
							 }
						}
						
						ArrayList<TrainFare> trainfares = (ArrayList<TrainFare>) trainDao.getTrainFares();
						req.setAttribute("trainfares", trainfares);
						req.getRequestDispatcher("aEditTrainFare.jsp").include(req, res);
						
					}	//	end of if
				}	//	end of try
				catch(Exception e) { e.printStackTrace(); }
			}
			else
			{
				req.setAttribute("error", "Please login First");
				req.getRequestDispatcher("login.jsp").forward(req, res);
			}
		pw.close();	
	}
	
	
	
}
