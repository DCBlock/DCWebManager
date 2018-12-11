package com.digicaps.dcwebmanager.service;

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.digicaps.dcwebmanager.dto.User;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

@Service
public class UserService {
	
	@Value("${user_api_server.address}")
	String API_SERVER_ADDRESS;
	
	public int RefistUserInfo(String email, String rfid, String name, String company, String leave) {
		int result = 0;
		
		RestTemplate restTemplate = new RestTemplate();
		String reqUrl = API_SERVER_ADDRESS + "/api/users";
		User User = new User();
		User.setEmail(email);
		User.setRfid(rfid);
		User.setName(name);
		User.setCompany(company);
		User.setLeave(leave);

		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		String tokenToJson = null;
		try {
			tokenToJson = new ObjectMapper().writeValueAsString(User);
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		//headers.put("Content-Type", Arrays.asList("application/json; charset=utf-8"));
		headers.put("Authorization", Arrays.asList("application/json; charset=utf-8"));
		HttpEntity<String> entity = new HttpEntity<String>(tokenToJson, headers);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.POST, entity, String.class);		
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<String, Object>(); 
		try {
			map = mapper.readValue(response.getBody(), new TypeReference<Map<String, String>>(){});
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	
		
		//정상일 경우
		if(map.get("code").toString().equals("200")) {
			result = 1;
		}		
		
		return result;
	}
	
	public int ModifyUserInfo(String index, String email, String rfid, String name, String company, String leave) {
		int result = 0;
		RestTemplate restTemplate = new RestTemplate();
		String reqUrl = API_SERVER_ADDRESS + "/api/users/" + index;
		User User = new User();
		User.setUindex(index);
		User.setEmail(email);
		User.setRfid(rfid);
		User.setName(name);
		User.setCompany(company);
		User.setLeave(leave);

		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		String tokenToJson = null;
		try {
			tokenToJson = new ObjectMapper().writeValueAsString(User);
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		//headers.put("Content-Type", Arrays.asList("application/json; charset=utf-8"));
		headers.put("Authorization", Arrays.asList("application/json; charset=utf-8"));
		HttpEntity<String> entity = new HttpEntity<String>(tokenToJson, headers);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.POST, entity, String.class);		
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<String, Object>(); 
		try {
			map = mapper.readValue(response.getBody(), new TypeReference<Map<String, String>>(){});
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	
		
		//정상일 경우
		if(map.get("code").toString().equals("200")) {
			result = 1;
		}
		
		return result;
	}
	
	public ArrayList<HashMap<String, String>> UserList(String page_num){
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();		
		

		//HttpHeaders headers = new HttpHeaders();
		//headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		//HttpEntity<String> entity = new HttpEntity<String>(headers);
		
		URI uri = URI.create(API_SERVER_ADDRESS + "/api/users/page/" + page_num);
		RestTemplate template = new RestTemplate();
		String responseString = new String();
		responseString = template.getForObject(uri, String.class);
		//System.out.println("***전체목록 불러오기 : " + responseString);
		
		//Users부분 분리
		/*
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<String, Object>(); 
		try {
			map = mapper.readValue(responseString, new TypeReference<Map<String, String>>(){});
			responseString = map.get("Users").toString();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		*/
		//UsersObject

		
		
		
		
		JSONParser parser = new JSONParser();

		ObjectMapper objectMapper = new ObjectMapper();
		TypeFactory typeFactory = objectMapper.getTypeFactory();


		try {
			JSONParser jsonParser = new JSONParser();
		    JSONObject jsonObj = (JSONObject) jsonParser.parse(responseString);
		    //JSONArray memberArray = (JSONArray) jsonObj.get("Users");

		    System.out.println("=====Users=====");
		    
		    try {
				List<User> someClassList = objectMapper.readValue(jsonObj.get("Users").toString(), typeFactory.constructCollectionType(List.class, User.class));
				for(int i = 0; i < someClassList.size(); i++) {
					//System.out.println("이게 돼나? 지금은 " + i + "번째");
					if(null == someClassList.get(i))
						break;
					list.add(addUserObjectList(someClassList.get(i)));
					
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    /*
		    for(int i=0 ; i<memberArray.size() ; i++){
		    	JSONObject tempObj = (JSONObject) memberArray.get(i);
		        System.out.println(""+(i+1)+"번째 멤버의 이름 : "+tempObj.get("name"));
		        System.out.println(""+(i+1)+"번째 멤버의 이메일 : "+tempObj.get("email"));
		        System.out.println(""+(i+1)+"번째 멤버의 나이 : "+tempObj.get("regdate"));
		        System.out.println("----------------------------");
		        
		        //tempObj.toJSONString();
		        
		    }
		    */

		    } catch (ParseException e) {
		    	// TODO Auto-generated catch block
		    	e.printStackTrace();
		 }
		 
			 
			
	 

			 /*
			List<User> someClassList = objectMapper.readValue(responseString3, typeFactory.constructCollectionType(List.class, User.class));
			
			for(int i = 0; i < someClassList.size(); i++) {
				System.out.println("지금은 " + i + "번째");
				if(null == someClassList.get(i))
					break;
				list.add(addUserObjectList(someClassList.get(i)));
				
			}
			*/
			
			//model.addAttribute("component_list", list);
			
			/*
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		*/
		
		return list;
	}
	
	public int pageStartPointCalcul(int pivot) {
		if(pivot%10 == 0)
			return (pivot-1)/10 * 10 + 1;
		return pivot/10 * 10 + 1;
	}
	public int pageEndPointCalcul(int pivot) {
		if(pivot%10 == 0)
			return ((pivot-1)/10 + 1) * 10;
		return (pivot/10 + 1) * 10;
	}	
	
    public static HashMap<String, String> addUserObjectList(User item){
    	
		HashMap<String, String> mapTMP = new HashMap<String, String>();
		/*
		    	private String ID;
    	private String PkgIDRef;
    	private String Name;
    	private String Description;
    	private String Version;
    	private String AvailableVersion;
    	private String State;
    	private String InstalledLocation;
    	private String ComponentType;
    	private String CreationDate;
    	private String ReleaseDate;
    	private String idx; 
		  
		 */
		mapTMP.put("company", item.getCompany().toString());
		mapTMP.put("email", item.getEmail().toString());
		mapTMP.put("uindex", item.getUindex().toString());
		mapTMP.put("leave", item.getLeave().toString());
		mapTMP.put("name", item.getName().toString());
		mapTMP.put("regdate", item.getRegdate().toString());
		mapTMP.put("rfid", item.getRfid().toString());
		mapTMP.put("updatedate", item.getupdatedate().toString());
		

		System.out.println("test:" + item.getCompany() + ", " + item.getRfid().toString());
		
		
		
		return mapTMP;
    }
    
    

	public class UsersObject {
		private String Users;
	
	
		public UsersObject(){
			
		}
		
		public UsersObject(@JsonProperty("Users") String Users) {
			super();
			this.Users = Users;
		}
	
		public String getUsers() {
			return Users;
		}
		public void setUsers(String Users) {
			this.Users = Users;
		}
	
	
		@Override
		public String toString() {
			return "User [Users=" + Users + "]";
		}
	
	}
	
}
