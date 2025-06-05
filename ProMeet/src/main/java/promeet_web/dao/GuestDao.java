package promeet_web.dao;

import promeet_web.beans.Contact;
import promeet_web.beans.Expert;
import promeet_web.beans.Feedback;
import promeet_web.beans.Tips;
import promeet_web.beans.User;

import java.sql.*;
import java.util.ArrayList;

import ProMeet.dbutils.DB_Connection;

public class GuestDao {
	private Connection con;
	
	//-------Method for accessing Tips
	
	public ArrayList<Expert> allTips()
	{
		con=DB_Connection.openConnection();
		String sql = "SELECT t.email, t.content, t.date, e.name, e.expert_type, e.phone FROM tips t JOIN expert e ON t.email = e.email";

		Expert e=null;
		Tips t=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		ArrayList<Expert> expertList=new ArrayList<>();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) 
			{
				String email=rs.getString("email");
				String content=rs.getString("content");
				Date date=rs.getDate("date");
				
				String name=rs.getString("name");
				String expert_type=rs.getString("expert_type");
				
				t=new Tips();
				t.setEmail(email);
				t.setContent(content);
				t.setDate(date);
				
				e=new Expert();
				e.setName(name);
				e.setExpert_type(expert_type);
	            e.setTips(t); // associate the Tips object with the Expert

				expertList.add(e);
			}
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		finally {
			try {
				if (ps!=null)
					ps.close();
				if (con!=null)
					con.close();
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return expertList;
	}

	//------------MEthod For Accessing Feedback
	
	public ArrayList<User> allFeedbacks()
	{
		con=DB_Connection.openConnection();
		String sql="select f.name,f.rating,f.remark,f.date,u.profile_pic from feedback f,user u where u.email=f.email   ";
		User u=null;
		Feedback feed=null;//and f.rating='★★★★★' order by date desc limit 4
		PreparedStatement ps = null;
		ResultSet rs=null;
		ArrayList<User> userList=new ArrayList<>();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) 
			{
				String uName=rs.getString("name");
				String uRating=rs.getString("rating");
				String uRemark=rs.getString("remark");
				String uPic=rs.getString("profile_pic");
				
				// feedback Bean class object
				feed=new Feedback();
				feed.setName(uName);
				feed.setRating(uRating);
				feed.setRemark(uRemark);
				
				//Creating Object of user Bean class
				u=new User();
				u.setProfile_pic(uPic);
				u.setFd(feed);//HAs a Relationship
				//adding user Class Object into arrayList
				userList.add(u);
			}
			
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		finally {
			try {
				if (ps!=null)
					ps.close();
				if (con!=null)
					con.close();
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
		}
		
		return userList;
	}

	public int addContact(Contact c) {
		con = DB_Connection.openConnection();// connection established => meet_db
		int status=0;
		PreparedStatement ps = null;
		try {
			String strInsert = "insert into contact(name, email, phone, query, date) values(?,?,?,?,?)";
		    ps=	con.prepareStatement(strInsert);
			ps.setString(1,c.getName());
			ps.setString(2,c.getEmail());
			ps.setString(3,c.getPhone());
			ps.setString(4,c.getQuery());
			ps.setDate(5,c.getDate());
			System.out.println(ps);
			status=ps.executeUpdate();//insert 
			System.out.println("Query Status is  " + status );

			//passes this 
			// query-> dbms-complier-compile->store it into Buffer and assign the address
            //of the buffer to the ps
			}
		catch (SQLException se)
		{
			se.printStackTrace();
		}
		finally {
			try {
				if (ps!=null)
					ps.close();
				if (con!=null)
					con.close();
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return status;

	}

}
