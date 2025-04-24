package com.itwillbs.controller;


import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mypage/*")
@Controller
public class MyPageController {

	@RequestMapping("/")
	public String main() {
		return "";
	}
		
	@PostMapping
	
	
	
    @RequestMapping("/mypage/my-resume")
    public String myResumePage() {
        return "mypage/my-resume"; 
    }
    
    @RequestMapping("/mypage/my-profile")
    public String myProfilePage() {
        return "mypage/my-profile";
    }
    
    @RequestMapping("mypage/my-profile-edit")
    public String myProfileEdit() {
    	return "mypage/my-profile-edit";
    }
    
    @RequestMapping("/mypage/my-introduce")
    public String myIntroducePage() {
        return "mypage/my-introduce";
    }

    @RequestMapping("/mypage/my-ing")
    public String myIngPage() {
        return "mypage/my-ing";
    }

    @RequestMapping("/resume/my-resume-edit")
    public String resumeEdit(){
        return "resume/my-resume-edit";  
    }

    
}

