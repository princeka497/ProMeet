package promeet_web.beans;

public class Registration {
	private String email,name,city,address,password,phone;
	 
	
	
	
	
	public Registration() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Registration(String email, String name, String city, String address, String password, String phone) {
		super();
		this.email = email;
		this.name = name;
		this.city = city;
		this.address = address;
		this.password = password;
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

}
