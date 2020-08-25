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
import bean.Train;
import bean.TrainDAO;
public class EditTrain extends HttpServlet{
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
						
						if(req.getParameter("tno") != null)
						{
							int tNo = Integer.parseInt(req.getParameter("tno"));
							String tName = req.getParameter("tname");
							String fStation = req.getParameter("fstation");
							String tStation = req.getParameter("tstation");
							String avail = req.getParameter("avail");
							double dist = Double.parseDouble(req.getParameter("dist"));
							
							 if(trainDao.updateTrain(tNo, tName, fStation, tStation, avail, dist))
							 {
								 req.setAttribute("updated", "Train Successfully Updated");
							 }
						}
						
						ArrayList<Train> trains = (ArrayList<Train>) trainDao.getTrains();
						req.setAttribute("trains", trains);
						req.getRequestDispatcher("aEditTrain.jsp").include(req, res);
						
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
