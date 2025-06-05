package promeet_web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import ProMeet.dbutils.DB_Connection;
import promeet_web.beans.Registration;

public class RegistrationDao {
	private Connection con;

	public int addRegistration(Registration r) {
		con=DB_Connection.openConnection();
		int status=0;
		PreparedStatement ps=null;
		try {
			String strInsert="insert into registration(email, password, name, phone, city, address) values(?,?,?,?,?,?)";
			ps=con.prepareStatement(strInsert);
			ps.setString(1,r.getEmail());
			ps.setString(2, r.getPassword());
			ps.setString(3,r.getName());
			ps.setString(4,r.getPhone());
			ps.setString(5, r.getCity());
			ps.setString(6,r.getAddress());
			System.out.println(ps);
			status=ps.executeUpdate();
			System.out.println("Query  is " + status);
			
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

}
