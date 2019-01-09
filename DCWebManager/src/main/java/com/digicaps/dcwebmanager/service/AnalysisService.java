package com.digicaps.dcwebmanager.service;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.digicaps.dcwebmanager.dto.Bill;
import com.digicaps.dcwebmanager.dto.CancelOrder;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

@Service
public class AnalysisService {
	
	@Value("${cafe_api_server.address}")
	String CAFE_API_SERVER_ADDRESS;

	public List<Bill> getBillList(String token, String type, String s_date, String e_date){
		List<Bill> list = new ArrayList<Bill>();		
		RestTemplate restTemplate = new RestTemplate();
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/settlement/reports?before="+s_date+"&after="+e_date;
	
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());


		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", type + " " + token);
		HttpEntity<String> entity = new HttpEntity<String>(headers);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.GET, entity, String.class);		
		System.out.println("정산서목록 : " + response.getBody().toString());

		//JSON
		ObjectMapper objectMapper = new ObjectMapper();
		TypeFactory typeFactory = objectMapper.getTypeFactory();
		try {
			List<Bill> someClassList = objectMapper.readValue(response.getBody(), typeFactory.constructCollectionType(List.class, Bill.class));//response.getBody()
			list = someClassList;
		}catch (JsonParseException e) {
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
	
	
	public String getBillOneUserList(String token, String type, String s_date, String e_date, String user_index){
		List<Bill> list = new ArrayList<Bill>();		
		RestTemplate restTemplate = new RestTemplate();
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/settlement/report?before="+s_date+"&after="+e_date+"&user_index=" + user_index;
	
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());


		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", type + " " + token);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		System.out.println("왜죠 : " + reqUrl);
		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.GET, entity, String.class);		
		System.out.println("개인정산서목록 : " + response.getBody().toString());

		
		
		return response.getBody().toString();
	}
	
	
	public String myOrder(String token){
		RestTemplate restTemplate = new RestTemplate();
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/purchases/temporary/" + token;
		String res = "";
		try {
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

		System.out.println("토큰 : " + token);
		HttpHeaders headers = new HttpHeaders();
		//headers.setContentType(MediaType.APPLICATION_JSON);
		//headers.add("Authorization", type + " " + token);
		HttpEntity<String> entity = new HttpEntity<String>(headers);
		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.GET, entity, String.class);		
		System.out.println("개인정산서목록 : " + response.getBody().toString());
		res = response.getBody().toString();
		}
		catch(HttpClientErrorException e){
			return "페이지가 유효하지 않습니다.";
//			return "{\"name\":\"이태호\",\"total\":50000,\"dc_total\":21000,\"purchases\":[{\"code\":1,\"price\":2500,\"count\":3,\"dc_price\":1000,\"type\":\"HOT\",\"size\":\"REGULAR\",\"menu_name_kr\":\"에스프레소\",\"purchase_type\":0},{\"code\":3,\"price\":2000,\"count\":13,\"dc_price\":1000,\"type\":\"HOT\",\"size\":\"SMALL\",\"menu_name_kr\":\"아메리카노(소)\",\"purchase_type\":0},{\"code\":5,\"price\":3300,\"count\":5,\"dc_price\":1000,\"type\":\"HOT\",\"size\":\"REGULAR\",\"menu_name_kr\":\"바닐라라떼\",\"purchase_type\":0}]}";
		}
		//if(response.getStatusCodeValue() != 200)
		//	return "페이지가 유효하지 않습니다.";
		
		//{"name":"이태호","total":50000,"dc_total":21000,"purchases":[{"code":1,"price":2500,"count":3,"dc_price":1000,"type":"HOT","size":"REGULAR","menu_name_kr":"에스프레소","purchase_type":0},{"code":3,"price":2000,"count":13,"dc_price":1000,"type":"HOT","size":"SMALL","menu_name_kr":"아메리카노(소)","purchase_type":0},{"code":5,"price":3300,"count":5,"dc_price":1000,"type":"HOT","size":"REGULAR","menu_name_kr":"바닐라라떼","purchase_type":0}]}

		return res.replace("\n", "");
	}
	
	
	

	public List<CancelOrder> getCustomerOrderList(String token, String type, String s_date, String e_date, int page, int per_page) {
		
		List<CancelOrder> list = new ArrayList<CancelOrder>();		
		
		
		RestTemplate restTemplate = new RestTemplate();
		
		
		String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/purchases/purchase/search?before="+s_date+"&after="+e_date+"&filter=3&page="+page+"&per_page="+per_page;
		//String reqUrl = CAFE_API_SERVER_ADDRESS + "/api/caffe/purchases/purchase/search?before=1545004800&after=1545058800&filter=3";
		
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());


		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", type + " " + token);
		HttpEntity<String> entity = new HttpEntity<String>(headers);

		ResponseEntity<String> response = restTemplate.exchange(reqUrl, HttpMethod.GET, entity, String.class);		
		System.out.println("취소주문목록 : " + response.getBody().toString());

		
		///////////////////////JSON 영역/////////////////////////////////

		try {
			//lists항목만 분리시키고싶다
			ObjectMapper objectMapper = new ObjectMapper();
			TypeFactory typeFactory = objectMapper.getTypeFactory();

			JSONParser jsonParser = new JSONParser();
		    JSONObject jsonObj;
			//try {
			jsonObj = (JSONObject) jsonParser.parse(response.getBody().toString());
			
		    
			//
			//response.getBody() 대신 jsonObj.get("Users").toString()을 넣어보자
			List<CancelOrder> someClassList = objectMapper.readValue(jsonObj.get("list").toString(), typeFactory.constructCollectionType(List.class, CancelOrder.class));//response.getBody()
			String to_count = jsonObj.get("total_pages").toString();

			
			double date_buff = -1;
			double receipt_id_buff = -1;
			double date_buff_for_receipt_id = -1;
			int date_counter = 0;
			int receipt_id_counter = 0;
			int j_start_point = 0;
			int k_start_point = 0;
			
			for(int i = 0; i < someClassList.size(); i++) {
				someClassList.get(i).setTotal_count(to_count);
				

				
				//날짜 세팅
				String date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date (Long.parseLong(someClassList.get(i).getDate())*1000));
				someClassList.get(i).setTdate(date);
				
				String date2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date (Long.parseLong(someClassList.get(i).getCancel_date())*1000));
				System.out.println("년도 테스트 : " + date2 + ", ㅇㅇ : " + someClassList.get(i).getCancel_date());
				someClassList.get(i).setCancel_date(date2);

				String date3 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date (Long.parseLong(someClassList.get(i).getPurchase_date())*1000));
				someClassList.get(i).setTpurchase_date(date3);
				
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
		}catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
}
