package admin;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AdminDAO;
public class AProfile extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	AdminDAO adminDao = null;
	public void init()
	{
		adminDao = new AdminDAO();
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		
		//	HttpSession verification
		HttpSession hs = req.getSession(false);

		if(hs!=null)
		{
			String aName = (String) hs.getAttribute("aname");
			String pWord = (String) hs.getAttribute("pass");
			try
			{
				if(adminDao.adminvalidate(aName, pWord))
				{
					req.getRequestDispatcher("alink.jsp").include(req, res);
					
					req.setAttribute("admin", adminDao.getAdmin(aName));
					req.getRequestDispatcher("aProfile.jsp").include(req, res);	
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
