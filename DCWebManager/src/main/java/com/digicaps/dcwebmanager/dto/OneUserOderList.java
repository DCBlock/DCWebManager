package com.digicaps.dcwebmanager.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class OneUserOderList {
	private String date;


	public OneUserOderList(){
		
	}
	
	public OneUserOderList(@JsonProperty("date") String date
			) {
		
		super();
		this.date = date;

		
	}

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	

	

}
