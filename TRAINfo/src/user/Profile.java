package user;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserDAO;
public class Profile extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	UserDAO userDao = null;
	public void init()
	{
		userDao = new UserDAO();
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		
		//	HttpSession verification
		HttpSession hs = req.getSession(false);

		if(hs!=null)
		{
			String uName = (String) hs.getAttribute("uname");
			String pWord = (String) hs.getAttribute("pass");
			try
			{
				if(userDao.validate(uName, pWord))
				{
					req.getRequestDispatcher("link.jsp").include(req, res);
					
					req.setAttribute("user", userDao.getUser(uName));
					req.getRequestDispatcher("Profile.jsp").include(req, res);	
				}	//	end of if
			}	//	end of try
			catch(Exception e) {}
		}
		else
		{		
			req.setAttribute("error", "Please Login First");
			req.getRequestDispatcher("login.jsp").forward(req, res);
		}
		
		pw.close();	
	}
}
