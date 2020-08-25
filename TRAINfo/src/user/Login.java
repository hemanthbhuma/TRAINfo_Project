package user;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserDAO;
public class Login extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	UserDAO userdao;
	public void init()
	{
		userdao = new UserDAO();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		// sPrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		
		String uName = req.getParameter("username");
		String pWord = req.getParameter("password");
		
		try
		{
			if(userdao.validate(uName, pWord))
			{
				//	Http Session setAttribute for Username & Password
				HttpSession hs = req.getSession();
				hs.setAttribute("uname", uName);
				hs.setAttribute("pass", pWord);
				
				req.getRequestDispatcher("link.jsp").include(req, res);
			}
			else
			{
				req.setAttribute("msg", "Invalid Username or Password...");
				req.getRequestDispatcher("login.jsp").include(req, res);
			}
		}
		catch(Exception e) {}
	}
}
