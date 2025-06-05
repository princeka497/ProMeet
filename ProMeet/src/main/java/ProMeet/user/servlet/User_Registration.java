package ProMeet.user.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import promeet_web.beans.Registration;
import promeet_web.beans.User;
import promeet_web.dao.RegistrationDao;
import promeet_web.dao.UserDao;

/**
 * Servlet implementation class User_Registration
 */
@WebServlet("/User_Registration")
@MultipartConfig
public class User_Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String em=request.getParameter("uEmail");
		System.out.println("Received Email is " + em);
		
		UserDao dao=new UserDao();
		boolean status=dao.checkUserEmail(em); 
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		if (status)
		{
			out.print("true");
		}
		
		                 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String city=request.getParameter("city");
		String address=request.getParameter("address");
		
		System.out.println(email+password+name+phone+city+address);
		//fetching uploaded file data
		Part p=request.getPart("profilePic");
		String fileName=p.getSubmittedFileName();
		long  size=p.getSize();
		System.out.println("file Name and Size is "+ fileName + size);
		ServletContext  sc=getServletContext();//Generic Servlet 
		//reference of existing Context
		String serverPath=sc.getRealPath("");//return the path of the hosted(deployed,running) website
		System.out.println("Path is  " + serverPath);
		String folderName="profileImages";
		String fullPath=serverPath+folderName;
		String picPath="null";
		String dbPath="";
		
		File f=new File(fullPath);//creating Object
		if (!f.exists())
		{	
			f.mkdir();//creating directory on that Path
			System.out.println("Directory/Folder Created");
		}
		
		
		
		picPath=fullPath+File.separator+fileName;
		dbPath=folderName+File.separator+fileName;
	    p.write(picPath);//upload image on the given path
	    // Creating bean Class Object
		
	    java.util.Date d=new java.util.Date();
		System.out.println(d);
		
		long dt=d.getTime();//1970
		java.sql.Date sqlDate=new java.sql.Date(dt);//conversion of util date into sql date
		System.out.println("Sql Date is " + sqlDate);
		
		
		//cerating  bean class object
		User u=new User(email, password, name, phone, city, address, dbPath, sqlDate);
	    UserDao dao=new UserDao();
	    int status =dao.registration(u);
		System.out.println(status);
		request.setAttribute("message", "Thanks You For Registration");
		RequestDispatcher rd=request.getRequestDispatcher("/user/user_registration.jsp");
		rd.forward(request, response);
		if (status>0)
		{
			response.sendRedirect("/ProMeet/user/user_login.jsp");
		}
		


		
		
	
	}

}
