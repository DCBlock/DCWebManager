package com.digicaps.dcwebmanager.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class LoginSession {
	private String code;
	private String reason;
	
	private String access_token;
	private String expires_at;
	private String token_type;


	public LoginSession(){
		
	}
	
	public LoginSession(@JsonProperty("code") String code, 
			@JsonProperty("reason") String reason,
			
			@JsonProperty("access_token") String access_token,
			@JsonProperty("expires_at") String expires_at,
			@JsonProperty("token_type") String token_type) {
		
		super();
		this.code = code;
		this.reason = reason;
		this.access_token = access_token;
		this.expires_at = expires_at;
		this.token_type = token_type;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	
	public String getAccessToken() {
		return access_token;
	}

	public void setAccessToken(String access_token) {
		this.access_token = access_token;
	}	

	public String getExpiresAt() {
		return expires_at;
	}

	public void setExpiresAt(String expires_at) {
		this.expires_at = expires_at;
	}
	
	public String getTokenType() {
		return token_type;
	}

	public void setTokenType(String token_type) {
		this.token_type = token_type;
	}
	
	
	@Override
	public String toString() {
		return "LoginSession [code=" + code + ", reason=" + reason + ", access_token=" + access_token + ", expires_at=" + expires_at + ", token_type=" + token_type + "]";
	}
}
