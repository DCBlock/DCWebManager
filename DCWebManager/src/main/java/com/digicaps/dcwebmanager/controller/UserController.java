package com.digicaps.dcwebmanager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.ModelAndView;

import com.digicaps.dcwebmanager.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "/user_regist")
    public ModelAndView userRegist(ModelMap model, HttpServletRequest request){
		String resultPage = "user_regist";
		HttpSession session = request.getSession(true);
		
		/*
		HttpSession session = request.getSession(true);
		String user_id;
		String is_login = "";
		if(session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();
			is_login = session.getAttribute("is_login").toString();			
		}
		if(is_login.equals("true")) {
			resultPage = "user_regist";
			model.addAttribute("page_name", resultPage);
			model.addAttribute("user_name",session.getAttribute("user_name").toString());
		}
		else
			resultPage = "login";
		 */
		model.addAttribute("user_name",session.getAttribute("user_id").toString());
		
		mav.setViewName(resultPage);	
		return mav;
	}
	
	@RequestMapping(value = "/user_manage", method = RequestMethod.GET)
    public ModelAndView userManage(ModelMap model, HttpServletRequest request){
		String resultPage = "user_list";
		ArrayList<HashMap<String, String>> user_list;
		String page = "1";
		HttpSession session = request.getSession(true);
		
		if(request.getParameter("page") != null)
			page = request.getParameter("page");
		/*
		HttpSession session = request.getSession(true);
		String user_id;
		String is_login = "";
		if(session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();
			is_login = session.getAttribute("is_login").toString();			
		}
		if(is_login.equals("true")) {
			resultPage = "user_list";
			model.addAttribute("page_name", resultPage);
			model.addAttribute("user_name",session.getAttribute("user_name").toString());
		}
		else
			resultPage = "login";
		*/
		String total_page = "1";
		user_list = userService.UserList(page);
		model.addAttribute("", "");
		if(user_list.size() > 0) {
			total_page = user_list.get(0).get("total_pages");
		}
		model.addAttribute("user_list", user_list);
		model.addAttribute("pageStartPointCalcul", userService.pageStartPointCalcul(Integer.parseInt(page)));
		model.addAttribute("pageEndPointCalcul", userService.pageEndPointCalcul(Integer.parseInt(page)));
		model.addAttribute("page",page);
		model.addAttribute("total_pages",total_page);
		model.addAttribute("user_name",session.getAttribute("user_id").toString());
		mav.setViewName(resultPage);		
		
		
		return mav;

	}
	
    @RequestMapping( value = "/user_regist_request", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity RegistUserInfo(HttpServletRequest request) throws Exception{
    	HttpSession session = request.getSession(true);
    	Map<String, Object> retMap = new HashMap<String, Object>();
    	int res = userService.RegistUserInfo(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(),
    			request.getParameter("email"), 
    			request.getParameter("rfid"), 
    			request.getParameter("name"), 
    			request.getParameter("company"), 
    			request.getParameter("leave"));
    	
    	if(res == 1)
    		retMap.put("result", "success");
    	else if(res == -100)
    		retMap.put("result", "-100");
    	else if(res == -200)
    		retMap.put("result", "-200");
    	
    	else
    		retMap.put("result", "fail");
    	
    	
        return ResponseEntity.ok(retMap);
    }
	
    @RequestMapping( value = "/user_modify", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity ModifyUserInfo(HttpServletRequest request) throws Exception{
    	HttpSession session = request.getSession(true);
    	Map<String, Object> retMap = new HashMap<String, Object>();
    	int res = userService.ModifyUserInfo(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(),
    			request.getParameter("index"), 
    			request.getParameter("email"), 
    			request.getParameter("rfid"), 
    			request.getParameter("name"), 
    			request.getParameter("company"), 
    			request.getParameter("leave"));
    	
    	if(res == 1)
    		retMap.put("result", "success");
    	else
    		retMap.put("result", "fail");
    	
    	
        return ResponseEntity.ok(retMap);
    }
    
    //DeleteUserInfo(String token, String type, String index)
    @RequestMapping( value = "/user_delete", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity DeleteUserInfo(HttpServletRequest request) throws Exception{
    	HttpSession session = request.getSession(true);
    	Map<String, Object> retMap = new HashMap<String, Object>();
    	int res = userService.DeleteUserInfo(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(),
    			request.getParameter("index"));
   	
    	if(res == 1)
    		retMap.put("result", "success");
    	else
    		retMap.put("result", "fail");
    	
    	
        return ResponseEntity.ok(retMap);
    }    
    
    
    
    
	
}
