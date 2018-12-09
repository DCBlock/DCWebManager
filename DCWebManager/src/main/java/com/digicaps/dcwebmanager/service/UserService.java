package com.digicaps.dcwebmanager.service;

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.digicaps.dcwebmanager.dto.User;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

@Service
public class UserService {
	@Value("${api_server.address}")
	String API_SERVER_ADDRESS;
	
	public ArrayList<HashMap<String, String>> UserList(String page_num){
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();		
		
		URI uri = URI.create(API_SERVER_ADDRESS + "/api/users/page/" + page_num);
		RestTemplate template = new RestTemplate();
		String responseString = new String();
		responseString = template.getForObject(uri, String.class);
		System.out.println("***전체목록 불러오기 : " + responseString);
		
		//Users부분 분리
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<String, Object>(); 
		try {
			map = mapper.readValue(responseString, new TypeReference<Map<String, String>>(){});
			responseString = map.get("Users").toString();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		ObjectMapper objectMapper = new ObjectMapper();
		TypeFactory typeFactory = objectMapper.getTypeFactory();
		try {
			List<User> someClassList = objectMapper.readValue(responseString, typeFactory.constructCollectionType(List.class, User.class));
			
			
			for(int i = 0; i < someClassList.size(); i++) {
				System.out.println("지금은 " + i + "번째");
				if(null == someClassList.get(i))
					break;
				list.add(addUserObjectList(someClassList.get(i)));
				//System.out.println("사이즈 정보 : " + someClassList.size());
				//System.out.println("모든내용 정보 : " + someClassList.toString());
				
			}
			
			//model.addAttribute("component_list", list);
			
			
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
		
		return list;
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
		mapTMP.put("index", item.getIndex().toString());
		mapTMP.put("leave", item.getLeave().toString());
		mapTMP.put("name", item.getName().toString());
		mapTMP.put("regdate", item.getRegdate().toString());
		mapTMP.put("rfid", item.getRfid().toString());
		mapTMP.put("updatedate", item.getupdatedate().toString());
		

		System.out.println("test:" + item.getCompany() + ", " + item.getRfid().toString());
		
		
		
		return mapTMP;
    }
	
}
