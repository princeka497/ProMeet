package ProMeet.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import promeet_web.beans.Feedback;
import promeet_web.dao.UserDao;

/**
 * Servlet implementation class UserFeedback
 */
@WebServlet("/UserFeedback")
public class UserFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFeedback() {
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
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String rating=request.getParameter("rating");
		String remark=request.getParameter("remark");
		System.out.println(name+email+rating+remark);
		java.util.Date d=new java.util.Date();
		System.out.println(d);
		
		long dt=d.getTime();//1970
		java.sql.Date sqlDate=new java.sql.Date(dt);
		
		
		
		UserDao ud=new UserDao();
		Feedback fd=new Feedback(name,email,rating,remark,sqlDate);
		int status=ud.addFeedback(fd);
		if(status>0) {
			request.setAttribute("message", "Thank You for the Feedback");
			RequestDispatcher rd=request.getRequestDispatcher("/user/feedback.jsp");
			rd.forward(request, response);
		}
	}
		
		
		
	
}
