package promeet_web.expert.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import promeet_web.beans.Expert;
import promeet_web.dao.ExpertDao;

/**
 * Servlet implementation class Expert_Registration
 */
@WebServlet("/Expert_Registration")
@MultipartConfig
public class Expert_Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Expert_Registration() {
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
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String city=request.getParameter("city");
		String expert_type=request.getParameter("expert_type");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		System.out.println(email+password+name+phone+city+expert_type+gender+address);
		
		
		
		
		Part p=request.getPart("profile_pic");
		String fileName=p.getSubmittedFileName();
		long  size=p.getSize();
		System.out.println("file Name and Size is "+ fileName + size);
		ServletContext  sc=getServletContext();
		String serverPath=sc.getRealPath("");//return the path of the hosted(deployed,running) website
		System.out.println("Path is  " + serverPath);
		String folderName="expert_images";
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
	    p.write(picPath);
	    	    
	    
	    
	    
	    
	    
	    
	    
	    Part p1=request.getPart("verification_document");
		String fileName1=p1.getSubmittedFileName();
		long  size1=p1.getSize();
		System.out.println("file Name and Size is "+ fileName1 + size1);
		ServletContext  sc1=getServletContext();
		String serverPath1=sc1.getRealPath("");//return the path of the hosted(deployed,running) website
		System.out.println("Path is  " + serverPath1);
		String folderName1="expert_doc";
		String fullPath1=serverPath1+folderName1;
		String picPath1="null";
		String dbPath1="";
		File f1=new File(fullPath1);//creating Object
		if (!f1.exists())
		{	
			f1.mkdir();//creating directory on that Path
			System.out.println("Directory/Folder Created");
		}
		
		
		
		picPath1=fullPath1+File.separator+fileName1;
		dbPath1=folderName1+File.separator+fileName1;
	    p1.write(picPath1);
	    
	    
	    
	    
	    

	    
	    Expert e=new Expert(email, password, name, phone, city, expert_type, gender, address, dbPath, dbPath1);
	    ExpertDao dao=new ExpertDao(); 
	    int status=dao.registration(e);
	    System.out.println(status);
		
		if (status>0)
		{
			response.sendRedirect("/ProMeet/expert/expert_login.jsp");
		}
	    

	    
	
	}

}
