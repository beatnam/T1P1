package com.itwillbs.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // /upload/resume/** 요청 → C:/upload/resume/ 실제 파일 경로로 연결
        registry.addResourceHandler("/upload/resume/**")
                .addResourceLocations("file:///C:/upload/resume/");
        
        registry.addResourceHandler("/upload/introduce/**")
        .addResourceLocations("file:///C:/upload/introduce/");
    }
}
	

