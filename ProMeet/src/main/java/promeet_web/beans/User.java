package promeet_web.beans;

import java.sql.Date;

public class User {
	private String email, password, name, phone, city, address, profile_pic;
	private Date date;
	private Feedback fd;
	private Booking bk;
	
	
	public Booking getBk() {
		return bk;
	}
	public void setBk(Booking bk) {
		this.bk = bk;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String email, String password, String name, String phone, String city, String address,
			String profile_pic, Date date) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.city = city;
		this.address = address;
		this.profile_pic = profile_pic;
		this.date = date;
	}
	
	
	public Feedback getFd() {
		return fd;
	}
	public void setFd(Feedback fd) {
		this.fd = fd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProfile_pic() {
		return profile_pic;
	}
	public void setProfile_pic(String profile_pic) {
		this.profile_pic = profile_pic;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	

}
