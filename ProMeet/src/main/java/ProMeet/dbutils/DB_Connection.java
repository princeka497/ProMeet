package ProMeet.dbutils;
import java.sql.*;
import java.util.ResourceBundle;
public class DB_Connection
{
	
	private static Connection con;
	private static ResourceBundle bundle;
	public static Connection openConnection() 
	{
		try {
			
			bundle=ResourceBundle.getBundle("ProMeet/dbutils/dbInfo");//get the reference of file 
			String DBUserId=bundle.getString("db.userId");
			String DBUserPass=bundle.getString("db.userPass");
			String DBUrl=bundle.getString("db.url");
			System.out.println(DBUserId + DBUserPass + DBUrl );
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			//con=DriverManager.getConnection("jdbc:mysql://localhost:3306/meet_db","root","root");
			con=DriverManager.getConnection(DBUrl,DBUserId,DBUserPass);
		}
		catch(ClassNotFoundException|SQLException cse) {
			cse.printStackTrace();
		}
		return con;
	}
	 public static void main(String[] args) { Connection c=openConnection();
	 System.out.println(c); }
	 

}
