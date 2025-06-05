package ProMeet.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProMeet.utilities.CustomMessages;
import promeet_web.dao.UserDao;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		System.out.println(email + password);
		
		UserDao dao =new UserDao();
		boolean status=dao.checkLogin(email,password);
		if(status==true) 
		{
			HttpSession hs=request.getSession();//it will create a session
			System.out.println("Session Id is " + hs.getId());//it will return unique session ID
			hs.setAttribute("sessionEmail",email);
			hs.setAttribute("role", "user");
			
			
			response.sendRedirect("/ProMeet/user/user_home.jsp");
			
		}
		else
		{
			request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
		    RequestDispatcher rd=request.getRequestDispatcher("/user/user_login.jsp");
		    rd.forward(request, response);
		}

		
	}

}
