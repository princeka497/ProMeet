package promeet_web.dao;

import java.sql.*;
import java.util.ArrayList;

import com.mysql.cj.jdbc.PreparedStatementWrapper;

import ProMeet.dbutils.DB_Connection;
import promeet_web.beans.Booking;
import promeet_web.beans.Expert;
import promeet_web.beans.Feedback;
import promeet_web.beans.User;

public class UserDao {
	private Connection con;

	
	
	//expertResponse
	
	
	
	
	public ArrayList<Booking>expertResponse(String email)
	{
		
		ArrayList<Booking> bookingList;

		bookingList = new ArrayList<Booking>();
		Booking b = null;
		String sql = "select * from booking_class where user_email=? and booking_status='confirm'";
		con = DB_Connection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);// password, name, phone, city, expert_type, gender, address, profile_pic,
			// verification_document

			ps.setString(1, email);
			rs = ps.executeQuery();
			
			//user_email, expert_email, message, expert_response, id, booking_status, class_id, time, join_date, date, meeting_status
			while (rs.next()) {
				String expert_email = rs.getString("expert_email");
				String expert_response = rs.getString("expert_response");
				int id=rs.getInt("id");
				String booking_status = rs.getString("booking_status");
				String class_id = rs.getString("class_id");
				String time = rs.getString("time");
				String join_date = rs.getString("join_date");
				String meeting_status = rs.getString("meeting_status");
				b=new Booking();
				b.setUser_email(email);
				if(class_id!=null)
				{
				b.setClass_id(Long.parseLong(class_id));
				}
				else {
				b.setClass_id(0);
				}
				b.setExpert_email(expert_email);
				b.setJoin_date(join_date);
				b.setExpert_response(expert_response);
				
				b.setTime(time);
				b.setMeeting_status(meeting_status);
				b.setId(id);
				b.setBooking_status(booking_status);
				
				bookingList.add(b);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return bookingList;
		
		
		
	}
	// Registration
	public int registration(User u) {
		int status = 0;
		con = DB_Connection.openConnection();
		String strInsert = "insert into user(email, password, name, phone, city, address, profile_pic, date) values(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(strInsert);
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getName());
			ps.setString(4, u.getPhone());
			ps.setString(5, u.getCity());
			ps.setString(6, u.getAddress());
			ps.setString(7, u.getProfile_pic());
			ps.setDate(8, u.getDate());
			System.out.println(ps);
			status = ps.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();

			} catch (SQLException se) {
				se.printStackTrace();

			}
		}

		return status;
	}
	
	
	
	

	public boolean checkEmail(String email) {
		String strsql="select email from feedback where email=? ";
		con=DB_Connection.openConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(strsql);
			ps.setString(1, email);
			rs=ps.executeQuery();
			if(rs.next())
					return true;
			
			
		}
		catch(SQLException se) {
			
			se.printStackTrace();
			
			// finally{}
			return false;
			
		}
		return false;
		
	}


	public int addFeedback(Feedback fd) {
		con = DB_Connection.openConnection();
		int status = 0;
		PreparedStatement ps = null;
		try {
			String query="";

			String strInsert = "insert into feedback(name, email, rating, remark, date) values(?,?,?,?,?)";
			if(checkEmail(fd.getEmail())==false) {

			ps = con.prepareStatement(strInsert);
			ps.setString(1, fd.getName());
			ps.setString(2, fd.getEmail());
			ps.setString(3, fd.getRating());
			ps.setString(4, fd.getRemark());
			ps.setDate(5, fd.getDate());
			System.out.println(ps);
			status = ps.executeUpdate();
			}
			
			else {
				
				String query1="update feedback set rating=?,remark=?,date=? where email=?";
			con=DB_Connection.openConnection();
				
				ps = con.prepareStatement(query1);
				ps.setString(1, fd.getRating());
				ps.setString(2, fd.getRemark());
				ps.setDate(3, fd.getDate());
				ps.setString(4, fd.getEmail());
			
				System.out.println(ps);
				status = ps.executeUpdate();
					
			}
			
            	

		} catch (SQLException se) {
			se.printStackTrace();

		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();

			} catch (SQLException se) {
				se.printStackTrace();

			}
		}
		return status;
	}

	public boolean checkLogin(String email, String password) {
		con = DB_Connection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String selectQuery = "select * from user where email=? and password=?";
		try {
			ps = con.prepareStatement(selectQuery);
			ps.setString(1, email);
			ps.setString(2, password);
			System.out.println(ps);
			rs = ps.executeQuery();
			if (rs.next() == true) {
				return true;
			}

		} catch (SQLException se) {
			se.printStackTrace();

		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();

			} catch (SQLException se) {
				se.printStackTrace();

			}
		}

		return false;
	}

	// view Profile method

	public User userProfile(String email) {
		con = DB_Connection.openConnection();
		String selectQuery = "select * from user where email=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		User u = null;
		try {
			ps = con.prepareStatement(selectQuery);
			ps.setString(1, email);
			System.out.println(ps);
			rs = ps.executeQuery();
			rs.next();// place the cursor at that row

			// email, password, name, phone, city, address, profile_pic, date
			String uName = rs.getString("name");
			String uPhone = rs.getString("phone");
			String uCity = rs.getString("city");
			String uAddress = rs.getString("address");
			String uPic = rs.getString("profile_pic");
			String uPass = rs.getString("password");
			u = new User();// Bean class object to store value that is being fetch from user table

			u.setName(uName);
			u.setEmail(email);
			u.setCity(uCity);
			u.setAddress(uAddress);
			u.setPhone(uPhone);
			u.setPassword(uPass);
			u.setProfile_pic(uPic);

		} catch (SQLException se) {
			se.printStackTrace();

		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
				if (rs != null) {
					rs.close();
				}

			} catch (SQLException se) {
				se.printStackTrace();

			}
		}

		return u;// returning user class object

	}

	public int editProfile(User u, String email) {
		int status = 0;
		con = DB_Connection.openConnection();
		PreparedStatement ps = null;
		try {
			String updateQuery = "update user set phone=?,name=? ,city=? , address=?,profile_pic=? where email=?";
			ps = con.prepareStatement(updateQuery);
			ps.setString(1, u.getPhone());
			ps.setString(2, u.getName());
			ps.setString(3, u.getCity());
			ps.setString(4, u.getAddress());
			ps.setString(5, u.getProfile_pic());
			ps.setString(6,u.getEmail());
			System.out.println(ps);
			status = ps.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		}
		
		

		return status;
	}

	public ArrayList<Expert> searchExpert(String expert_type) {

		ArrayList<Expert> expertList;

		expertList = new ArrayList<Expert>();
		Expert e = null;
		String sql = "select * from expert where expert_type=?";
		con = DB_Connection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);// password, name, phone, city, expert_type, gender, address, profile_pic,
			// verification_document

			ps.setString(1, expert_type);
			rs = ps.executeQuery();
			while (rs.next()) {
				String email = rs.getString("email");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String city = rs.getString("city");
				String etype = rs.getString("expert_type");
				String gender = rs.getString("gender");
				String address = rs.getString("address");
				String profile_pic = rs.getString("profile_pic");
				String verification_document = rs.getString("verification_document");
				e = new Expert(email, password, name, phone, city, etype, gender, address, profile_pic,
						verification_document);
				expertList.add(e);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return expertList;
	}

	public int messageReq(Booking b, String email) {
		int status=0;
		con=DB_Connection.openConnection();
		PreparedStatement ps=null;
		try {
			String strInsert="insert into booking_class( user_email, expert_email, message,date) values(?,?,?,?)";
			ps=con.prepareStatement(strInsert);
			ps.setString(1, b.getUser_email());
			ps.setString(2,b.getExpert_email());
			ps.setString(3, b.getMessage());
			ps.setDate(4,b.getDate());
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
	public boolean checkClassStatus(String classId) {
		boolean status =false;
		con = DB_Connection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String selectQuery="select * from booking_class where class_id=? and meeting_status='start' ";

		try {
			ps = con.prepareStatement(selectQuery);
			ps.setString(1, classId);
			System.out.println(ps);
			
			rs = ps.executeQuery();
			if (rs.next()==true) {
				status=true;
				return status;
			}

		} catch (SQLException se) {
			se.printStackTrace();

		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
				if (rs!=null)
					rs.close();

			} catch (SQLException se) {
				se.printStackTrace();

			}
		}

		return status;
	}
	
	
	
	
	public boolean checkUserEmail(String em) {
		con=DB_Connection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql="select email from user where email=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,em);
			rs=ps.executeQuery();
			if (rs.next())
				return true;
		}
		catch (SQLException se) {
			se.printStackTrace();

		}

		
		
		
		return false;
	}


		
}
