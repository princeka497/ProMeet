package promeet_web.dao;

import java.sql.*;
import java.util.ArrayList;

import ProMeet.dbutils.DB_Connection;
import promeet_web.beans.Booking;
import promeet_web.beans.Expert;
import promeet_web.beans.Tips;
import promeet_web.beans.User;

public class ExpertDao {
	private Connection con;
	
	
	
	
	//meeting response
	public int meetingResponse(Booking b) {
		int status=0;
		con=DB_Connection.openConnection();
	    PreparedStatement ps=null;
	
	    try {
	    	String query="update booking_class set expert_response=?,class_id=?,time=?,join_date=?, expert_email=?,booking_status='confirm' where id=?";
	    	ps=con.prepareStatement(query);
	    	ps.setString(1, b.getExpert_response());
			ps.setLong(2, b.getClass_id());
			ps.setString(3, b.getTime());
			ps.setString(4, b.getJoin_date());
			ps.setString(5,b.getExpert_email());
			ps.setInt(6, b.getId());
			System.out.println(ps);

	    	status=ps.executeUpdate();
			System.out.println("Query Status is  " + status);
			
			
			
	    	
	    }
	    catch(SQLException se) {
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
	
	
	
	
	//pending request 
	public ArrayList<User> viewPendingBookings(String expert_email){
		ArrayList<User> userList = new ArrayList<>();
		con = DB_Connection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "SELECT u.name, u.city, u.phone, u.profile_pic, u.email, b.message, b.id, b.booking_status " +
		               "FROM user u, booking_class b WHERE u.email = b.user_email AND b.expert_email = ? AND b.booking_status = 'pending'";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, expert_email);
			rs = ps.executeQuery();
			


			while (rs.next()) {
				String uName = rs.getString("name");
				String uPhone = rs.getString("phone");
				String uMessage = rs.getString("message");
				String uProfilePic = rs.getString("profile_pic");
				String uEmail = rs.getString("email");

				int bId = rs.getInt("id");
				String bstatus = rs.getString("booking_status");

				Booking b = new Booking();
				b.setId(bId);
				b.setBooking_status(bstatus);
				b.setMessage(uMessage);
				b.setExpert_email(expert_email);
				b.setUser_email(uEmail); 

				User u = new User();
				u.setName(uName);
				u.setPhone(uPhone);
				u.setEmail(uEmail);
				u.setProfile_pic(uProfilePic);
				u.setBk(b);

				userList.add(u);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}

		return userList;
	}
	
	

	//view all response code here
	public ArrayList<User> viewAllResponses(String expert_Email) {
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    ArrayList<User> responseList = new ArrayList<>();

	    String sql = "SELECT u.email, u.name, u.phone, b.id, b.message, b.booking_status, " +
	                 "b.expert_response, b.class_id, b.time, b.join_date " +
	                 "FROM user u, booking_class b " +
	                 "WHERE u.email = b.user_email AND b.expert_email = ? AND b.booking_status = 'confirm'";

	    try {
	        con = DB_Connection.openConnection();
	        ps = con.prepareStatement(sql);
	        ps.setString(1, expert_Email);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            Booking b = new Booking();
	            b.setId(rs.getInt("id"));
	            b.setMessage(rs.getString("message"));
	            b.setBooking_status(rs.getString("booking_status"));
	            b.setExpert_response(rs.getString("expert_response"));  // fixed case
	            b.setClass_id(rs.getLong("class_id"));                   // fixed case
	            b.setTime(rs.getString("time"));
	            b.setJoin_date(rs.getString("join_date"));

	            User u = new User();
	            u.setEmail(rs.getString("email"));
	            u.setName(rs.getString("name"));
	            u.setPhone(rs.getString("phone"));
	            u.setBk(b);

	            responseList.add(u);
	        }

	    } catch (SQLException se) {
	        se.printStackTrace(); // consider using a logger
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException se) {
	            se.printStackTrace();
	        }
	    }

	    return responseList;
	}

	

	public int registration(Expert e) {
		int status=0;
		con=DB_Connection.openConnection();
	    PreparedStatement ps=null;
		try {
			String strInsert="insert into expert(email, password, name, phone, city, expert_type, gender, address, profile_pic, verification_document ) values(?,?,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(strInsert);
			ps.setString(1,e.getEmail());
			ps.setString(2,e.getPassword());
			ps.setString(3, e.getName());
			ps.setString(4, e.getPhone());
			ps.setString(5,e.getCity());
			ps.setString(6,e.getExpert_type());
			ps.setString(7,e.getGender());
			ps.setString(8,e.getAddress());
			ps.setString(9,e.getProfile_pic());
			ps.setString(10,e.getVerification_document());
			status=ps.executeUpdate();
			System.out.println("Query Status is  " + status);
			
			
		}
		catch(SQLException se) {
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

	public boolean checkLogin(String email, String password) 
	{
		con=DB_Connection.openConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String selectQuery="select * from expert where email=? and password=?";
		    try {
		    	ps=con.prepareStatement(selectQuery);
		    	ps.setString(1,email);
		    	ps.setString(2, password);
		    	System.out.println(ps);
		    	rs=ps.executeQuery();
		    	if (rs.next()==true) {
		    		return true;
		    	}
		    	
		    }
		    catch(SQLException se) {
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
		
		
		
		
		return false;
	}
	public Expert expertProfile(String email) 
	{
		con=DB_Connection.openConnection();
		String selectQuery="select * from expert where email=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Expert e=null;
		try {
			ps=con.prepareStatement(selectQuery);
			ps.setString(1, email);
			System.out.println(ps);
			rs=ps.executeQuery();
			rs.next();//place the cursor at that row
			
			//email, password, name, phone, city, address, profile_pic, date
			String eName=rs.getString("name");
			String ePhone=rs.getString("phone");
			String eCity=rs.getString("city");
			String eAddress=rs.getString("address");
			String ePic=rs.getString("profile_pic");
			String ePass=rs.getString("password");
			String edoc=rs.getString("verification_document");
			String etype=rs.getString("expert_type");
			String egender=rs.getString("gender");
			e=new Expert();//Bean class object to store value that is being fetch from user table
			
			e.setName(eName);
			e.setEmail(email);
			e.setCity(eCity);
			e.setAddress(eAddress);
			e.setPhone(ePhone);
			e.setPassword(ePass);
			e.setProfile_pic(ePic);
			e.setVerification_document(edoc);
			e.setExpert_type(etype);
			e.setGender(egender);
			

			
			
		}
		catch(SQLException se) {
			se.printStackTrace();
			
		}
		finally {
			try {
				if (ps!=null)
					ps.close();
				if (con!=null)
					con.close();
				if (rs!=null) {
					rs.close();
				}
				
			}
			catch(SQLException se) {
				se.printStackTrace();
				
			}
		}
	    

		
		
		
		
		return e;// returning user class object 

	}

	public int editProfile(Expert e, String email) {
		int status=0;
		con=DB_Connection.openConnection();
		PreparedStatement ps=null;
		try {
			String updateQuery="update expert set phone=?,name=? ,city=? , address=?,expert_type=?,gender=? where email=?";
			ps=con.prepareStatement(updateQuery);
			ps.setString(1, e.getPhone());
			ps.setString(2, e.getName());
			ps.setString(3,e.getCity());
			ps.setString(4, e.getAddress());
			ps.setString(5,e.getExpert_type());
			ps.setString(6, e.getGender());
			ps.setString(7,e.getEmail());
			
			System.out.println(ps);
			
			status=ps.executeUpdate();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		
		
		
		
		
		
		
		
		return status;

		
	
	}

	public int addTips(Tips e, String email) {
		int status=0;
		con=DB_Connection.openConnection();
		PreparedStatement ps=null;
		try {
			String strInsert="insert into tips( email, content, date) values(?,?,?)";
			ps=con.prepareStatement(strInsert);
			ps.setString(1, e.getEmail());
			ps.setString(2,e.getContent());
			ps.setDate(3, e.getDate());
			System.out.println(ps);
			status=ps.executeUpdate();//insert 
			System.out.println("Query Status is  " + status );

			
			
		}
		catch(SQLException se) {
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
	
	
	public int updateClassDetails(String id) {
		// TODO Auto-generated method stub
		int status=0;
		
		con=DB_Connection.openConnection();
		
		
		PreparedStatement ps=null;
		
		
		String updateQuery="update booking_class set meeting_status='start' where class_id=?";
		try {
			ps=con.prepareStatement(updateQuery);
			ps.setString(1, id);
		status=	ps.executeUpdate();
			
		}
		catch(SQLException se) {se.printStackTrace();}
		
		return status;
	}




	public int stopClassDetails(String id) {
		
		
		
			int status=0;
		
		con=DB_Connection.openConnection();
		
		
		PreparedStatement ps=null;
		
		
		String updateQuery="update booking_class set meeting_status='stop' where class_id=?";
		try {
			ps=con.prepareStatement(updateQuery);
			ps.setString(1, id);
		status=	ps.executeUpdate();
			
		}
		catch(SQLException se) {se.printStackTrace();}
		
		return status;

		//return 0;
	}
	

}
