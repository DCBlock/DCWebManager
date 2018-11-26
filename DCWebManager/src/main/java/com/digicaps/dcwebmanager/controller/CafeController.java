package com.digicaps.dcwebmanager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CafeController {
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "/menu_manage")
    public ModelAndView userRegist(ModelMap model, HttpServletRequest request){
		String resultPage = "menu_manage";
		HttpSession session = request.getSession(true);
		String user_id;
		String is_login = "";
		if(session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();
			is_login = session.getAttribute("is_login").toString();			
		}
		if(is_login.equals("true")) {
			resultPage = "menu_manage";
			model.addAttribute("page_name", resultPage);
			model.addAttribute("user_name",session.getAttribute("user_name").toString());
		}
		else
			resultPage = "login";
		mav.setViewName(resultPage);		
		
		
		return mav;

	}
	
	@RequestMapping(value = "/cancel_order_manage")
    public ModelAndView userManage(ModelMap model, HttpServletRequest request){
		String resultPage = "cancel_order_manage";
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
		mav.setViewName(resultPage);		
		
		
		return mav;

	}	
}
