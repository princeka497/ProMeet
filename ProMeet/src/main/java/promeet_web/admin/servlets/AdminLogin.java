package promeet_web.admin.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProMeet.utilities.CustomMessages;
import promeet_web.dao.AdminDao;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("adminEmail");
		String pass=request.getParameter("adminPass");
		HttpSession hs=request.getSession();//it will create a session
		System.out.println("Session Id is " + hs.getId());//it will return unique session ID
		hs.setAttribute("sessionEmail",email);
		hs.setAttribute("role", "admin");
		AdminDao dao=new AdminDao();
		boolean status=dao.login(email,pass);
		if (status)
		{
			response.sendRedirect("/ProMeet/admin/adminhome.jsp");
		}
			else 
		{	
			request.setAttribute("msg",CustomMessages.LOGIN_ERROR);
			RequestDispatcher rd=request.getRequestDispatcher("/admin/admin_login.jsp");
		    rd.forward(request, response);
		}
	}

}
