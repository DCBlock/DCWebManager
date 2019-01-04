package com.digicaps.dcwebmanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SuppressWarnings("deprecation")
@Configuration
public class WebConfig extends WebMvcConfigurerAdapter{
    /*
     * 로그인 인증 Interceptor 설정
     * */
    @Autowired
    CertificationInterceptor certificationInterceptor;
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(certificationInterceptor)
        		//.addPathPatterns(patterns)
                //.addPathPatterns("/**")
                .addPathPatterns("/user_regist")
                .addPathPatterns("/user_manage")
                .addPathPatterns("/menu_manage")
                .addPathPatterns("/cancel_order_manage")
                .addPathPatterns("/bill");
                

                
                
                /*
                
                .excludePathPatterns("/login")
                .excludePathPatterns("/login_request")
                .excludePathPatterns("/assets")	//뷰를 위한 리소스 자원에는 접근 가능
                .excludePathPatterns("/assets/**")
                .excludePathPatterns("/img")
                .excludePathPatterns("/img/**")
                .excludePathPatterns("/my_order/**")//logout
                .excludePathPatterns("/logout")//
                .excludePathPatterns("assets")
                .excludePathPatterns("assets/**")
                .excludePathPatterns("/my_order")
                .excludePathPatterns("/");	// 홈 화면에서는 자체적으로 세션 검사를 하도록 한다.
                */
    }
}