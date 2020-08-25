package user;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Train;
import bean.TrainDAO;
import bean.UserDAO;
public class TrainStation extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	UserDAO userDao = null;
	TrainDAO trainsDao = null;
	public void init()
	{
		userDao = new UserDAO();
		trainsDao = new TrainDAO();
	}
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException
	{
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");		
		
			//	HttpSession Validation
			HttpSession hs = req.getSession(false);
			
			
			if(hs!=null)
			{
				String uName = (String) hs.getAttribute("uname");
				String pWord = (String) hs.getAttribute("pass");
				try
				{
					if(userDao.validate(uName, pWord))
					{
						
						
						//	Getting Trains
						if(req.getParameter("fromstation")!=null  && req.getParameter("tostation")!=null)
						{
							String fromStation = req.getParameter("fromstation");
							String toStation = req.getParameter("tostation");
							
							ArrayList<Train> trains = (ArrayList<Train>) trainsDao.getTrains(fromStation,toStation);
							
							if(trains!=null)
								req.setAttribute("trains", trains);
							else
								req.setAttribute("notrains", "Sorry..!! No Trains Available");	
						}

						req.getRequestDispatcher("link.jsp").include(req, res);
						req.getRequestDispatcher("TrainStation.jsp").include(req, res);
					}
				}
				catch(Exception e) {	 e.printStackTrace(); 	};
			}
			else
			{
				req.setAttribute("error", "Please login First");
				req.getRequestDispatcher("login.jsp").forward(req, res);
			}
		pw.close();
	}
}
