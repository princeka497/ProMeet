package promeet_web.beans;

import java.sql.Date;

public class Tips {
      private String email,content;
      private Date date;
      private int id;
      
      
      
      
	public Tips() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public Tips(String email, String content, Date date) {
		super();
		this.email = email;
		this.content = content;
		this.date = date;
	}




	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
      
      
}
