package ProMeet.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import promeet_web.dao.UserDao;

/**
 * Servlet implementation class UserJoinClass
 */
@WebServlet("/CheckClassStatus")
public class CheckClassStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckClassStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String classId=request.getParameter("cid");
		System.out.println("classId is "+classId);
		//checking for class Started from Expert Side
		UserDao dao=new UserDao();
		boolean status=dao.checkClassStatus(classId);//select * from Booking_class where class_id=?
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		out.println(status);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
