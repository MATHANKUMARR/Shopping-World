package com.example.demo.entity;

import javax.persistence.*;

import lombok.*;

@Entity
@Table
public class Sales {
	
	private @Id @GeneratedValue int productId;
	private String productName;
	private String productPrice;
	private String imagePath;
	
	public Sales() {}

	public Sales(int productId, String productName, String productPrice, String imagePath) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.imagePath = imagePath;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
}
