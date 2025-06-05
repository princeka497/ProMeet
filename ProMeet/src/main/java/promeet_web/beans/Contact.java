package promeet_web.beans;

import java.sql.Date;

public class Contact {
	private int id;
	private String name,email,phone,query;
	Date date;
	
	
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Contact(String name, String email, String phone, String query, Date date) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.query = query;
		this.date = date;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	

}
