package com.ffaikrw.space.note.model;

import java.util.Date;

public class Notelist {
	
	// 도서표지, 도서명, isbn, 내용, 작성일, 수정일
	
	private String cover;
	private String title;
	private String isbn;
	private String content;
	private Date createdAt;
	private Date updatedAt;
	
	public String getCover() {
		return cover;
	}
	public String getTitle() {
		return title;
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
	public void setCover(String cover) {
		this.cover = cover;
	}
	public void setTitle(String title) {
		this.title = title;
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
