package user;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserDAO;
public class Registration extends HttpServlet{;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	UserDAO userdao;
	public void init()
	{
		userdao = new UserDAO();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
	{
		// PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		
			String uName = req.getParameter("username");
			String pWord = req.getParameter("password");			
			String fName = req.getParameter("fname");
			String lName = req.getParameter("lname");
			String addr = req.getParameter("address");
			long pNo = Long.parseLong(req.getParameter("phoneno"));
			String mId = req.getParameter("mailid");
			  
			try
			{
				if(userdao.containsUser(uName))
				{
					req.setAttribute("regerror", "Username Already Exists.!! Please register with another Username.");
					req.getRequestDispatcher("Register.jsp").include(req, res);
				}
				else if(userdao.register(uName, pWord, fName, lName, addr, pNo, mId))
				{
					req.setAttribute("msg", "User Registered Successfully");
					req.getRequestDispatcher("login.jsp").include(req, res);
				}
				else
				{
					req.setAttribute("regerror", "Registration Unsuccessfull..!! Please Register again..!!");
					req.getRequestDispatcher("Register.jsp").include(req, res);
				}
			}
			catch (Exception e)	{}	
	}
}
