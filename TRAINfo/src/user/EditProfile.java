package user;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserDAO;
public class EditProfile extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	UserDAO userDao = null;
	public void init()
	{
		userDao = new UserDAO();
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		
		//	HttpSession verification
		HttpSession hs = req.getSession(false);
	
			if(hs!=null)
			{
				String uname = (String) hs.getAttribute("uname");
				String pword = (String) hs.getAttribute("pass");
				try
				{
					if(userDao.validate(uname, pword))
					{
						req.getRequestDispatcher("link.jsp").include(req, res);
						req.setAttribute("user", userDao.getUser(uname));
						req.getRequestDispatcher("Edit.jsp").include(req, res);						
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
