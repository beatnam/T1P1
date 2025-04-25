package com.itwillbs.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.service.MyPageService;

@RequestMapping("/mypage/*")
@Controller
public class MyPageController {
	
	@Inject
	private MyPageService myPageService;

	@RequestMapping("/")
	public String main() {
		return "";
	}
	
	
    @RequestMapping("/mypage/my-resume")
    public String myResumePage() {
        return "mypage/my-resume"; 
    }
    
    @RequestMapping("/mypage/my-profile")
    public String myProfilePage(HttpSession session, Model model) {
        String id = (String)session.getAttribute("id");
        System.out.println("세션 ID : " + id);
        
        MyPageDTO myPageDTO = myPageService.getMyProfile(id);
        model.addAttribute("MyPageDTO", myPageDTO);
    	
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

