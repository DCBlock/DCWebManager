package com.digicaps.dcwebmanager.service;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.digicaps.dcwebmanager.dto.CancelOrder;
import com.digicaps.dcwebmanager.dto.Category;
import com.digicaps.dcwebmanager.dto.Menu;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

@Service
public class CafeService {

	@Value("${cafe_api_server.address}")
	String CAFE_API_SERVER_ADDRESS;
	
	
	
	public List<CancelOrder> getCancelOrderList(String token, String type, String s_date, String e_date) {
		
		List<CancelOrder> list = new ArrayList<CancelOrder>();		
		
		
		RestTemplate restTemplate = new RestTemplate();
		
		
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/purchases/purchase/search?before="+s_date+"&after="+e_date+"&filter=3";
		//String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/purchases/purchase/search?before=1545004800&after=1545058800&filter=3";
		
		
		/*
		String testJSON = "[\r\n" + 
				"    {\r\n" + 
				"        \"date\": 1544437417801,\r\n" + 
				"        \"receipt_id\": 1,\r\n" + 
				"        \"menu_name_kr\": \"에스프레소\",\r\n" + 
				"        \"price\": 2500,\r\n" + 
				"        \"dc_price\": 0,\r\n" + 
				"        \"type\": \"HOT\",\r\n" + 
				"        \"size\": \"REGULAR\",\r\n" + 
				"        \"count\": 5,\r\n" + 
				"        \"receipt_status\": 1,\r\n" + 
				"        \"purchase_date\": 1544437313144,\r\n" + 
				"        \"cancel_date\": 1544437417801\r\n" + 
				"    },\r\n" + 
				"    {\r\n" + 
				"        \"date\": 1544437417801,\r\n" + 
				"        \"receipt_id\": 1,\r\n" + 
				"        \"menu_name_kr\": \"인디안 차이라떼\",\r\n" + 
				"        \"price\": 3000,\r\n" + 
				"        \"dc_price\": 0,\r\n" + 
				"        \"type\": \"HOT\",\r\n" + 
				"        \"size\": \"REGULAR\",\r\n" + 
				"        \"count\": 1,\r\n" + 
				"        \"receipt_status\": 1,\r\n" + 
				"        \"purchase_date\": 1544437313147,\r\n" + 
				"        \"cancel_date\": 1544437417801\r\n" + 
				"    },\r\n" + 
				"    {\r\n" + 
				"        \"date\": 1543826130280,\r\n" + 
				"        \"receipt_id\": 4,\r\n" + 
				"        \"menu_name_kr\": \"에스프레소\",\r\n" + 
				"        \"price\": 2500,\r\n" + 
				"        \"dc_price\": 0,\r\n" + 
				"        \"type\": \"HOT\",\r\n" + 
				"        \"size\": \"REGULAR\",\r\n" + 
				"        \"count\": 5,\r\n" + 
				"        \"receipt_status\": 2,\r\n" + 
				"        \"purchase_date\": 1543821578827,\r\n" + 
				"        \"cancel_date\": 1543821615786\r\n" + 
				"    },\r\n" + 
				"    {\r\n" + 
				"        \"date\": 1543826130280,\r\n" + 
				"        \"receipt_id\": 4,\r\n" + 
				"        \"menu_name_kr\": \"인디안 차이라떼\",\r\n" + 
				"        \"price\": 3000,\r\n" + 
				"        \"dc_price\": 0,\r\n" + 
				"        \"type\": \"ICED\",\r\n" + 
				"        \"size\": \"SMALL\",\r\n" + 
				"        \"count\": 1,\r\n" + 
				"        \"receipt_status\": 2,\r\n" + 
				"        \"purchase_date\": 1543821578830,\r\n" + 
				"        \"cancel_date\": 1543821615786\r\n" + 
				"    }\r\n" + 
				"]";
*/
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());


		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", type + " " + token);
		HttpEntity<String> entity = new HttpEntity<String>(headers);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.GET, entity, String.class);		
		System.out.println("취소주문목록 : " + response.getBody().toString());

		
		///////////////////////JSON 영역/////////////////////////////////
		ObjectMapper objectMapper = new ObjectMapper();
		TypeFactory typeFactory = objectMapper.getTypeFactory();
		try {
			List<CancelOrder> someClassList = objectMapper.readValue(response.getBody(), typeFactory.constructCollectionType(List.class, CancelOrder.class));//response.getBody()
			

			
			double date_buff = -1;
			double receipt_id_buff = -1;
			double date_buff_for_receipt_id = -1;
			int date_counter = 0;
			int receipt_id_counter = 0;
			int j_start_point = 0;
			int k_start_point = 0;
			
			for(int i = 0; i < someClassList.size(); i++) {
				if(i == 0) {
					date_buff = Double.parseDouble(someClassList.get(i).getDate());
					receipt_id_buff = Double.parseDouble(someClassList.get(i).getReceipt_id());
					date_counter = 1;
					receipt_id_counter = 1;
					date_buff_for_receipt_id = date_buff;
					
					someClassList.get(i).setRowspan("1");
					someClassList.get(i).setRowspanreceipt("1");
				}
				else if(i != 0 && date_buff == Double.parseDouble(someClassList.get(i).getDate())) {
					date_counter++;
					
				}
				else{//(date_buff != Double.parseDouble(someClassList.get(i).getDate()))
					for(int j = j_start_point; j < i ; j++) {
						someClassList.get(j).setData_cnt(date_counter);
						
					}
					//초기화 
					someClassList.get(i).setRowspan("1");
					j_start_point = i;
					
					date_buff = Double.parseDouble(someClassList.get(i).getDate());
					date_counter = 1;
				}
				
				
				
				if(i != 0 && receipt_id_buff == Double.parseDouble(someClassList.get(i).getReceipt_id())) {//영수증 아이디가 동일함
					if(date_buff_for_receipt_id == date_buff) {	//근데 날짜도 동일함
						
						receipt_id_counter++;	//추가
					}
					else {	//근데 날짜가 다름.. 그럼 영수아이디가 같아보았자 서로 다른 것임.. 반영 후 카운터 초기화
						
						for(int k = k_start_point; k < i ; k++) {
							someClassList.get(k).setReceipt_id_cnt(receipt_id_counter);
						}
						
						//초기화
						someClassList.get(i).setRowspanreceipt("1");
						receipt_id_buff = Double.parseDouble(someClassList.get(i).getReceipt_id());
						k_start_point = i;
						date_buff_for_receipt_id = date_buff;
						receipt_id_counter = 1;
					}
				}
				else {//다른 영수증 id로 바뀜
					
					for(int k = k_start_point; k < i ; k++) {
						someClassList.get(k).setReceipt_id_cnt(receipt_id_counter);
					}
					
					//초기화
					someClassList.get(i).setRowspanreceipt("1");
					receipt_id_buff = Double.parseDouble(someClassList.get(i).getReceipt_id());
					k_start_point = i;
					date_buff_for_receipt_id = date_buff;
					receipt_id_counter = 1;
				}
				
				//날짜 세팅
				String date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date (Long.parseLong(someClassList.get(i).getDate())*1000));
				someClassList.get(i).setTdate(date);
				
				String date2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date (Long.parseLong(someClassList.get(i).getCancel_date())*1000));
				System.out.println("년도 테스트 : " + date2 + ", ㅇㅇ : " + someClassList.get(i).getCancel_date());
				someClassList.get(i).setCancel_date(date2);

				String date3 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date (Long.parseLong(someClassList.get(i).getPurchase_date())*1000));
				someClassList.get(i).setPurchase_date(date3);
				
				if(someClassList.get(i).getCanceled_date().equals("0"))
					someClassList.get(i).setCanceled_date("-");
				else {
					String date4 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date (Long.parseLong(someClassList.get(i).getCanceled_date())*1000));
					someClassList.get(i).setCanceled_date(date4);
				}
			}
			
			for(int j = j_start_point; j < someClassList.size() ; j++) {
				someClassList.get(j).setData_cnt(date_counter);
				
			}
			for(int k = k_start_point; k <  someClassList.size(); k++) {
				someClassList.get(k).setReceipt_id_cnt(receipt_id_counter);
			}
			
			
			
			for(int l = 0; l < someClassList.size(); l++) {
				System.out.println("출력테스트 : " + someClassList.get(l).getData_cnt() + ", " + someClassList.get(l).getReceipt_id_cnt() + ", 날짜  : " + someClassList.get(l).getDate());
				
			}
			//model.addAttribute("package_list", list);
			
			list = someClassList;
			
			
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
		
		restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));


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
		//CategoriesStr = CategoriesStr.replace("\"", "\\\"");
		//System.out.println("아 왜2 : " + CategoriesStr);
		HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
		//ClientHttpRequestFactory httpRequestFactory =  new HttpComponentsClientHttpRequestFactory();

		RestTemplate restTemplate = new RestTemplate(requestFactory);
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/categories";
		restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", type + " " + token);
        
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
	
	public int registCategories(String token, String type, String cate_name) {
		int result = 0;
		cate_name = cate_name.replace("\r\n", "");
		//cate_name = "{\"name\" : \""+cate_name+"\"}";
		//HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
		RestTemplate restTemplate = new RestTemplate();
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/categories";
		restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		System.out.println("혹시? : " + cate_name);
		HttpHeaders headers = new HttpHeaders();
		//headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON_UTF8));
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", type + " " + token);
		HttpEntity<String> entity = new HttpEntity<String>(cate_name, headers);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.POST, entity, String.class);		
		System.out.println(response.getBody());

		//정상일 경우
		if(response.getStatusCodeValue() == 200) {
			result = 1;
		}
		else
			result = 0;
		
		return result;		
	}
	
	public int deleteCategories(String token, String type, String cate_code) {
		int result = 0;
		//cate_name = cate_name.replace("\r\n", "");
		//cate_name = "{\"name\" : \""+cate_name+"\"}";
		HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
		RestTemplate restTemplate = new RestTemplate(requestFactory);
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/categories/" + cate_code;
		restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", type + " " + token);
		HttpEntity<String> entity = new HttpEntity<String>(headers);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.DELETE, entity, String.class);		
		System.out.println(response.getBody());

		//정상일 경우
		if(response.getStatusCodeValue() == 200) {
			result = 1;
		}
		else
			result = 0;
		
		return result;		
	}
	
	public int modifyMenus(String token, String type, String MenusStr, String code) {
		int result = 0;
		MenusStr = MenusStr.replace("\r\n", "");
		HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
		
		RestTemplate restTemplate = new RestTemplate(requestFactory);
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/menus/" + code;
		//restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		
		
		HttpHeaders headers = new HttpHeaders();
		//headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAcceptCharset(Arrays.asList(Charset.forName("UTF-8")));
		//headers.add("Content-Type", "application/json;charset=UTF-8");
		//headers.add("Authorization", type + " " + token);
		
		HttpEntity<String> entity = new HttpEntity<String>(MenusStr, headers);
		System.out.println("여기로 요청할거다 : " + reqUrl);
		System.out.println("데이터는 이거다  : " + MenusStr);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.PATCH, entity, String.class);		
		System.out.println(response.getBody());

		//정상일 경우
		if(response.getStatusCodeValue() == 200) {
			result = 1;
		}
		else
			result = 0;
		
		return result;
	}
	
	public int registMenus(String token, String type, String json_data) {
		int result = 0;
		json_data = json_data.replace("\r\n", "");
		//cate_name = "{\"name\" : \""+cate_name+"\"}";
		//HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
		RestTemplate restTemplate = new RestTemplate();
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/menus";
		restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		System.out.println("혹시? : " + json_data);
		HttpHeaders headers = new HttpHeaders();
		//headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON_UTF8));
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", type + " " + token);
		HttpEntity<String> entity = new HttpEntity<String>(json_data, headers);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.POST, entity, String.class);		
		System.out.println(response.getBody());

		//정상일 경우
		if(response.getStatusCodeValue() == 200) {
			result = 1;
		}
		else
			result = 0;
		
		return result;		
	}
	
	
	public int deleteMenus(String token, String type, String cate_code, String menu_code) {
		int result = 0;
		//cate_name = cate_name.replace("\r\n", "");
		//cate_name = "{\"name\" : \""+cate_name+"\"}";
		HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
		RestTemplate restTemplate = new RestTemplate(requestFactory);
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/menus/" + cate_code + "/" + menu_code;
		restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", type + " " + token);
		HttpEntity<String> entity = new HttpEntity<String>(headers);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.DELETE, entity, String.class);		
		System.out.println(response.getBody());

		//정상일 경우
		if(response.getStatusCodeValue() == 200) {
			result = 1;
		}
		else
			result = 0;
		
		return result;		
	}
	
	
	
}
