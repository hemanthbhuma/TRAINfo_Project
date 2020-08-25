package user;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Train;
import bean.TrainDAO;
import bean.UserDAO;
public class PaymentServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	UserDAO userDao;
	TrainDAO trainDao;
	public void init()
	{
		userDao = new UserDAO();
		trainDao = new TrainDAO();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		
		//	HttpSession verification
		HttpSession hs = req.getSession(false);
	
			if(hs!=null)
			{
				try
				{
					String uname = (String) hs.getAttribute("uname");
					String pword = (String) hs.getAttribute("pass");
					
					if(userDao.validate(uname, pword))
					{
						req.getRequestDispatcher("link.jsp").include(req, res);
						
						int trainNo = Integer.parseInt(req.getParameter("tno"));
						double fare = Double.parseDouble(req.getParameter("fare"));
						int seats = Integer.parseInt(req.getParameter("noOfTickets"));
						String tclass = req.getParameter("tclass");
						
						Train t = trainDao.getTrain(trainNo);
						
						req.getSession().setAttribute("train", t);
						req.getSession().setAttribute("fare", fare);
						req.getSession().setAttribute("seats", seats);
						req.getSession().setAttribute("tclass", tclass);
					
						req.getRequestDispatcher("Payment.jsp").include(req, res);
					}					
				}
				catch(Exception e) {}
			}
			else
			{
				req.setAttribute("msg", "Please login First");
				req.getRequestDispatcher("login.jsp").forward(req, res);
			}
			
		pw.close();		
	}
}
