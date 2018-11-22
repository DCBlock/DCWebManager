package com.digicaps.dcwebmanager.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	
    @RequestMapping( value = "/login_request", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity loginRequest(HttpServletRequest request) throws Exception{

        Map<String, Object> retMap = new HashMap<String, Object>();
        //retMap.put("result", "success");
        int res = 0;
        
        String user_id = request.getParameter("user_id");
        String user_pw = request.getParameter("user_pw");
        HttpSession session = request.getSession(true);
        
        if(user_id.equals("admin") && user_pw.equals("1234")) {
        	session.setAttribute("user_id", user_id);
        	session.setAttribute("is_login", "true");
        	session.setAttribute("user_name", "이태호");
        	
            retMap.put("result", "success");
            retMap.put("msg", "로그인에 성공하였습니다.");        	
        }
        else {
	        retMap.put("result", "fail");
	        retMap.put("msg", "아이디 및 암호가 일치하지 않습니다.");    
        }
 
        return ResponseEntity.ok(retMap);
    }

}
