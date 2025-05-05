package com.itwillbs.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.CareerListDTO;
import com.itwillbs.domain.EducationDTO;
import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.domain.MyResumeDTO;
import com.itwillbs.domain.SchoolDTO;
import com.itwillbs.service.CareerService;
import com.itwillbs.service.EducationService;
import com.itwillbs.service.MyPageService;
import com.itwillbs.service.MyResumeService;
import com.itwillbs.service.SchoolService;

@RequestMapping("/mypage/*")
@Controller
public class MyPageController {
	
	@Inject
	private MyPageService myPageService;
	
	@Inject
	private CareerService careerService;
	
	@Inject
	private EducationService educationService;
	
	@Inject
	private SchoolService schoolService;
	
	@Inject
	private MyResumeService myResumeService;

	@RequestMapping("/")
	public String main() {
		return "";
	}//main
	
	
    @GetMapping("/mypage/my-resume")
    public String myResumePage(HttpSession session, Model model) {
    	    Integer member_num = (Integer) session.getAttribute("member_num");
    	    if(member_num == null) {
    	        return "redirect:/main/login";
    	    }

    	    List<MyResumeDTO> resumeList = myResumeService.getResumeList(member_num);
    	    model.addAttribute("resumeList", resumeList);
    	    
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
    
    @GetMapping("mypage/my-profile-edit")
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
       
    
    @PostMapping("/mypage/my-profile-edit")
    public String updateMyIntroduce(MyPageDTO myPageDTO, @ModelAttribute CareerListDTO careerListDTO, HttpSession session) {
    	myPageService.updateMyIntroduce(myPageDTO);
    	Integer member_num = (Integer)session.getAttribute("member_num");
    	careerService.deleteCareerByMemberNum(member_num);
    	
    	
    	if (careerListDTO == null) {
            System.out.println("careerListDTO == null");
        } else if (careerListDTO.getCareerList() == null) {
            System.out.println("careerListDTO.getCareerList() == null");
        } else {
            System.out.println("careerList.size: " + careerListDTO.getCareerList().size());
            for (CareerDTO dto : careerListDTO.getCareerList()) {
                System.out.println(">>> 커리어 데이터: " + dto);
            }
        }
    	
    	
    	if(careerListDTO != null && careerListDTO.getCareerList() != null) {
    		for(CareerDTO careerDTO : careerListDTO.getCareerList()) {
    			careerDTO.setMemberNum(member_num);
    			careerService.insertCareer(careerDTO);
    		}
    	}
    	
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
    	System.out.println("학교 ID: " + educationDTO.getEducationSchool());
        System.out.println("전공: " + educationDTO.getEducationMajor());
        System.out.println("세부전공: " + educationDTO.getMajorDetail());
    	
    	return "<script>alert('수정되었습니다.'); window.opener.location.reload(); window.close();</script>";
    }//insertEducation
    
    @GetMapping("/mypage/school-search") 
    @ResponseBody  
    public List<SchoolDTO> searchSchool(@RequestParam String keyword) {
    	System.out.println(keyword);
        List<SchoolDTO> schoolList = schoolService.searchSchoolByKeyword(keyword);

        List<Map<String, Object>> result = new ArrayList<>();
        
        if (schoolList != null) {
            for (SchoolDTO schoolDTO : schoolList) {
                if (schoolDTO != null) { // ← 이 체크가 핵심
                    Map<String, Object> map = new HashMap<>();
                    map.put("schoolId", schoolDTO.getSchoolId());
                    map.put("schoolName", schoolDTO.getSchoolName());
                    result.add(map);
                } else {
                    System.out.println("schoolDTO가 null입니다!");
                }
            }
        } else {
            System.out.println("schoolList 자체가 null입니다!");
        }
        System.out.println(schoolList);
        
        return schoolList;
    }

    
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
    
    @PostMapping("/mypage/member-delete")
    public String deleteMember(HttpSession session, RedirectAttributes rttr) {
    	int memberNum = (int)session.getAttribute("member_num");
    	
    	if(memberNum != 0) {
    		myPageService.deleteMember(memberNum);
    		session.invalidate();
    		rttr.addFlashAttribute("deleted", "true");
    	}
    	
    	return "redirect:/main/main";
    }
    
    @GetMapping("/mypage/career-add")
    public String showCareerAddPage() {
    	return "mypage/career-add";
    }
    
    
}

