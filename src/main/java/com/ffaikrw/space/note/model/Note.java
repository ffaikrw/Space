package com.ffaikrw.space.note.model;

import java.util.Date;

public class Note {
	
	private int id;
	private int userId;
	private String isbn;
	private String content;
	private Date createdAt;
	private Date updatedAt;
	
	public int getId() {
		return id;
	}
	public int getUserId() {
		return userId;
	}
	public String getIsbn() {
		return isbn;
	}
	public String getContent() {
		return content;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
}
