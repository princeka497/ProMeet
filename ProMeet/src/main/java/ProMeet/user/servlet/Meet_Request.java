package ProMeet.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import promeet_web.beans.Booking;
import promeet_web.dao.ExpertDao;
import promeet_web.dao.UserDao;

/**
 * Servlet implementation class Meet_Request
 */
@WebServlet("/Meet_Request")
public class Meet_Request extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Meet_Request() {
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
		String content = request.getParameter("content");
		
		String expertMail=request.getParameter("expertEmail");
		java.util.Date d = new java.util.Date();
		System.out.println(d);

		long dt = d.getTime();// 1970
		java.sql.Date sqlDate = new java.sql.Date(dt);// conversion of util date into sql date
		System.out.println("Sql Date is " + sqlDate);

		HttpSession hs = request.getSession(false);
		String email = (String) hs.getAttribute("sessionEmail");
		Booking b=new Booking();
		b.setMessage(content);
		b.setDate(sqlDate);
		b.setUser_email(email);
		b.setExpert_email(expertMail);
		UserDao dao=new UserDao();
		int status=dao.messageReq(b,email);
		if (status>0)
		{
			request.setAttribute("message", "Thank You for the Request");
			RequestDispatcher rd=request.getRequestDispatcher("/user/meetingrequest.jsp");
			rd.forward(request, response);
			response.sendRedirect("/ProMeet/user/user_home.jsp");
		}
	}
	
}
