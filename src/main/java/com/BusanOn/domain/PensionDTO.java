package com.BusanOn.domain;

public class PensionDTO {
	
	private int count; 
	private String pen_id;
	private String user_id; 
	private String pen_name;
	private String pen_address;
	private String pen_zipcode;
	private String pen_number;
	private String pen_image;
	private String star;
	private String rv;
	private String rm_price;

	public String getPen_id() {
		return pen_id;
	}
	public void setPen_id(String pen_id) {
		this.pen_id = pen_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPen_name() {
		return pen_name;
	}
	public void setPen_name(String pen_name) {
		this.pen_name = pen_name;
	}
	public String getPen_address() {
		return pen_address;
	}
	public void setPen_address(String pen_address) {
		this.pen_address = pen_address;
	}
	public String getPen_zipcode() {
		return pen_zipcode;
	}
	public void setPen_zipcode(String pen_zipcode) {
		this.pen_zipcode = pen_zipcode;
	}
	public String getPen_number() {
		return pen_number;
	}
	public void setPen_number(String pen_number) {
		this.pen_number = pen_number;
	}
	public String getPen_image() {
		return pen_image;
	}
	public void setPen_image(String pen_image) {
		this.pen_image = pen_image;
	}

	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	
	public String getRv() {
		return rv;
	}
	public void setRv(String rv) {
		this.rv = rv;
	}
	public String getRm_price() {
		return rm_price;
	}
	public void setRm_price(String rm_price) {
		this.rm_price = rm_price;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "PensionDTO [count=" + count + ", pen_id=" + pen_id + ", user_id=" + user_id + ", pen_name=" + pen_name
				+ ", pen_address=" + pen_address + ", pen_zipcode=" + pen_zipcode + ", pen_number=" + pen_number
				+ ", pen_image=" + pen_image + ", star=" + star + ", rv=" + rv + ", rm_price=" + rm_price + "]";
	}
	


}
