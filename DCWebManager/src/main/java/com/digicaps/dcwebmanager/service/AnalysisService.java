package com.digicaps.dcwebmanager.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
//			return "페이지가 유효하지 않습니다.";
			return "{\"name\":\"이태호\",\"total\":50000,\"dc_total\":21000,\"purchases\":[{\"code\":1,\"price\":2500,\"count\":3,\"dc_price\":1000,\"type\":\"HOT\",\"size\":\"REGULAR\",\"menu_name_kr\":\"에스프레소\",\"purchase_type\":0},{\"code\":3,\"price\":2000,\"count\":13,\"dc_price\":1000,\"type\":\"HOT\",\"size\":\"SMALL\",\"menu_name_kr\":\"아메리카노(소)\",\"purchase_type\":0},{\"code\":5,\"price\":3300,\"count\":5,\"dc_price\":1000,\"type\":\"HOT\",\"size\":\"REGULAR\",\"menu_name_kr\":\"바닐라라떼\",\"purchase_type\":0}]}";
		}
		//if(response.getStatusCodeValue() != 200)
		//	return "페이지가 유효하지 않습니다.";
		
		//{"name":"이태호","total":50000,"dc_total":21000,"purchases":[{"code":1,"price":2500,"count":3,"dc_price":1000,"type":"HOT","size":"REGULAR","menu_name_kr":"에스프레소","purchase_type":0},{"code":3,"price":2000,"count":13,"dc_price":1000,"type":"HOT","size":"SMALL","menu_name_kr":"아메리카노(소)","purchase_type":0},{"code":5,"price":3300,"count":5,"dc_price":1000,"type":"HOT","size":"REGULAR","menu_name_kr":"바닐라라떼","purchase_type":0}]}

		return res.replace("\n", "");
	}
	
	
	
}
