package promeet_web.general.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import promeet_web.beans.Contact;
import promeet_web.dao.GuestDao;

/**
 * Servlet implementation class Contact_Us
 */
@WebServlet("/Contact_Us")
public class Contact_Us extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contact_Us() {
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
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String query=request.getParameter("query");
		String date=request.getParameter("date");
		//store the data into database table
		//send message to the browser
		
		//passes request to dao Class(Chef)
		//servlet is just like Waiter ->it workson Service LAyer
		//small amount of data like id and password ->no object required
		//but huge amount of data -> like registration detials -> object required 
		 
		//bean class
		
		
		/*
		 * waiter->send data ->Chef-> food cook-use item->from inventry -> return food
		 * to waiter -> serve it to customer servlet->send Data ->dao class->process
		 * logic ->database table-> provide response to servlet -> show the response on
		 * the wb
		 */
		
		
		
		System.out.println("Name is " + name);
		System.out.println("Email is " + email);
		System.out.println("Phone No is " + phone);
		System.out.println("Query is " + query );
		
		/*
		 * request.setAttribute("message", "Thanks You For Contacting Us");
		 * RequestDispatcher rd=request.getRequestDispatcher("/jsp/contact_us.jsp");
		 * rd.forward(request, response);
		 */
		//conversion date 
		java.util.Date d=new java.util.Date();
		System.out.println(d);
		
		long dt=d.getTime();//1970
		java.sql.Date sqlDate=new java.sql.Date(dt);//conversion of util date into sql date
		
		GuestDao dao=new GuestDao();
		Contact c=new Contact(name,email,phone,query,sqlDate);
		int status=dao.addContact(c);
		if (status>0)
		{
			request.setAttribute("message", "Thanks You For Contacting Us");
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/contact_us.jsp");
			rd.forward(request, response);
		}
		
    }

}
