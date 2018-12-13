package com.digicaps.dcwebmanager.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.digicaps.dcwebmanager.dto.Category;
import com.digicaps.dcwebmanager.dto.Menu;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

@Service
public class CafeService {

	@Value("${cafe_api_server.address}")
	String CAFE_API_SERVER_ADDRESS;
	
	
	public List<Category> getCategoryList(String token, String type) {
		//ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();		
		List<Category> list = new ArrayList<Category>();		
		
		
		RestTemplate restTemplate = new RestTemplate();
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/categories";
		
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		/*
		String tokenToJson = null;
		try {
			tokenToJson = new ObjectMapper().writeValueAsString(User);
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		*/

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", type + " " + token);
		HttpEntity<String> entity = new HttpEntity<String>(headers);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.GET, entity, String.class);		
		System.out.println("카테고리당" + response.getBody().toString());

		
		///////////////////////JSON 영역/////////////////////////////////
		ObjectMapper objectMapper = new ObjectMapper();
		TypeFactory typeFactory = objectMapper.getTypeFactory();
		try {
			List<Category> someClassList = objectMapper.readValue(response.getBody(), typeFactory.constructCollectionType(List.class, Category.class));
			list = someClassList;
			/*
			for(int i = 0; i < someClassList.size(); i++) {
				System.out.println("지금은 " + i + "번째");
				if(null == someClassList.get(i))
					break;
				list.add(addPackageObjectList(someClassList.get(i)));
				
			}
			*/
			
			//model.addAttribute("package_list", list);
			
			
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
	
	
	public List<Menu> getMenuList(String token, String type, List<Category> CateList) {
		//ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();		
		List<Menu> list = new ArrayList<Menu>();
		
		RestTemplate restTemplate = new RestTemplate();
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/menus";
		
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());


		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", type + " " + token);
		HttpEntity<String> entity = new HttpEntity<String>(headers);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.GET, entity, String.class);		
		System.out.println("메뉴당" + response.getBody().toString());

		//////////////////JSON영역///////////////////////////
		for(int i = 0; i < CateList.size(); i++) {
			ObjectMapper objectMapper = new ObjectMapper();
			TypeFactory typeFactory = objectMapper.getTypeFactory();
			try {
				JSONParser jsonParser = new JSONParser();
			    JSONObject jsonObj = (JSONObject) jsonParser.parse(response.getBody());
			    //JSONArray memberArray = (JSONArray) jsonObj.get("Users");
	
			    
			    try {
					//List<Menu> someClassList = 
					list.addAll(objectMapper.readValue(jsonObj.get(CateList.get(i).getName().toString()).toString(), typeFactory.constructCollectionType(List.class, Menu.class)));
					//someClassList.addAll(c)
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			   } catch (ParseException e) {
			    	// TODO Auto-generated catch block
			    	e.printStackTrace();
			 }
		}
		
		
		return list;
	}
	
	public int modifyCategories(String token, String type, String CategoriesStr) {
		int result = 0;
		List<Category> list = new ArrayList<Category>();
		System.out.println("아 왜 : " + CategoriesStr);
		//CategoriesStr = CategoriesStr.replace("\"", "\\\"");
		//System.out.println("아 왜2 : " + CategoriesStr);
		HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
		//ClientHttpRequestFactory httpRequestFactory =  new HttpComponentsClientHttpRequestFactory();

		RestTemplate restTemplate = new RestTemplate(requestFactory);
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/categories";
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		//headers.put("Content-Type", Arrays.asList("application/json; charset=utf-8"));
		headers.add("Authorization", type + " " + token);
		//headers.put("Authorization", Arrays.asList("application/json; charset=utf-8"));
		

        
        
		HttpEntity<String> entity = new HttpEntity<String>(CategoriesStr, headers);
		

		//requestFactory.setConnectTimeout(TIMEOUT);
		//requestFactory.setReadTimeout(TIMEOUT);
		
		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.PATCH, entity, String.class);		
		System.out.println(response.getBody());
/*
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<String, Object>(); 
		try {
			map = mapper.readValue(response.getBody(), new TypeReference<Map<String, String>>(){});
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
*/
		//정상일 경우
		if(response.getStatusCodeValue() == 200) {
			result = 1;
		}
		else
			result = 0;
		
		return result;
	}
	
	
}
