package promeet_web.beans;

public class Expert {
	private String email, password, name, phone, city, expert_type, gender, address, profile_pic, verification_document, status;
    private Tips tips;
    
	
	
	
	
	public Tips getTips() {
		return tips;
	}


	public void setTips(Tips tips) {
		this.tips = tips;
	}


	public Expert() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Expert(String email, String password, String name, String phone, String city, String expert_type,
			String gender, String address, String profile_pic, String verification_document) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.city = city;
		this.expert_type = expert_type;
		this.gender = gender;
		this.address = address;
		this.profile_pic = profile_pic;
		this.verification_document = verification_document;
		
	
		
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

	public String getExpert_type() {
		return expert_type;
	}

	public void setExpert_type(String expert_type) {
		this.expert_type = expert_type;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getVerification_document() {
		return verification_document;
	}

	public void setVerification_document(String verification_document) {
		this.verification_document = verification_document;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	

}
