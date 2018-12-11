package com.digicaps.dcwebmanager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnalysisController {
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "/bill")
    public ModelAndView userManage(ModelMap model, HttpServletRequest request){
		String resultPage = "bill";
		HttpSession session = request.getSession(true);
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
		mav.setViewName(resultPage);		
		
		
		return mav;

	}
}
