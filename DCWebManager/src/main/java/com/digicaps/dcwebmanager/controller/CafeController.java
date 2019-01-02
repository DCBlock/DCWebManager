package com.digicaps.dcwebmanager.controller;

import java.text.ParseException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.digicaps.dcwebmanager.dto.CancelOrder;
import com.digicaps.dcwebmanager.dto.Category;
import com.digicaps.dcwebmanager.dto.Menu;
import com.digicaps.dcwebmanager.service.CafeService;

@Controller
public class CafeController {
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	CafeService cafeSevice;
	
	
    @RequestMapping( value = "/cancel_order_accept", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity requestCancelOrderAccept(HttpServletRequest request) throws Exception{
    	Map<String, Object> retMap = new HashMap<String, Object>();
		HttpSession session = request.getSession(true);
		
    	int res = cafeSevice.requestCancelOrderAccept(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), 
    			request.getParameter("receipt_id"), request.getParameter("purchaseDate"));
    	
    	if(res == 1)
    		retMap.put("result", "success");
    	else
    		retMap.put("result", "fail");
    	
    	
        return ResponseEntity.ok(retMap);
    }
	
	
	@RequestMapping(value = "/menu_manage")
    public ModelAndView userRegist(ModelMap model, HttpServletRequest request){
		String resultPage = "menu_manage";
		HttpSession session = request.getSession(true);
		
		List<Category> cate = cafeSevice.getCategoryList(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString());
		List<Menu> menu = cafeSevice.getMenuList(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), cate);
		model.addAttribute("cate_list", cate);
		model.addAttribute("menu_list", menu);
		model.addAttribute("user_name",session.getAttribute("user_id").toString());
		mav.setViewName(resultPage);		
		
		
		return mav;

	}
	
	@RequestMapping(value = "/cancel_order_manage", method = RequestMethod.GET)
    public ModelAndView userManage(ModelMap model, HttpServletRequest request) throws Exception{
		String resultPage = "cancel_order_manage";
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
		HttpSession session = request.getSession(true);
		String s_date = "";
		String e_date = "";
		long epoch_start = 0;
		long epoch_end = 0;

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
			Calendar calendar = Calendar.getInstance();
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
		
		List<CancelOrder> cancel_list = cafeSevice.getCancelOrderList(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), s_date, e_date);
		/*
		
		for(int i = 0; i < cancel_list.size(); i++) {
			
		}
		*/
		
		model.addAttribute("cancel_list", cancel_list);

		
		
		mav.setViewName(resultPage);		
		
		
		return mav;

	}
	
	

    @RequestMapping( value = "/modify_categories", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity modifyCategories(HttpServletRequest request) throws Exception{
    	Map<String, Object> retMap = new HashMap<String, Object>();
		HttpSession session = request.getSession(true);
		
    	int res = cafeSevice.modifyCategories(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), 
    			request.getParameter("categories"));
    	
    	if(res == 1)
    		retMap.put("result", "success");
    	else
    		retMap.put("result", "fail");
    	
    	
        return ResponseEntity.ok(retMap);
    }
    
    @RequestMapping( value = "/create_categories", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity createCategories(HttpServletRequest request) throws Exception{
    	Map<String, Object> retMap = new HashMap<String, Object>();
		HttpSession session = request.getSession(true);
		
    	int res = cafeSevice.registCategories(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), 
    			request.getParameter("cate_name").toString());
    	
    	if(res == 1)
    		retMap.put("result", "success");
    	else
    		retMap.put("result", "fail");
    	
    	
        return ResponseEntity.ok(retMap);
    }

    
    @RequestMapping( value = "/delete_categories", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity deleteCategories(HttpServletRequest request) throws Exception{
    	Map<String, Object> retMap = new HashMap<String, Object>();
		HttpSession session = request.getSession(true);
		
    	int res = cafeSevice.deleteCategories(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), 
    			request.getParameter("cate_code"));
    	
    	if(res == 1)
    		retMap.put("result", "success");
    	else
    		retMap.put("result", "fail");
    	
    	
        return ResponseEntity.ok(retMap);
    }
    
    
    @RequestMapping( value = "/modify_menus", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity menuCategories(HttpServletRequest request) throws Exception{
    	Map<String, Object> retMap = new HashMap<String, Object>();
		HttpSession session = request.getSession(true);
		
    	int res = cafeSevice.modifyMenus(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), 
    			request.getParameter("menus"), request.getParameter("code").toString());
    	
    	if(res == 1)
    		retMap.put("result", "success");
    	else
    		retMap.put("result", "fail");
    	
    	
        return ResponseEntity.ok(retMap);
    }
    
    
    @RequestMapping( value = "/create_menus", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity createMenus(HttpServletRequest request) throws Exception{
    	Map<String, Object> retMap = new HashMap<String, Object>();
		HttpSession session = request.getSession(true);
		
    	int res = cafeSevice.registMenus(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), 
    			request.getParameter("menu_data").toString());
    	
    	if(res == 1)
    		retMap.put("result", "success");
    	else
    		retMap.put("result", "fail");
    	
    	
        return ResponseEntity.ok(retMap);
    }

    
    @RequestMapping( value = "/delete_menus", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity deleteMenus(HttpServletRequest request) throws Exception{
    	Map<String, Object> retMap = new HashMap<String, Object>();
		HttpSession session = request.getSession(true);
		
    	int res = cafeSevice.deleteMenus(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), 
    			request.getParameter("cate_code"), request.getParameter("menu_code"));
    	
    	if(res == 1)
    		retMap.put("result", "success");
    	else
    		retMap.put("result", "fail");
    	
    	
        return ResponseEntity.ok(retMap);
    }
    
    
    
	
}
