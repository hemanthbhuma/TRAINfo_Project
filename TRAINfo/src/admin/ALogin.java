package admin;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AdminDAO;
public class ALogin extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	AdminDAO admindao;
	public void init()
	{
		admindao = new AdminDAO();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		// PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		
		String aName = req.getParameter("adminname");
		String pWord = req.getParameter("password");
		
		try
		{
			if(admindao.adminvalidate(aName, pWord))
			{
				//	Http Session setAttribute for Username & Password
				HttpSession hs = req.getSession();
				hs.setAttribute("aname", aName);
				hs.setAttribute("pass", pWord);
				
				req.getRequestDispatcher("alink.jsp").include(req, res);
			}
			else
			{
				req.setAttribute("msg", "Invalid Admin Name or Password...");
				req.getRequestDispatcher("login.jsp").include(req, res);
			}
		}
		catch(Exception e) {}
	}
}
