package com.BusanOn.domain;

public class ReservationDTO {
	
	private String res_number;
	private String user_id;
	private String user_type;
	private String pen_id;
	private String pen_name;
	private String check_in_d;
	private String check_out_d;
	private String check_in_t;
	private String check_out_t;
	private String res_time;
	private String rm_name;
	private String user_name;
	private String res_status;
	private String rm_price;
	
	
	public String getRm_price() {
		return rm_price;
	}
	public void setRm_price(String rm_price) {
		this.rm_price = rm_price;
	}
	public String getRes_status() {
		return res_status;
	}
	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}
	public String getRes_number() {
		return res_number;
	}
	public void setRes_number(String res_number) {
		this.res_number = res_number;
	}
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
	public String getPen_id() {
		return pen_id;
	}
	public void setPen_id(String pen_id) {
		this.pen_id = pen_id;
	}
	public String getPen_name() {
		return pen_name;
	}
	public void setPen_name(String pen_name) {
		this.pen_name = pen_name;
	}
	public String getCheck_in_d() {
		return check_in_d;
	}
	public void setCheck_in_d(String check_in_d) {
		this.check_in_d = check_in_d;
	}
	public String getCheck_out_d() {
		return check_out_d;
	}
	public void setCheck_out_d(String check_out_d) {
		this.check_out_d = check_out_d;
	}
	public String getCheck_in_t() {
		return check_in_t;
	}
	public void setCheck_in_t(String check_in_t) {
		this.check_in_t = check_in_t;
	}
	public String getCheck_out_t() {
		return check_out_t;
	}
	public void setCheck_out_t(String check_out_t) {
		this.check_out_t = check_out_t;
	}
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	@Override
	public String toString() {
		return "ReservationDTO [res_number=" + res_number + ", user_id=" + user_id + ", user_type=" + user_type
				+ ", pen_id=" + pen_id + ", pen_name=" + pen_name + ", check_in_d=" + check_in_d + ", check_out_d="
				+ check_out_d + ", check_in_t=" + check_in_t + ", check_out_t=" + check_out_t + ", res_time=" + res_time
				+ ", rm_name=" + rm_name + ", user_name=" + user_name + ", res_status=" + res_status + ", rm_price="
				+ rm_price + "]";
	}
	
	
	
	
	
}
