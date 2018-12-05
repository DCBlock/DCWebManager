package com.digicaps.dcwebmanager.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class LoginInfo {
	private String ID;
	private String Password;


	public LoginInfo(){
		
	}
	
	public LoginInfo(@JsonProperty("ID") String id, 
			@JsonProperty("Password") String password) {
		super();
		this.ID = id;
		this.Password = password;
	}

	public String getID() {
		return ID;
	}

	public void setID(String id) {
		this.ID = id;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		this.Password = password;
	}


	@Override
	public String toString() {
		return "LoginInfo [ID=" + ID + ", Password=" + Password + "]";
	}
}
