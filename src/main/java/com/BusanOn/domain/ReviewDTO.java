package com.BusanOn.domain;

public class ReviewDTO {
	
	private int rev_num;
	private String pen_id;
	private String pen_name;
	private String user_id;
	private String user_type;
	private String user_name;
	private String rev_title;
	private String rev_content;
	private String rev_star;
	private String rev_date;
	private String reply;
	private String ans_content;
	private String ans_date;
	private String image;
	
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getRev_title() {
		return rev_title;
	}
	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public String getRev_star() {
		return rev_star;
	}
	public void setRev_star(String rev_star) {
		this.rev_star = rev_star;
	}
	public String getRev_date() {
		return rev_date;
	}
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getAns_content() {
		return ans_content;
	}
	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}
	public String getAns_date() {
		return ans_date;
	}
	public void setAns_date(String ans_date) {
		this.ans_date = ans_date;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "ReviewDTO [rev_num=" + rev_num + ", pen_id=" + pen_id + ", pen_name=" + pen_name + ", user_id="
				+ user_id + ", user_type=" + user_type + ", user_name=" + user_name + ", rev_title=" + rev_title
				+ ", rev_content=" + rev_content + ", rev_star=" + rev_star + ", rev_date=" + rev_date + ", reply="
				+ reply + ", ans_content=" + ans_content + ", ans_date=" + ans_date + ", image=" + image + "]";
	}

	
	
	
}
