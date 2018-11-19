package com.digicaps.dcwebmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

	
	@RequestMapping("/")
	@ResponseBody
	public String home(){
		return "helloHome";

	}
	
	@RequestMapping("/jsp")
	public String jspPage(Model model){
		model.addAttribute("name","hellodd springBoot1234");
		return "hello";
	}
	
    
}
