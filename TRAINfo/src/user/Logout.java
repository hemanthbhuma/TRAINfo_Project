package user;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class Logout extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		// PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		
		try
		{
			//	req.getSession(false) prevents new session creation on pressing back button
		   	// returns the old session if exists, if not it returns null
			HttpSession hs = req.getSession(false);
			
			//	Checking for Session expiry 
			if(hs!=null)
			{
				hs.removeAttribute("uname");
				hs.removeAttribute("pass");
				// Invalidate the running HttpSession 
				hs.invalidate();
				
				//	Display the Login.html Page
				req.getRequestDispatcher("index.html").forward(req, res);
			}
		}
		catch(Exception e)
		{	e.printStackTrace();	}	
	}

}
