package promeet_web.expert.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import promeet_web.beans.Expert;
import promeet_web.beans.Tips;
import promeet_web.dao.ExpertDao;

/**
 * Servlet implementation class AddTips
 */
@WebServlet("/AddTips")
public class AddTips extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddTips() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String content = request.getParameter("content");
		java.util.Date d = new java.util.Date();
		System.out.println(d);

		long dt = d.getTime();// 1970
		java.sql.Date sqlDate = new java.sql.Date(dt);// conversion of util date into sql date
		System.out.println("Sql Date is " + sqlDate);

		HttpSession hs = request.getSession(false);
		String email = (String) hs.getAttribute("sessionEmail");
		Tips e = new Tips();
		e.setContent(content);
		e.setDate(sqlDate);
		e.setEmail(email);
		ExpertDao dao=new ExpertDao();
		int status=dao.addTips(e,email);
		if (status>0)
		{
			response.sendRedirect("/ProMeet/expert/expert_home.jsp");
		}
		
	}

}
