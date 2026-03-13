package com.BusanOn.domain;

public class QnaDTO {
//	ㄴ
	private int count;
	private String user_id;
	private String user_type;
	private String user_name;
	private String title;
	private String content;
	private String reply;
	private String time;
	private String writer;
	private String answer;
	private String answer_time;
	

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	public String getAnswer_time() {
		return answer_time;
	}
	public void setAnswer_time(String answer_time) {
		this.answer_time = answer_time;
	}
	
	@Override
	public String toString() {
		return "QnaDTO [count=" + count + ", user_id=" + user_id + ", user_type=" + user_type + ", user_name="
				+ user_name + ", title=" + title + ", content=" + content + ", reply=" + reply + ", time=" + time
				+ ", writer=" + writer + ", answer=" + answer + ", answer_time=" + answer_time + "]";
	}
	
	
	
	
	
	
}
