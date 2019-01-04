package com.digicaps.dcwebmanager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "/")
    public ModelAndView main(ModelMap model, HttpServletRequest request){
		String resultPage = "index";
		HttpSession session = request.getSession(true);
		String user_id;
		String is_login = "";
		
				
		if(session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();
			is_login = session.getAttribute("is_login").toString();			
		}
		if(is_login.equals("true")) {
			resultPage = "index";
			model.addAttribute("page_name","index");
			model.addAttribute("user_name",session.getAttribute("user_id").toString());
			
		}
		else
			resultPage = "login";
		mav.setViewName(resultPage);		
		
		
		return mav;

	}
	
	
	@RequestMapping(value = "/logout")
    public ModelAndView logout(ModelMap model, HttpServletRequest request){
		String resultPage = "login";
		
		HttpSession session = request.getSession(true);
		session.invalidate();

		mav.setViewName(resultPage);		
		
		
		return mav;

	}
	

	
	@RequestMapping("/jsp")
	public String jspPage(Model model){
		model.addAttribute("name","hellodd springBoot1234");
		return "hello";
	}
	
	
    @RequestMapping("/a")
    String dfdf() {        
        return "Hello World!";
    }
	
    
}
