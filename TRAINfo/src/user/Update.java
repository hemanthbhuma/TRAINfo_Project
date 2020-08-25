package user;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserDAO;
public class Update extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	UserDAO userDao;
	public void init()
	{
		userDao = new UserDAO();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException
	{
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		
		//	HTTPSession verification
		HttpSession hs = req.getSession(false);
		String uName = (String) hs.getAttribute("uname");
		String pWord = (String) hs.getAttribute("pass");
			
			if(userDao.validate(uName, pWord))
			{
				String fName = req.getParameter("fname");
				String lName = req.getParameter("lname");
				String addr = req.getParameter("address");
				long pNo = Long.parseLong(req.getParameter("phoneno"));
				String mId = req.getParameter("mailid");
				
				try
				{
					
					if(userDao.editUser(fName, lName, addr, pNo, mId, uName, pWord))
					{
						req.setAttribute("msg", "Profile Updated");
						req.getRequestDispatcher("link.jsp").include(req, res);
					}
					else
					{
						req.setAttribute("msg", "Profile Not Updated");
						req.getRequestDispatcher("link.jsp").include(req, res);
					}
					
				}	//	end of try
				catch (Exception e)
				{	e.printStackTrace();	}
			}	//	end of if
			else
			{
				req.getRequestDispatcher("login.html").include(req, res);				
				pw.println("<br><h1 class=\"text-center\">Please Login First</h1>");
			}
		pw.close();	
	}

}
