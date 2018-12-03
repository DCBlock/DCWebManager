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
                .addPathPatterns("/**")
                .excludePathPatterns("/login")
                .excludePathPatterns("/login_request")
                .excludePathPatterns("/");	// 홈 화면에서는 자체적으로 세션 검사를 하도록 한다.
    }
}