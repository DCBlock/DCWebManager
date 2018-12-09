package com.digicaps.dcwebmanager.dto;

import com.fasterxml.jackson.annotation.JsonProperty;


public class User {
	private String index;
	private String email;
	private String rfid;
	private String name;
	private String company;
	private String leave;
	private String regdate;
	private String updatedate;

	public User(){
		
	}
	
	public User(@JsonProperty("index") String index, 
			@JsonProperty("email") String email,
			@JsonProperty("rfid") String rfid,
			@JsonProperty("name") String name,
			@JsonProperty("company") String company,
			@JsonProperty("leave") String leave,
			@JsonProperty("regdate") String regdate,
			@JsonProperty("updatedate") String updatedate) {
		super();
		this.index = index;
		this.email = email;
		this.rfid = rfid;
		this.name = name;
		this.company = company;
		this.leave = leave;
		this.regdate = regdate;
		this.updatedate = updatedate;
	}

	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getRfid() {
		return rfid;
	}
	public void setRfid(String rfid) {
		this.rfid = rfid;
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
	
	public String getLeave() {
		return leave;
	}
	public void setLeave(String leave) {
		this.leave = leave;
	}

	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	
	public String getupdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}



	@Override
	public String toString() {
		return "User [index=" + index + ", email=" + email + ", rfid="+rfid+", name="+name+", company="+company+", leave="+leave+", regdate="+regdate+", updatedate="+updatedate+"]";
	}

}