package com.example.demo.entity;


import java.util.Date;
import java.time.ZonedDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table
public class Cart {
	
	private @Id @GeneratedValue int CartId;
	private String productId;
	private String customerid;
	private String productName;
	private String productPrice;
	private String quantity;
	private String subTotal;
	private String purchaseDate;
	private String purchaseTime;
	
	public Cart() {}
	
	public Cart(String productId, String customerid, String productName, String productPrice,
			String quantity, String subTotal, String purchaseDate, String purchaseTime) {
		super();
		this.productId = productId;
		this.customerid = customerid;
		this.productName = productName;
		this.productPrice = productPrice;
		this.quantity = quantity;
		this.subTotal = subTotal;
		this.purchaseDate = purchaseDate;
		this.purchaseTime = purchaseTime;
	}
	
	public int getCartId() {
		return CartId;
	}
	public void setCartId(int cartId) {
		CartId = cartId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
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
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(String subTotal) {
		this.subTotal = subTotal;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getPurchaseTime() {
		return purchaseTime;
	}
	public void setPurchaseTime(String purchaseTime) {
		this.purchaseTime = purchaseTime;
	}
	
}
