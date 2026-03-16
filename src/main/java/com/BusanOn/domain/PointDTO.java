package com.BusanOn.domain;

public class PointDTO {
	private int point_id;
	private String user_id;
	private String user_type;
	private String point_type;
	private int point_amount;
	private String description;
	private int balance;
	private String created_at;

	public int getPoint_id() {
		return point_id;
	}
	public void setPoint_id(int point_id) {
		this.point_id = point_id;
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
	public String getPoint_type() {
		return point_type;
	}
	public void setPoint_type(String point_type) {
		this.point_type = point_type;
	}
	public int getPoint_amount() {
		return point_amount;
	}
	public void setPoint_amount(int point_amount) {
		this.point_amount = point_amount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	@Override
	public String toString() {
		return "PointDTO [point_id=" + point_id + ", user_id=" + user_id + ", user_type=" + user_type
				+ ", point_type=" + point_type + ", point_amount=" + point_amount + ", description=" + description
				+ ", balance=" + balance + ", created_at=" + created_at + "]";
	}
}
