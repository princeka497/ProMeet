package promeet_web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import ProMeet.dbutils.DB_Connection;
import promeet_web.beans.Contact;
import promeet_web.beans.Expert;
import promeet_web.beans.Feedback;
import promeet_web.beans.User;

public class AdminDao {
public HashMap<String,Integer>count_rating()
	
	{

		HashMap<String,Integer>	count_map=new HashMap<String, Integer>();
try {
con=DB_Connection.openConnection();
String query = "SELECT COUNT(CASE WHEN rating = '★★★★★' THEN 1 END) AS five_star,"
		+ "COUNT(CASE WHEN rating = '★★★★☆' THEN 1 END) AS four_star,"
		+ "COUNT(CASE WHEN rating = '★★★☆☆' THEN 1 END) AS three_star,"
		+ "COUNT(CASE WHEN rating = '★★☆☆☆' THEN 1 END) AS two_star,"
		+ "COUNT(CASE WHEN rating = '★☆☆☆☆' THEN 1 END) AS one_star from feedback";
	
PreparedStatement ps = con.prepareStatement(query);
ResultSet rs = ps.executeQuery();
if (rs.next()) {
    // Putting counts in the HashMap with appropriate keys
    count_map.put("five_star", rs.getInt("five_star"));
    count_map.put("four_star", rs.getInt("four_star"));
    count_map.put("three_star", rs.getInt("three_star"));
    count_map.put("two_star", rs.getInt("two_star"));
    count_map.put("one_star", rs.getInt("one_star"));
}

System.out.println(count_map);
con.close();
} catch (Exception e) {
e.printStackTrace();
}

return count_map;

	}
	// MOnthly contct code

	public LinkedHashMap<String, Integer> getMonthlyContactCounts() // try with resources
	{
		LinkedHashMap<String, Integer> monthYearMap = new LinkedHashMap<>();
		try (Connection con = DB_Connection.openConnection()) {
			String query = "SELECT date_format(date, '%Y-%m') AS ym, COUNT(*) AS contact_count FROM contact GROUP BY ym ORDER BY ym;";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				monthYearMap.put(rs.getString("ym"), rs.getInt("contact_count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return monthYearMap;
	}

	// ALL Expert
	private Connection con3;
	private ArrayList<Expert> expertList;

	public ArrayList<Expert> viewAllExpert() {
		expertList = new ArrayList<Expert>();
		Expert e = null;
		String sql = "select * from expert";
		con3 = DB_Connection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con3.prepareStatement(sql);// password, name, phone, city, expert_type, gender, address, profile_pic,
											// verification_document
			rs = ps.executeQuery();
			while (rs.next()) {
				String email = rs.getString("email");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String city = rs.getString("city");
				String expert_type = rs.getString("expert_type");
				String gender = rs.getString("gender");
				String address = rs.getString("address");
				String profile_pic = rs.getString("profile_pic");
				String verification_document = rs.getString("verification_document");
				e = new Expert(email, password, name, phone, city, expert_type, gender, address, profile_pic,
						verification_document);
				expertList.add(e);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return expertList;

	}

	// ALL User Code Here

	private Connection con2;
	private ArrayList<User> userList;

	public ArrayList<User> viewAllUser() {
		userList = new ArrayList<User>();
		User u = null;
		String sql = "select * from user";
		con2 = DB_Connection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con2.prepareStatement(sql);// email, password, name, phone, city, address, profile_pic
			rs = ps.executeQuery();
			while (rs.next()) {
				String email = rs.getString("email");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String city = rs.getString("city");
				String address = rs.getString("address");
				String profile_pic = rs.getString("profile_pic");
				Date date = rs.getDate("date");
				u = new User(email, password, name, phone, city, address, profile_pic, date);
				userList.add(u);
			}

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return userList;

	}

	// AllFeedback code Here
	private Connection con1; // Fixed variable name
	private ArrayList<Feedback> feedbackList;

	public ArrayList<Feedback> viewAllFeedback() {
		feedbackList = new ArrayList<Feedback>();
		Feedback f = null;
		String sql = "select * From feedback";
		con1 = DB_Connection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con1.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String rating = rs.getString("rating");
				String remark = rs.getString("remark");
				Date date = rs.getDate("date");
				f = new Feedback(name, email, rating, remark, date);
				feedbackList.add(f);
			} // Corrected bracket placement

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			// Close resources properly to prevent memory leaks
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return feedbackList;
	}

	// allContact code here
	private Connection con;

	private ArrayList<Contact> contactList;

	public ArrayList<Contact> viewAllContacts() {

		contactList = new ArrayList<Contact>();

		Contact c = null;

		String sql = "select * from contact";
		con = DB_Connection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {

				String name = rs.getString("name");

				String email = rs.getString("email");
				String question = rs.getString("query");
				String phone = rs.getString("phone");
				Date d = rs.getDate("date");
				c = new Contact(name, email, phone, question, d);
				c.setId(rs.getInt("id"));
				contactList.add(c);

				// String name=rs.getString("name");
			}

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return contactList;

	}

	public boolean login(String email, String pass) {
		// TODO Auto-generated method stub
		if (email.equals("admin@gmail.com") && pass.equals("admin"))
			return true;
		return false;
	}

	public int deleteContact(String[] idArray) {
		// TODO Auto-generated method stub
		int status = 0;
		con = DB_Connection.openConnection();
		PreparedStatement ps = null;
		String deleteQuery = "delete from contact where id=?";
		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(deleteQuery);
			for (int i = 0; i < idArray.length; i++) {
				ps.setInt(1, Integer.parseInt(idArray[i]));
				ps.addBatch();// batch statement processing of delete Query
				/* ps.executeUpdate(); */
				// slow

			}
			int flag = 0;
			int[] deleteStatus = ps.executeBatch();// it will go to RDBMS as a batch
			for (int i = 0; i < deleteStatus.length; i++) {
				if (deleteStatus[i] < 0) {
					flag = 1;
					break;
				}
			}
			if (flag == 0) {
				status = 1;
				con.setAutoCommit(true);
				return status;
			}
		} catch (SQLException se) {
			se.printStackTrace();
			/* con.rollback(); */
		}
		return status;
	}

}
