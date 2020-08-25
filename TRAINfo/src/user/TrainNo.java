package user;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Train;
import bean.TrainDAO;
import bean.UserDAO;
public class TrainNo extends HttpServlet{
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
		// PrintWriter pw = res.getWriter();
		res.setContentType("text/html");		
		
			//	HttpSession Validation
			HttpSession hs = req.getSession(false);
			
			if(hs!=null)
			{
				String uname = (String) hs.getAttribute("uname");
				String pword = (String) hs.getAttribute("pass");
				try
				{
					if(userDao.validate(uname, pword))
					{
						
						if(req.getParameter("trainNo")!=null)
						{
							int trainNo = Integer.parseInt(req.getParameter("trainNo"));
							Train t = trainsDao.getTrain(trainNo);
							
							if(t!=null)
							req.setAttribute("train", t);
							else
							req.setAttribute("invalid", "Invalid Train No");	
						}
						
						req.getRequestDispatcher("link.jsp").include(req, res);
						req.getRequestDispatcher("TrainNo.jsp").include(req, res);
						
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
