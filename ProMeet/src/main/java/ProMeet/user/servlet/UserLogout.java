package ProMeet.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProMeet.utilities.CustomMessages;

/**
 * Servlet implementation class UserLogout
 */
@WebServlet("/UserLogout")
public class UserLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);//it will return the reference of existing Session
        System.out.println("Old Session id " + hs.getId());
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
        response.setHeader("Pragma","no-cache"); //HTTP 1.0
        response.setDateHeader ("Expires", 0); //prevents caching at theproxyserver
        hs.removeAttribute("SessionEmail");
        hs.removeAttribute("role");
        hs.invalidate();//to destroy the Session
        	
       
        HttpSession newSession=request.getSession(true);
        newSession.setAttribute("logout_msg", CustomMessages.LOGOUT_MESSAGE);
        response.sendRedirect("/ProMeet/user/user_login.jsp");
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

}
