package ProMeet.user.servlet;

import java.io.IOException;

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
@WebServlet("/UserJoinClass")
public class UserJoinClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserJoinClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String classId=request.getParameter("clId");
		System.out.println("classId is "+classId);
		//checking for class Started from Expert Side
		UserDao dao=new UserDao();
		boolean status=dao.checkClassStatus(classId);//select * from Booking_class where class_id=?
		
		if(status==true)
		{
		request.setAttribute("userClassId", classId);
		RequestDispatcher rd=request.getRequestDispatcher("/user/join_class.jsp");
		rd.forward(request, response);
		}
		else {
			
			request.setAttribute("msg", "Class Not Started yet pls wait");
			RequestDispatcher rd=request.getRequestDispatcher("/user/expert_response.jsp");
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
