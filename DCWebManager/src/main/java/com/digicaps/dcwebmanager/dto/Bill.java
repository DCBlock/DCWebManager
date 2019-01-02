package com.digicaps.dcwebmanager.dto;

import java.text.DecimalFormat;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Bill {
	private String name;
	private String company;
	private String email;
	private String total_price;
	private String total_dc_price;
	private String billing_amount;
	private String user_record_index;
	
	public static String toNumFormat(String num) {
		int num2 = Integer.parseInt(num);
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(num2);
	}
	
	public Bill(){
		
	}
	
	public Bill(@JsonProperty("name") String name,
			@JsonProperty("company") String company,
			@JsonProperty("email") String email,
			@JsonProperty("total_price") String total_price,
			@JsonProperty("total_dc_price") String total_dc_price,
			@JsonProperty("billing_amount") String billing_amount,
			@JsonProperty("user_record_index") String user_record_index
			) {
		
		super();
		this.name = name;
		this.company = company;
		this.email = email;
		this.total_price = toNumFormat(total_price);
		this.total_dc_price = toNumFormat(total_dc_price);
		this.billing_amount = toNumFormat(billing_amount);
		this.user_record_index = user_record_index;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		
		this.company = company;
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
		total_price = toNumFormat(total_price);
		this.total_price = total_price;
	}
	
	public String getTotal_dc_price() {
		
		return total_dc_price;
	}
	public void setTotal_dc_price(String total_dc_price) {
		total_dc_price = toNumFormat(total_dc_price);
		this.total_dc_price = total_dc_price;
	}
	
	public String getBilling_amount() {
		return billing_amount;
	}
	public void setBilling_amount(String billing_amount) {
		billing_amount = toNumFormat(billing_amount);
		this.billing_amount = billing_amount;
	}
	
	public String getUser_record_index() {
		return user_record_index;
	}
	public void setUser_record_index(String user_record_index) {
		this.user_record_index = user_record_index;
	}
	

	
}
