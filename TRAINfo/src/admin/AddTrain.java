package admin;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AdminDAO;
import bean.Train;
import bean.TrainDAO;;
public class AddTrain extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	AdminDAO adminDao = null;
	TrainDAO trainDao = null;
	public void init()
	{
		adminDao = new AdminDAO();
		trainDao = new TrainDAO();
	}
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException
	{
		// PrintWriter pw = res.getWriter();
		res.setContentType("text/html");		
		
			//	HttpSession Validation
			HttpSession hs = req.getSession(false);
			
			if(hs!=null)
			{
				String aName = (String) hs.getAttribute("aname");
				String pWord = (String) hs.getAttribute("pass");
				try
				{
					if(adminDao.adminvalidate(aName, pWord))
					{
						
						if(req.getParameter("addTrainNo")!=null)
						{
							
							int trainNo = Integer.parseInt(req.getParameter("addTrainNo"));
							Train t=trainDao.getTrain(trainNo);
							
							if(t == null)
							{
								String trainName = req.getParameter("addTrainName");
								String fromStation = req.getParameter("addFromStation");
								String toStation = req.getParameter("addToStation");
								String avail = req.getParameter("addAvail");								
								double dist = Double.parseDouble(req.getParameter("addDist"));
								
								if(trainDao.addTrain(trainNo, trainName, fromStation, toStation, avail, dist))
									{
										t=trainDao.getTrain(trainNo);
										req.setAttribute("train", t);
									}
							}
							else
							{
								req.setAttribute("exists", "Train Already Exists");
							}
								
						}
						
						req.getRequestDispatcher("alink.jsp").include(req, res);
						req.getRequestDispatcher("aAddTrain.jsp").include(req, res);
						
					}
		
				}
				catch(Exception e) {	 e.printStackTrace(); 	};
			}
			else
			{
				req.setAttribute("msg", "Please login First");
				req.getRequestDispatcher("login.jsp").forward(req, res);
			}
	}
	
	
}
