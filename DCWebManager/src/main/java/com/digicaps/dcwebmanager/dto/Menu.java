package com.digicaps.dcwebmanager.dto;

import java.util.HashMap;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Menu {
	/*
	             "category": 100,
            "code": 1,
            "name_kr": "에스프레소",
            "name_en": "espreso",
            "price": 2500,
            "dc_digicap": 0,
            "dc_covision": 0,
            "event_name": "",
            "type": "HOT",
            "size": "REGULAR"
	 */
	private String category;
	private String code;
	private String name_kr;
	private String name_en;
	private String price;
	private String dc_digicap;
	private String dc_covision;
	private HashMap<String, String> discounts;
	private String event_name;
	private String type;
	private String size;

	public Menu(){
		
	}
	
	public Menu(@JsonProperty("category") String category,
			@JsonProperty("code") String code,
			@JsonProperty("name_kr") String name_kr,
			@JsonProperty("name_en") String name_en,
			@JsonProperty("price") String price,
			//@JsonProperty("dc_digicap") String dc_digicap,
			//@JsonProperty("dc_covision") String dc_covision,
			@JsonProperty("event_name") String event_name,
			@JsonProperty("type") String type,
			@JsonProperty("size") String size,
			@JsonProperty("discounts") HashMap<String, String> discounts
			) {
		
		super();
		this.category = category;
		this.code = code;
		this.name_kr = name_kr;
		this.name_en = name_en;
		this.price = price;
		//this.dc_digicap = dc_digicap;
		//this.dc_covision = dc_covision;
		this.event_name = event_name;
		this.type = type;
		this.size = size;
		this.discounts = discounts;
		
	}

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public HashMap<String, String> getDiscounts() {
		return discounts;
	}
	public void setDiscounts(HashMap<String, String> discounts) {
		this.discounts = discounts;
	}
	

	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public String getName_kr() {
		return name_kr;
	}
	public void setName_kr(String name_kr) {
		this.name_kr = name_kr;
	}

	public String getName_en() {
		return name_en;
	}
	public void setName_en(String name_en) {
		this.name_en = name_en;
	}

	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

	public String getDc_digicap() {
		return dc_digicap;
	}
	public void setDc_digicap(String dc_digicap) {
		this.dc_digicap = dc_digicap;
	}

	public String getDc_covision() {
		return dc_covision;
	}
	public void setDc_covision(String dc_covision) {
		this.dc_covision = dc_covision;
	}

	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
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





}
