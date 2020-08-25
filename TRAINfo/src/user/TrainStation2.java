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
import bean.TrainFare;
import bean.UserDAO;
public class TrainStation2 extends HttpServlet{
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
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException
	{
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");		
		
			//	HttpSession Validation
			HttpSession hs = req.getSession(false);

			if(hs!=null)
			{
				try
				{
					String uname = (String) hs.getAttribute("uname");
					String pword = (String) hs.getAttribute("pass");
					
					if(userDao.validate(uname, pword))
					{
						int trainNo = Integer.parseInt(req.getParameter("trainno"));
						String trainName = req.getParameter("trainname");
						String fromStation = req.getParameter("from_station");
						String toStation = req.getParameter("to_station");
						String avail = req.getParameter("avail");
						double dist = Double.parseDouble(req.getParameter("dist"));
						
						Train t = new Train();
						
						t.setTrainNo(trainNo);
						t.setTrainName(trainName);
						t.setFromStation(fromStation);
						t.setToStation(toStation);
						t.setAvail(avail);
						t.setDist(dist);
						
						req.getRequestDispatcher("link.jsp").include(req, res);
						
						req.setAttribute("train", t);
						ArrayList<TrainFare> trainfares = (ArrayList<TrainFare>) trainsDao.getTrainFares(dist);
						req.setAttribute("trainfares", trainfares);
						
						req.getRequestDispatcher("TrainStation2.jsp").include(req, res);				
					}
					
				}
				catch(Exception e) {	e.printStackTrace(); 	};
			}
			else
			{
				req.setAttribute("msg", "Please login First");
				req.getRequestDispatcher("login.jsp").forward(req, res);
			}
		pw.close();
	}
}
