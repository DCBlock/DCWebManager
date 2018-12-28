package com.digicaps.dcwebmanager.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class OneUserOrderList {
	private String date;
	private String receipt_id;
	private String name;
	private String menu_name_kr;
	private String price;
	private String dc_price;
	private String type;
	private String size;
	private String count;
	private String receipt_status;
	private String purchase_date;
	private String cancel_date;
	private String purchase_type;

	
	/*
            "date": 1544437417,
            "receipt_id": "000001",
            "name": "아쿠아맨",
            "menu_name_kr": "에스프레소",
            "price": 2500,
            "dc_price": 1000,
            "type": "HOT",
            "size": "REGULAR",
            "count": 5,
            "receipt_status": 1,
            "purchase_date": 1544437313,
            "cancel_date": 1544437417,
            "purchase_type": 0 
	  
	 
	 */

	public OneUserOrderList(){
		
	}
	
	public OneUserOrderList(@JsonProperty("date") String date,
			@JsonProperty("receipt_id") String receipt_id,
			@JsonProperty("name") String name,
			@JsonProperty("menu_name_kr") String menu_name_kr,
			@JsonProperty("price") String price,
			@JsonProperty("dc_price") String dc_price,
			@JsonProperty("type") String type,
			@JsonProperty("size") String size,
			@JsonProperty("count") String count,
			@JsonProperty("receipt_status") String receipt_status,
			@JsonProperty("purchase_date") String purchase_date,
			@JsonProperty("cancel_date") String cancel_date,
			@JsonProperty("purchase_type") String purchase_type
			) {
		
		super();
		this.date = date;
		this.receipt_id = receipt_id;
		this.name = name;
		this.menu_name_kr = menu_name_kr;
		this.price = price;
		this.dc_price = dc_price;
		this.type = type;
		this.size = size;
		this.count = count;
		this.receipt_status = receipt_status;
		this.purchase_date = purchase_date;
		this.cancel_date = cancel_date;
		this.purchase_type = purchase_type;

		
	}

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getReceipt_id() {
		return receipt_id;
	}
	public void setReceipt_id(String receipt_id) {
		this.receipt_id = receipt_id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getMenu_name_kr() {
		return menu_name_kr;
	}
	public void setMenu_name_kr(String menu_name_kr) {
		this.menu_name_kr = menu_name_kr;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getDc_price() {
		return dc_price;
	}
	public void setDc_price(String dc_price) {
		this.dc_price = dc_price;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	public String getReceipt_status() {
		return receipt_status;
	}
	public void setReceipt_status(String receipt_status) {
		this.receipt_status = receipt_status;
	}
	
	public String getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}
	
	public String getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(String cancel_date) {
		this.cancel_date = cancel_date;
	}
	
	public String getPurchase_type() {
		return purchase_type;
	}
	public void setPurchase_type(String purchase_type) {
		this.purchase_type = purchase_type;
	}
	

}
