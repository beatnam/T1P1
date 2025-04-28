package com.itwillbs.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.CareerListDTO;
import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.service.CareerService;
import com.itwillbs.service.MyPageService;

@RequestMapping("/mypage/*")
@Controller
public class MyPageController {
	
	@Inject
	private MyPageService myPageService;
	
	@Inject
	private CareerService careerService;

	@RequestMapping("/")
	public String main() {
		return "";
	}
	
	
    @RequestMapping("/mypage/my-resume")
    public String myResumePage() {
        return "mypage/my-resume"; 
    }
    
    @GetMapping("/mypage/my-profile")
    public String myProfilePage(HttpSession session, Model model) {
        
        Integer member_num = (Integer) session.getAttribute("member_num");
        
        
        System.out.println("세션 member_num : " + member_num);
        
        MyPageDTO myPageDTO = myPageService.getMyProfile(member_num);
        System.out.println("조회된 MyPageDTO : " + myPageDTO);
        model.addAttribute("MyPageDTO", myPageDTO);
    	
        if (member_num != null) {
            List<CareerDTO> careerList = careerService.getCareerList(member_num);
            model.addAttribute("careerList", careerList);
        } else {
            System.out.println("세션에 member_num이 없습니다!");
        }
        
    	return "mypage/my-profile";
    }
    
    @RequestMapping("mypage/my-profile-edit")
    public String myProfileEdit(HttpSession session, Model model) {
    	
    	Integer member_num = (Integer) session.getAttribute("member_num");
    	
    	if(member_num != null) {
    		MyPageDTO myPageDTO = myPageService.getMyProfile(member_num);
    		model.addAttribute("MyPageDTO", myPageDTO);
    	}else {
    		System.out.println("로그인이 필요합니다.");
    	}
    	
    	
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
    
    @RequestMapping("/mypage/career-add")
    public String openCareerPopup() {
    	return "mypage/career-add";
    }

    @PostMapping("/mypage/insert-career")
    public String insertCareer(@ModelAttribute CareerListDTO careerListDTO, 
    		HttpSession session) {
    	
    	List<CareerDTO> careerList = careerListDTO.getCareerList();
    	
    	Integer member_num = (Integer)session.getAttribute("member_num");
    	
    	if(member_num == null) {
    		System.out.println("로그인이 필요합니다.");
    		return "redirect:/main/login";
    	}
    	
    	for(CareerDTO careerDTO : careerList) {
    		careerDTO.setMember_num(member_num);
    		myPageService.insertCareer(careerDTO);
    	}

    	System.out.println("경력 저장이 완료되었습니다.");
    	return "redirect:/mypage/my-profile";
    }
    
}

