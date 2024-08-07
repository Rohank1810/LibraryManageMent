package com.entity;

import javax.persistence.*;

@Entity
@Table(name="book_table")
public class Book {
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int b_id;
	@Column(name="b_title",nullable = false)
	private String b_title;
	private String b_author;
	private String b_price;
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_author() {
		return b_author;
	}
	public void setB_author(String b_author) {
		this.b_author = b_author;
	}
	public String getB_price() {
		return b_price;
	}
	public void setB_price(String b_price) {
		this.b_price = b_price;
	}
	@Override
	public String toString() {
		return "Book [b_id=" + b_id + ", b_title=" + b_title + ", b_author=" + b_author + ", b_price=" + b_price + "]";
	}
	public Book(int b_id, String b_title, String b_author, String b_price) {
		super();
		this.b_id = b_id;
		this.b_title = b_title;
		this.b_author = b_author;
		this.b_price = b_price;
	}
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
