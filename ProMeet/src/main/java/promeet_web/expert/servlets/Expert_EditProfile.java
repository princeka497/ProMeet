package promeet_web.expert.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import promeet_web.beans.Expert;
import promeet_web.dao.ExpertDao;

/**
 * Servlet implementation class Expert_EditProfile
 */
@WebServlet("/Expert_EditProfile")
public class Expert_EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Expert_EditProfile() {
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
		String eName=request.getParameter("name");
		String eCity=request.getParameter("city");
		String eAddress=request.getParameter("address");
		String ePhone=request.getParameter("phone");
		String eType=request.getParameter("expert_type");
		String eGender=request.getParameter("gender");
		
		HttpSession hs=request.getSession(false);
		String email=(String)hs.getAttribute("sessionEmail");
		
		Expert e=new Expert();
		e.setName(eName);
		e.setCity(eCity);
		e.setAddress(eAddress);
		e.setPhone(ePhone);
		e.setExpert_type(eType);
		e.setGender(eGender);
		e.setEmail(email);
		
		ExpertDao dao=new ExpertDao();
		int status=dao.editProfile(e,email);
		if (status>0)
		{
			response.sendRedirect("/ProMeet/expert/expert_home.jsp");
		}
		
		
		
		 
	}

}
