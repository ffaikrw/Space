package com.ffaikrw.space.library.recommend.model;

import java.util.Date;

public class Recommend {
	
	private int id;
	private int userId;
	private String isbn;
	private Date createdAt;
	
	public int getId() {
		return id;
	}
	public int getUserId() {
		return userId;
	}
	public String getIsbn() {
		return isbn;
	}
	public Date getCreatedAt() {
		return createdAt;
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
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
}
