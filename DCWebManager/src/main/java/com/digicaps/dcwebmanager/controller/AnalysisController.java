package com.digicaps.dcwebmanager.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.digicaps.dcwebmanager.dto.Bill;
import com.digicaps.dcwebmanager.dto.CustomerBill;
import com.digicaps.dcwebmanager.service.AnalysisService;

@Controller
public class AnalysisController {
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	AnalysisService analysisService;
	
	
	@RequestMapping(value = "/customer_bill", method = RequestMethod.GET)
    public ModelAndView customerBillList(ModelMap model, HttpServletRequest request) throws Exception{
		String resultPage = "customer_bill";
		model.addAttribute("page_name",resultPage);
		/*
		HttpSession session = request.getSession(true);
		String user_id;
		String is_login = "";
		if(session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();
			is_login = session.getAttribute("is_login").toString();			
		}
		if(is_login.equals("true")) {
			resultPage = "cancel_order_manage";
			model.addAttribute("page_name", resultPage);
			model.addAttribute("user_name",session.getAttribute("user_name").toString());
		}
		else
			resultPage = "login";
		*/
		model.addAttribute("page_name", resultPage);
		HttpSession session = request.getSession(true);
		String s_date = "";
		String e_date = "";
		long epoch_start = 0;
		long epoch_end = 0;
		int page = 1;
		int per_page = 10;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").toString());
		}

		model.addAttribute("user_name",session.getAttribute("user_id").toString());
		if(request.getParameter("start_date") != null && request.getParameter("end_date") != null) {
			try {
				epoch_start = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start_date").toString()).getTime() / 1000;
				epoch_end = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end_date").toString() + " 23:59:59").getTime() / 1000;
				s_date = Long.toString(epoch_start);
				e_date = Long.toString(epoch_end);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			model.addAttribute("start_date", request.getParameter("start_date").toString());
			model.addAttribute("end_date", request.getParameter("end_date").toString());
			
		}
		else {
			//날짜 계산
			Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
			String today = "";
			String today_end = "";
			
			String today_end2 = "";
			//오늘날짜 가져오기
			today += calendar.get(calendar.YEAR) + "-";
			int month = calendar.get(calendar.MONTH)+1;
			int day = calendar.get(calendar.DAY_OF_MONTH);
			today += (month < 10 ? "0"+month : month)  + "-";

			
			today_end = today + "01";
			today_end2 = today;
			today += day < 10 ? "0"+day : day;

			
			//해당월의 마지막 날짜 가져오기
			calendar.set(calendar.get(calendar.YEAR), calendar.get(calendar.MONTH), calendar.get(calendar.DAY_OF_MONTH));

			int lastDay = calendar.getActualMaximum(Calendar.DATE);
			today_end2 += lastDay;
			try {
				epoch_start = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(today_end).getTime() / 1000;
				epoch_end = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(today_end2 + " 23:59:59").getTime() / 1000;
				
				s_date = Long.toString(epoch_start);
				e_date = Long.toString(epoch_end);
				
				model.addAttribute("start_date", today_end);
				model.addAttribute("end_date", today_end2);
				
				
			} catch (java.text.ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			System.out.println("* 날짜 정보 : " + today + ", 막날정보 : " + lastDay + "zz " + epoch_start + ". " + epoch_end);
			
		}
		
		List<CustomerBill> customer_bill_list = analysisService.getCustomerOrderList(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), s_date, e_date, page, per_page);
		HashMap<String, String> customer_order_calcul = analysisService.getCustomerOrderCalcul(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), s_date, e_date);
		
		/*
		
		for(int i = 0; i < cancel_list.size(); i++) {
			
		}
		*/
		model.addAttribute("pageStartPointCalcul", analysisService.pageStartPointCalcul(page));
		model.addAttribute("pageEndPointCalcul", analysisService.pageEndPointCalcul(page));
		model.addAttribute("page", page);
		int total_c  = 0;
		if(customer_bill_list.size() != 0)
			total_c = Integer.parseInt(customer_bill_list.get(0).getTotal_pages());
		model.addAttribute("total_count2", total_c);
		model.addAttribute("customer_bill_list", customer_bill_list);

		String name_tmp = "손님";
		String email_tmp  = "-";
		if(!customer_order_calcul.get("name").equals("")) {
			name_tmp = customer_order_calcul.get("name");
			email_tmp = customer_order_calcul.get("email");
		}
		model.addAttribute("name",name_tmp);
		model.addAttribute("email",email_tmp);
		model.addAttribute("total_price",toNumFormat(customer_order_calcul.get("total_price")));
		model.addAttribute("total_purchase_price",toNumFormat(customer_order_calcul.get("total_purchase_price")));
		model.addAttribute("total_cancel_price",toNumFormat(customer_order_calcul.get("total_cancel_price")));
		model.addAttribute("total_canceled_price",toNumFormat(customer_order_calcul.get("total_canceled_price")));
		model.addAttribute("total_count",customer_order_calcul.get("total_count"));
		model.addAttribute("total_purchase_count",customer_order_calcul.get("total_purchase_count"));
		model.addAttribute("total_cancel_count",customer_order_calcul.get("total_cancel_count"));
		model.addAttribute("total_canceled_count",customer_order_calcul.get("total_canceled_count"));
		
		
		
		mav.setViewName(resultPage);		
		
		
		return mav;

	}
	
	
	@RequestMapping(value = "/my_order/{token_info}", method = RequestMethod.GET)
	public ModelAndView myOrder(ModelMap model, HttpServletRequest request, @PathVariable String token_info) {
		
		
		
		model.addAttribute("token_info", analysisService.myOrder(token_info));
		mav.setViewName("my_order");
		
		
		return mav;

		
	}
	
	
	@RequestMapping(value = "/bill", method = RequestMethod.GET)
    public ModelAndView userManage(ModelMap model, HttpServletRequest request) throws Exception{
		String resultPage = "bill";
		model.addAttribute("page_name",resultPage);
		HttpSession session = request.getSession(true);
		model.addAttribute("user_name",session.getAttribute("user_id").toString());
		/*
		
		String user_id;
		String is_login = "";
		
		if(session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();
			is_login = session.getAttribute("is_login").toString();			
		}
		if(is_login.equals("true")) {
			resultPage = "bill";
			model.addAttribute("page_name", resultPage);
			model.addAttribute("user_name",session.getAttribute("user_name").toString());
		}
		else
			resultPage = "login";
		 */
		
		String s_date = "";
		String e_date = "";
		long epoch_start = 0;
		long epoch_end = 0;

		
		if(request.getParameter("start_date") != null && request.getParameter("end_date") != null) {
			try {
				epoch_start = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start_date").toString()).getTime() / 1000;
				epoch_end = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end_date").toString() + " 23:59:59").getTime() / 1000;
				s_date = Long.toString(epoch_start);
				e_date = Long.toString(epoch_end);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			model.addAttribute("start_date", request.getParameter("start_date").toString());
			model.addAttribute("end_date", request.getParameter("end_date").toString());
			
		}
		else {
			//날짜 계산
			Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
			String today = "";
			String today_end = "";
			String today_end2 = "";
			//오늘날짜 가져오기
			today += calendar.get(calendar.YEAR) + "-";
			int month = calendar.get(calendar.MONTH)+1;
			int day = calendar.get(calendar.DAY_OF_MONTH);
			today += (month < 10 ? "0"+month : month)  + "-";

			
			today_end = today + "01";
			today_end2 = today;
			today += day < 10 ? "0"+day : day;

			
			//해당월의 마지막 날짜 가져오기
			calendar.set(calendar.get(calendar.YEAR), calendar.get(calendar.MONTH), calendar.get(calendar.DAY_OF_MONTH));

			int lastDay = calendar.getActualMaximum(Calendar.DATE);
			today_end2 += lastDay;
			//try {
				epoch_start = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(today_end).getTime() / 1000;
				//System.out.println("시간변환테스트 == " + request.getParameter("end_date").toString() + " 23:59:59");
				epoch_end = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(today_end2 + " 23:59:59").getTime() / 1000;
				s_date = Long.toString(epoch_start);
				e_date = Long.toString(epoch_end);
				//s_date = Long.toString(epoch_start);
				//e_date = Long.toString(epoch_end);
				
				model.addAttribute("start_date", today_end);
				model.addAttribute("end_date", today_end2);
				
				
			//} catch (java.text.ParseException e1) {
			//	// TODO Auto-generated catch block
		//		e1.printStackTrace();
		//	}
			
			System.out.println("* 날짜 정보 : " + today + ", 막날정보 : " + lastDay + "zz " + epoch_start + ". " + epoch_end);
			
		}
		List<Bill> bill_list = analysisService.getBillList(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), s_date, e_date);
		model.addAttribute("bill_list", bill_list);
		
		mav.setViewName(resultPage);		
		
		
		return mav;

	}
	
    @RequestMapping( value = "/user_bill", method = RequestMethod.GET)
    @ResponseBody
    public String getBillOneUserList(HttpServletRequest request) throws Exception{
    	//Map<String, Object> retMap = new HashMap<String, Object>();
		HttpSession session = request.getSession(true);
		
    	//int res = cafeSevice.registCategories(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), 
    	//		request.getParameter("cate_name").toString());

		String s_date = "";
		String e_date = "";
		long epoch_start = 0;
		long epoch_end = 0;

		
		if(request.getParameter("start_date") != null && request.getParameter("end_date") != null) {
			try {
				epoch_start = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start_date").toString()).getTime() / 1000;
				epoch_end = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end_date").toString() + " 23:59:59").getTime() / 1000;
				s_date = Long.toString(epoch_start);
				e_date = Long.toString(epoch_end);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		else {
			//날짜 계산
			Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
			String today = "";
			String today_end = "";
			String today_end2 = "";
			//오늘날짜 가져오기
			today += calendar.get(calendar.YEAR) + "-";
			int month = calendar.get(calendar.MONTH)+1;
			int day = calendar.get(calendar.DAY_OF_MONTH);
			today += (month < 10 ? "0"+month : month)  + "-";

			
			today_end = today + "01";
			today_end2 = today;
			today += day < 10 ? "0"+day : day;

			
			//해당월의 마지막 날짜 가져오기
			calendar.set(calendar.get(calendar.YEAR), month, calendar.get(calendar.DAY_OF_MONTH));

			int lastDay = calendar.getActualMaximum(Calendar.DATE);
			today_end2 += lastDay;
			try {
				epoch_start = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(today_end).getTime() / 1000;
				epoch_end = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter("end_date").toString() + " 23:59:59").getTime() / 1000;
				
				s_date = Long.toString(epoch_start);
				e_date = Long.toString(epoch_end);
				
				
				
			} catch (java.text.ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			System.out.println("* 날짜 정보 : " + today + ", 막날정보 : " + lastDay + "zz " + epoch_start + ". " + epoch_end);
			
		}
    	
    	
        return analysisService.getBillOneUserList(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), s_date, e_date, request.getParameter("user_index").toString(),  request.getParameter("page").toString());
    }
    
	public static String toNumFormat(String num) {
		int num2 = Integer.parseInt(num);
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(num2);
	}
	
    
    
}
