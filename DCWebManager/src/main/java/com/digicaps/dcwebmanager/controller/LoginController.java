package com.digicaps.dcwebmanager.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.digicaps.dcwebmanager.dto.LoginInfo;
import com.digicaps.dcwebmanager.dto.LoginSession;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.minidev.json.parser.JSONParser;

@Controller
public class LoginController {
	ModelAndView mav = new ModelAndView();

	LoginSession LoginSession = new LoginSession();
	
    @Value("${user_api_server.address}")
    String USER_API_SERVER_ADDRESS;
	
	@RequestMapping(value = "/login")
    public ModelAndView Login(ModelMap model, HttpServletRequest request){
		String resultPage = "login";
		HttpSession session = request.getSession(true);
		String user_id;
		String is_login = "";
		
		//session.getAttribute("user_id") != null
				
		if(session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();
			is_login = session.getAttribute("is_login").toString();			
		}
		if(is_login.equals("true")) {
			resultPage = "index";
			model.addAttribute("page_name","index");
			model.addAttribute("user_name",session.getAttribute("user_name").toString());
			
		}
		else
			resultPage = "login";
		mav.setViewName(resultPage);		
		
		
		return mav;

	}
	
    @RequestMapping( value = "/login_request", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity loginRequest(HttpServletRequest request) throws Exception{

        Map<String, Object> retMap = new HashMap<String, Object>();
        //retMap.put("result", "success");
        int res = 0;
        
        String user_id = request.getParameter("user_id");
        String user_pw = request.getParameter("user_pw");
        HttpSession session = request.getSession(true);
        
        
        
        /////////////////////////////////////////////////////
        RestTemplate template = new RestTemplate();
    	Map<String, String> mvm = new HashMap<String, String>();
    	
    	LoginInfo LoginInfo = new LoginInfo();
    	LoginInfo.setID(user_id);
    	LoginInfo.setPassword(user_pw);
    	
    	//String LoginSession = new LoginSession();


    		

		String tokenToJson = null;
		template.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		try {
			tokenToJson = new ObjectMapper().writeValueAsString(LoginInfo);
			
		} catch (JsonProcessingException e) {
			// TODO : ErrorCode 정의 할 것
			e.printStackTrace();
		}
		
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		
		HttpEntity<String> entity = new HttpEntity<String>(tokenToJson, headers);
		
    	
		String result;
		
		try{
			ResponseEntity<String> response = template.exchange(USER_API_SERVER_ADDRESS + "/api/login", HttpMethod.POST, entity, String.class);
			System.out.println("***** 응답 : " + response.getBody());
			//LoginSession = gson.fromJson(response.getBody(), com.digicaps.dcwebmanager.dto.LoginSession.class);
			//LoginSession.getAccessToken();
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> map = new HashMap<String, Object>(); map = mapper.readValue(response.getBody(), new TypeReference<Map<String, String>>(){});

			
			///
			/*
			JSONParser parser = new JSONParser();
			Object obj = parser.parse( response.getBody() );
			JSONObject jsonObj = (JSONObject) obj;
			*/
			
			//로그인 정상일 경우
			if(map.get("access_token") != null) {
				retMap.put("result", "success");

				
	        	session.setAttribute("user_id", user_id);
	        	session.setAttribute("is_login", "true");
				
	        	session.setAttribute("access_token", map.get("access_token").toString());
	        	session.setAttribute("expires_at", map.get("expires_at").toString());
	        	session.setAttribute("token_type", map.get("token_type").toString());
	        	System.out.println("** 로그인 결과 : " + map.get("access_token").toString() + ", " + map.get("expires_at").toString() + ", " + map.get("token_type").toString());
	        	
			}
			//비정상일 경우
			else {
				retMap.put("result", "fail");
				System.out.println("** 로그인에러 결과 : " + map.get("code").toString() + ", " + map.get("reason").toString());
			}
			
			
			res = 1;
		}catch(HttpClientErrorException e){
			res = 0;
			
			retMap.put("code", e.getStatusCode().toString());
			retMap.put("result", "fail");
			e.printStackTrace();
		}
		
        //////////////////////////////////////////////////////
        
        
        
        if(user_id.equals("admin") && user_pw.equals("abcd1234")) {
        	session.setAttribute("user_id", user_id);
        	session.setAttribute("is_login", "true");
        	session.setAttribute("user_name", "이태호");
        	
            retMap.put("result", "success");
            retMap.put("msg", "로그인에 성공하였습니다.");        	
        }
        else {
	        retMap.put("result", "fail");
	        retMap.put("msg", "아이디 및 암호가 일치하지 않습니다.");    
        }
 
        return ResponseEntity.ok(retMap);
    }

    
    
    
    
    
    
    public class adminLoginInfo {
    	private String ID;
    	private String Password;


    	public adminLoginInfo(){
    		
    	}
    	
    	public adminLoginInfo(@JsonProperty("ID") String id, 
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
    		return "adminLoginInfo [ID=" + ID + ", Password=" + Password + "]";
    	}

    }

}



