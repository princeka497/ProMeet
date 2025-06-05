package promeet_web.expert.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import promeet_web.dao.ExpertDao;

/**
 * Servlet implementation class StartClass
 */
@WebServlet("/StartClass")
public class StartClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StartClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String id=request.getParameter("clId");
	ExpertDao dao=new ExpertDao();
	
		int status=		dao.updateClassDetails(id);
		if(status>0)
		{
			
			request.setAttribute("classId", id);
			RequestDispatcher rd=request.getRequestDispatcher("/expert/start_class.jsp");
		
		rd.forward(request, response);;
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
