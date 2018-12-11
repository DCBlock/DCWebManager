package com.digicaps.dcwebmanager.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Category {
	private String name;
	private String code;
	private String order;

	public Category(){
		
	}
	
	public Category(@JsonProperty("name") String name,
			@JsonProperty("code") String code,
			@JsonProperty("order") String order
			) {
		
		super();
		this.name = name;
		this.code = code;
		this.order = order;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	




}
