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
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.CareerListDTO;
import com.itwillbs.domain.EduHighDTO;
import com.itwillbs.domain.EducationDTO;
import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.service.CareerService;
import com.itwillbs.service.EducationService;
import com.itwillbs.service.MyPageService;

@RequestMapping("/mypage/*")
@Controller
public class MyPageController {
	
	@Inject
	private MyPageService myPageService;
	
	@Inject
	private CareerService careerService;
	
	@Inject
	private EducationService educationService;

	@RequestMapping("/")
	public String main() {
		return "";
	}//main
	
	
    @RequestMapping("/mypage/my-resume")
    public String myResumePage() {
        return "mypage/my-resume"; 
    }//myResumePage
    
    @GetMapping("/mypage/my-profile")
    public String myProfilePage(HttpSession session, Model model) {
        
        Integer member_num = (Integer) session.getAttribute("member_num");
        System.out.println("세션 member_num : " + member_num);
        
        if(member_num == null) {
        	System.out.println("세션에 member_num이 없습니다");
        	return "redirect:/member/login";
        }
        MyPageDTO myPageDTO = new MyPageDTO();
        myPageDTO.setMemberNum(member_num);
        
        MyPageDTO myPageDTO2 = myPageService.getMyProfileByMemberNum(myPageDTO);
        
        model.addAttribute("MyPageDTO", myPageDTO2);
    	
        List<EducationDTO> educationList = educationService.getEducationList(member_num);
        model.addAttribute("educationList", educationList);
            
        List<CareerDTO> careerList = careerService.getCareerList(member_num);
        System.out.println("careerList 사이즈 : " + careerList.size());
        model.addAttribute("careerList", careerList);
        
        
    	return "mypage/my-profile";
    }//myProfilePage
    
    @RequestMapping("mypage/my-profile-edit")
    public String myProfileEdit(HttpSession session, Model model) {
    	
    	Integer member_num = (Integer) session.getAttribute("member_num");
    	
    	if(member_num == null) {
        	System.out.println("세션에 member_num이 없습니다");
        	return "redirect:/member/login";
        }
    	
    	MyPageDTO myPageDTO = new MyPageDTO();
        myPageDTO.setMemberNum(member_num);
        
        MyPageDTO myPageDTO2 = myPageService.getMyProfileByMemberNum(myPageDTO);
        
        model.addAttribute("MyPageDTO", myPageDTO2);
    	
        List<EducationDTO> educationList = educationService.getEducationList(member_num);
        model.addAttribute("educationList", educationList);
            
        List<CareerDTO> careerList = careerService.getCareerList(member_num);
        System.out.println("careerList 사이즈 : " + careerList.size());
        model.addAttribute("careerList", careerList);
    	    	
    	return "mypage/my-profile-edit";
    }//myProfileEdit
    
    @RequestMapping("/mypage/my-introduce")
    public String myIntroducePage() {
        return "mypage/my-introduce";
    }//myIntroducePage

    @RequestMapping("/mypage/my-ing")
    public String myIngPage() {
        return "mypage/my-ing";
    }//myIngPage

    @RequestMapping("/resume/my-resume-edit")
    public String resumeEdit(){
        return "resume/my-resume-edit";  
    }//resumeEdit
    
    @GetMapping("/mypage/career-add")
    public String openCareerPopup() {
    	return "mypage/career-add";
    }//openCareerPopup

    @PostMapping("/mypage/insert-career")
    public String insertCareer(@ModelAttribute CareerListDTO careerListDTO, 
    		HttpSession session) {
    	
    	List<CareerDTO> careerList = careerListDTO.getCareerList();
    	System.out.println("받은 careerList : careerList");
    	Integer member_num = (Integer)session.getAttribute("member_num");
    	
    	if(member_num == null) {
    		System.out.println("로그인이 필요합니다.");
    		return "redirect:/main/login";
    	}
    	if(careerList != null) {
    		for(CareerDTO careerDTO : careerList) {
    			careerDTO.setMember_num(member_num);
    			myPageService.insertCareer(careerDTO);
    		}
    		System.out.println("경력 저장이 완료되었습니다.");
    	}else {
    		System.out.println("경력 리스트가 비어있습니다.");
    	}
    	
    	return "redirect:/mypage/my-profile";
    }//insertCareer
    
    @PostMapping("/mypage/insert-career-ajax")
    @ResponseBody
    public String insertCareerAjax(CareerDTO careerDTO, HttpSession session) {
        Integer member_num = (Integer) session.getAttribute("member_num");
        if (member_num == null) return "fail";

        careerDTO.setMember_num(member_num);
        myPageService.insertCareer(careerDTO);
        return "success";
    }//insertCareerAjax
    
    @PostMapping("/mypage/my-profile-edit")
    public String updateMyIntroduce(MyPageDTO myPageDTO) {
    	myPageService.updateMyIntroduce(myPageDTO);
    	
    	System.out.println("한 줄 소개 : " + myPageDTO.getMemberIntroduce());
    	System.out.println("회원번호 : " + myPageDTO.getMemberNum());
    	System.out.println("이메일 여부 : " + myPageDTO.getMemberInfoC());
    	
    	return "redirect:/mypage/my-profile";
    }

    @GetMapping("/mypage/education-insert")
    public String showEducationInsert() {
    	return "mypage/education-insert";
    }//showEducationInsert
    
    @PostMapping(value = "/mypage/education-insert", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String insertEducation(EducationDTO educationDTO) {
    	educationService.insertEducation(educationDTO);
    	return "<script>alert('수정되었습니다.'); window.opener.location.reload(); window.close();</script>";
    }//insertEducation
    
    @GetMapping("/mypage/education-update")
    public String showEducationUpdate(HttpSession session, Model model) {
    	int member_num = (int)session.getAttribute("member_num");
    	
    	EducationDTO educationDTO = educationService.getEducationByMemberNum(member_num);
    	
    	
    	model.addAttribute("educationDTO", educationDTO);
    	
    	
    	return "mypage/education-update";
    }//showEducationUpdate
    
    @PostMapping(value = "/mypage/education-update", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String updateEducation(EducationDTO educationDTO) {
    	educationService.updateEducation(educationDTO);
    	return "<script>alert('수정되었습니다.'); window.opener.location.reload(); window.close();</script>";
    }
    
    
    
    
}

