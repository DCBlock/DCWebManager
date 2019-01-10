package com.digicaps.dcwebmanager.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CustomerBillCalcul {
	/*
	 * 
  "name": "서상호", // user_index를 사용하지 않았다면 빈값("")
  "email": "shseo@digicaps.com", // user_index를 사용하지 않았다면 빈값("")
  "total_price": 100000, // 손님결재된 총금액
  "total_purchase_price": 90000, // 손님결재에서 구매된 금액
  "total_cancel_price": 5000, // 손님결재에서 구매취소 요청된 금액
  "total_canceled_price": 5000, // 손님결재에서 구매취소된 금액
  "total_count": 132, // 손님결재된 총껀수
  "total_purchase_count": 100, // 손님결재에서 구매된 껀수
  "total_cancel_count": 30, // 손님결재에서 구매취소 요청된 껀수
  "total_canceled_count
	 */

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}

	public String getTotal_purchase_price() {
		return total_purchase_price;
	}

	public void setTotal_purchase_price(String total_purchase_price) {
		this.total_purchase_price = total_purchase_price;
	}

	public String getTotal_cancel_price() {
		return total_cancel_price;
	}

	public void setTotal_cancel_price(String total_cancel_price) {
		this.total_cancel_price = total_cancel_price;
	}

	public String getTotal_canceled_price() {
		return total_canceled_price;
	}

	public void setTotal_canceled_price(String total_canceled_price) {
		this.total_canceled_price = total_canceled_price;
	}

	public String getTotal_count() {
		return total_count;
	}

	public void setTotal_count(String total_count) {
		this.total_count = total_count;
	}

	public String getTotal_purchase_count() {
		return total_purchase_count;
	}

	public void setTotal_purchase_count(String total_purchase_count) {
		this.total_purchase_count = total_purchase_count;
	}

	public String getTotal_cancel_count() {
		return total_cancel_count;
	}

	public void setTotal_cancel_count(String total_cancel_count) {
		this.total_cancel_count = total_cancel_count;
	}

	public String getTotal_canceled_count() {
		return total_canceled_count;
	}

	public void setTotal_canceled_count(String total_canceled_count) {
		this.total_canceled_count = total_canceled_count;
	}
	private String name;
	private String email;
	private String total_price;
	private String total_purchase_price;
	private String total_cancel_price;
	private String total_canceled_price;
	private String total_count;
	private String total_purchase_count;
	private String total_cancel_count;
	private String total_canceled_count;


	public CustomerBillCalcul(){
		
	}
	
	public CustomerBillCalcul(@JsonProperty("email") String email,
			@JsonProperty("total_price") String total_price,
			@JsonProperty("total_purchase_price") String total_purchase_price,
			@JsonProperty("total_cancel_price") String total_cancel_price,
			@JsonProperty("total_canceled_price") String total_canceled_price,
			@JsonProperty("total_count") String total_count,
			@JsonProperty("total_purchase_count") String total_purchase_count,
			@JsonProperty("total_cancel_count") String total_cancel_count,
			@JsonProperty("total_canceled_count") String total_canceled_count
			
			) {
		
		super();
		this.email = email;
		this.total_price = total_price;
		this.total_purchase_price = total_purchase_price;
		this.total_cancel_price = total_cancel_price;
		this.total_canceled_price = total_canceled_price;
		this.total_count = total_count;
		this.total_purchase_count = total_purchase_count;
		this.total_cancel_count = total_cancel_count;
		this.total_canceled_count = total_canceled_count;
		

	}
	
	
}
