package promeet_web.expert.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ProMeet.utilities.CustomMessages;
import promeet_web.beans.Booking;
import promeet_web.dao.ExpertDao;

/**
 * Servlet implementation class Expert_Response
 */
@WebServlet("/Expert_Response")
public class Expert_Response extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Expert_Response() {
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
		String Booking_Id=request.getParameter("id");
		int id = Integer.parseInt(Booking_Id); //converting string to int
		String mDate = request.getParameter("date");

		java.util.Date d=new java.util.Date();
		
		
	
		long classId = d.getTime();
		System.out.println("class id is " +classId);

		HttpSession hs1 = request.getSession(false);
		String email = (String) hs1.getAttribute("sessionEmail");
		System.out.println("Expert Email is " +email);

		HttpSession hs=request.getSession();//it will create a session
		System.out.println("Session Id is " + hs.getId());//it will return unique session ID
		
		String time=request.getParameter("time");
		String message=request.getParameter("message");
		System.out.println("Date is " + mDate);
		System.out.println("Time is " + time);
		System.out.println("Message  is " + message);
		System.out.println("Booking Id is " +Booking_Id);

		
		Booking b=new Booking();
		b.setExpert_response(message);
		b.setJoin_date(mDate);
		b.setTime(time);
		b.setId(id);
		b.setExpert_email(email);
		b.setClass_id(classId);



		ExpertDao dao=new ExpertDao();
		
		

		int status=dao.meetingResponse(b);
		if (status>0)
		{
			request.setAttribute("msg",CustomMessages.AUTHORISE_ERROR);
			 RequestDispatcher rd = request.getRequestDispatcher("/expert/confirm_request.jsp");
			 rd.forward(request, response);

		}
	
      }

}
