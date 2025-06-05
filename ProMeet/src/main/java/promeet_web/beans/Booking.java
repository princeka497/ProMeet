package promeet_web.beans;

import java.sql.Date;

public class Booking {
	private String user_email,expert_email,message,expert_response,booking_status,time, join_date,meeting_status;
	private Date date;
	private int id;
	private long class_id;
	
	
	
	public int getId() {
		return id;
	}








	public void setId(int id) {
		this.id = id;
	}








	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
	
	public Booking(String user_email, String expert_email, String message) {
		super();
		this.user_email = user_email;
		this.expert_email = expert_email;
		this.message = message;
	}








	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getExpert_email() {
		return expert_email;
	}
	public void setExpert_email(String expert_email) {
		this.expert_email = expert_email;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getExpert_response() {
		return expert_response;
	}
	public void setExpert_response(String expert_response) {
		this.expert_response = expert_response;
	}
	public String getBooking_status() {
		return booking_status;
	}
	public void setBooking_status(String booking_status) {
		this.booking_status = booking_status;
	}
	
	public long getClass_id() {
		return class_id;
	}








	public void setClass_id(long class_id) {
		this.class_id = class_id;
	}








	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getMeeting_status() {
		return meeting_status;
	}
	public void setMeeting_status(String meeting_status) {
		this.meeting_status = meeting_status;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	

}
