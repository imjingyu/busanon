package com.BusanOn.domain;

public class MemberDTO {
	private String user_id;
	private String user_type;
	private String password;
	private String user_name;
	private String jumin;
	private String user_phonenumber;
	private String user_address;
	private String user_zipcode;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getUser_phonenumber() {
		return user_phonenumber;
	}
	public void setUser_phonenumber(String user_phonenumber) {
		this.user_phonenumber = user_phonenumber;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_zipcode() {
		return user_zipcode;
	}
	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}
	@Override
	public String toString() {
		return "MemberDTO [user_id=" + user_id + ", user_type=" + user_type + ", password=" + password + ", user_name="
				+ user_name + ", jumin=" + jumin + ", user_phonenumber=" + user_phonenumber + ", user_address="
				+ user_address + ", user_zipcode=" + user_zipcode + "]";
	}
	
	
	
}
