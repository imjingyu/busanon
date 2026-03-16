package com.BusanOn.domain;

public class NoticeDTO {
	private int notice_id;
	private String title;
	private String content;
	private String writer_id;
	private int views;
	private String created_at;
	private String updated_at;

	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
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
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}

	@Override
	public String toString() {
		return "NoticeDTO [notice_id=" + notice_id + ", title=" + title + ", content=" + content
				+ ", writer_id=" + writer_id + ", views=" + views + ", created_at=" + created_at
				+ ", updated_at=" + updated_at + "]";
	}
}
