package com.digicaps.dcwebmanager.controller;

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

import com.digicaps.dcwebmanager.dto.Category;
import com.digicaps.dcwebmanager.dto.Menu;
import com.digicaps.dcwebmanager.service.CafeService;

@Controller
public class CafeController {
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	CafeService cafeSevice;
	
	@RequestMapping(value = "/menu_manage")
    public ModelAndView userRegist(ModelMap model, HttpServletRequest request){
		String resultPage = "menu_manage";
		HttpSession session = request.getSession(true);
		
		List<Category> cate = cafeSevice.getCategoryList(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString());
		List<Menu> menu = cafeSevice.getMenuList(session.getAttribute("access_token").toString(), session.getAttribute("token_type").toString(), cate);
		model.addAttribute("cate_list", cate);
		model.addAttribute("menu_list", menu);
		
		mav.setViewName(resultPage);		
		
		
		return mav;

	}
	
	@RequestMapping(value = "/cancel_order_manage")
    public ModelAndView userManage(ModelMap model, HttpServletRequest request){
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
	
}
