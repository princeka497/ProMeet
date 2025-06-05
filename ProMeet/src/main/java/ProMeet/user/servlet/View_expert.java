package ProMeet.user.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import promeet_web.beans.Expert;
import promeet_web.dao.UserDao;

/**
 * Servlet implementation class View_expert
 */
@WebServlet("/View_expert")
public class View_expert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View_expert() {
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
		String expert_type=request.getParameter("expert_type");
		System.out.println("expert_type is " + expert_type);
		
		UserDao dao=new UserDao();
		ArrayList<Expert>expertList=dao.searchExpert(expert_type);
		//System.out.println(status);
		request.setAttribute("eList", expertList);
		RequestDispatcher rd=request.getRequestDispatcher("/user/expert_details.jsp");
		rd.forward(request, response);
	}

}
