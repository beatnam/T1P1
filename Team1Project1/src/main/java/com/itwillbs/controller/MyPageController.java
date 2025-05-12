package com.itwillbs.controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.CareerListDTO;
import com.itwillbs.domain.EducationDTO;
import com.itwillbs.domain.IntroduceDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.domain.MyResumeDTO;
import com.itwillbs.domain.SchoolDTO;
import com.itwillbs.service.CareerService;
import com.itwillbs.service.EducationService;
import com.itwillbs.service.IntroduceService;
import com.itwillbs.service.MemberService;
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
	
	@Inject
	private IntroduceService introduceService;
	
	@Inject
	private MemberService memberService;

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
    
    @GetMapping("/mypage/my-ing")
    public String mypageIng(HttpSession session, Model model) {
    		System.out.println("mypage my-ing");
    	    Integer member_num = (Integer) session.getAttribute("member_num");
    	    
    	    
    	    List<Map<Object, Object>> resumeList = myPageService.getapplication(member_num);
    	    model.addAttribute("resumeList", resumeList);
    	    
        return "mypage/my-ing"; 
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
//        for(EducationDTO educationDTO : educationList) {
//        	try {
//        		int schoolId = educationDTO.getEducationSchool();
//        		String schoolName = schoolService.getSchoolNameById(schoolId);
//        		educationDTO.setSchoolName(schoolName);
//        	}catch(NumberFormatException e){
//        		educationDTO.setSchoolName("학교 정보 없음");
//        	}
//        }
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
    public String updateMyIntroduce(MyPageDTO myPageDTO, HttpServletRequest request, HttpSession session) {
    	myPageService.updateMyIntroduce(myPageDTO);
    	
    	Integer member_num = (Integer)session.getAttribute("member_num");
    	careerService.deleteCareerByMemberNum(member_num);
    	
    	String jhCorporation[] = request.getParameterValues("jhCorporation");
    	String jhDepartment[] = request.getParameterValues("jhDepartment");
    	String workContent[] = request.getParameterValues("workContent");
    	String startDate[] = request.getParameterValues("startDate");
    	String endDate[] = request.getParameterValues("endDate");

    	if(jhCorporation != null){
    		for (int i = 0; i < jhCorporation.length; i++){
    			
    			if (jhCorporation[i] == null || jhCorporation[i].trim().equals("")) continue;
    			
    			CareerDTO careerDTO = new CareerDTO();
    			careerDTO.setMemberNum(member_num);
    			careerDTO.setJhCorporation(jhCorporation[i]);
    			careerDTO.setJhDepartment(jhDepartment[i]);
    			careerDTO.setWorkContent(workContent[i]);
    			careerDTO.setStartDate(startDate[i]);
    			careerDTO.setEndDate(endDate[i]);

    			careerService.insertCareer(careerDTO);
    		}
    	}	
    	
    	
    	System.out.println("한 줄 소개 : " + myPageDTO.getMemberIntroduce());
    	System.out.println("회원번호 : " + myPageDTO.getMemberNum());
    	System.out.println("이메일 여부 : " + myPageDTO.getMemberInfoC());
    	
    	return "redirect:/mypage/my-profile";
    }//updateMyIntroduce

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
    }//searchSchool

    
    @GetMapping("/mypage/education-update")
    public String showEducationUpdate(HttpSession session, Model model) {
    	int member_num = (int)session.getAttribute("member_num");
    	
    	EducationDTO educationDTO = educationService.getEducationByMemberNum(member_num);
    	
    	try {
            int schoolId = educationDTO.getEducationSchool();
            String schoolName = schoolService.getSchoolNameById(schoolId);
            educationDTO.setSchoolName(schoolName);  
        } catch (Exception e) {
            educationDTO.setSchoolName("학교 정보 없음");
        }
    	model.addAttribute("educationDTO", educationDTO);
    	
    	
    	return "mypage/education-update";
    }//showEducationUpdate
    
    @PostMapping(value = "/mypage/education-update", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String updateEducation(EducationDTO educationDTO) {
    	educationService.updateEducation(educationDTO);
    	return "<script>alert('수정되었습니다.'); window.opener.location.reload(); window.close();</script>";
    }//updateEducation
    
    @PostMapping("/mypage/member-delete")
    public String deleteMember(HttpSession session, RedirectAttributes rttr) {
    	int memberNum = (int)session.getAttribute("member_num");
    	
    	if(memberNum != 0) {
    		myPageService.deleteMember(memberNum);
    		session.invalidate();
    		rttr.addFlashAttribute("deleted", "true");
    	}
    	
    	return "redirect:/main/main";
    }//deleteMember
    
    @GetMapping("/mypage/career-add")
    public String showCareerAddPage() {
    	return "mypage/career-add";
    }//showCareerAddPage
    
    @PostMapping("/mypage/uploadIntroduceFile")
    public String uploadIntroduceFile(@RequestParam("introduceFile") MultipartFile file, HttpSession session, HttpServletRequest request, Model model) {
    	Integer memberNum = (Integer)session.getAttribute("member_num");
    	
    	
    	if(memberNum == null) {
    		return "redirect:/main/login";
    	}
    	
    	if(file.isEmpty()) {
    		model.addAttribute("error", "파일이 비어 있습니다.");
    		return "redirect:/mypage/my-introduce";
    	}
    	
    	try {
    		String uploadDir = "c:/upload/introduce";
    		File dir = new File(uploadDir);
    		if(!dir.exists()) {
    			dir.mkdirs();
    		}
    		
//    		String uuid = UUID.randomUUID().toString();
//    		String originalFilename = file.getOriginalFilename();
//    		String savedFilename = uuid + "_" + originalFilename;
    		
    		MemberDTO memberDTO = memberService.getMemberInfo(memberNum);
    		String memberName = memberDTO.getMemberName().replaceAll("\\s+", "");
    		
    		String originalFilename = file.getOriginalFilename();
    		String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
    		
    		int index = 1;
    		String baseName = "자기소개서_" + memberName;
    		String savedFilename;
    		File destFile;
    		
    		do {
    			savedFilename = baseName + "_" + index + extension;
    			destFile = new File(uploadDir, savedFilename);
    			index++;
    		}while(destFile.exists());
    		
    		file.transferTo(destFile);
    		
    		IntroduceDTO introduceDTO = new IntroduceDTO();
    		introduceDTO.setMemberNum(memberNum);
    		introduceDTO.setCvFileName(savedFilename);
    		introduceDTO.setCvFilePath("/upload/introduce/" + savedFilename);            
            
    		
    		System.out.println("파일 디비 저장 직전 디티오 " + introduceDTO);
    		introduceService.insertIntroduceFile(introduceDTO);
            
    		System.out.println("자소서 업로드 완료");
    	}catch(Exception e) {
    		e.printStackTrace();
    		model.addAttribute("error", "파일 업로드 실패");
    	}
    	return "redirect:/mypage/my-introduce";
    }//uploadIntroduceFile
    
    @GetMapping("/mypage/my-introduce")
    public String myIntroducePage(HttpSession session, Model model) {
    	Integer memberNum = (Integer)session.getAttribute("member_num");
    	
    	if(memberNum == null) {
    		return "redirect:/main/login";
    	}
    	
    	List<IntroduceDTO> introduceList = introduceService.getIntroduceByMemberNum(memberNum);
    	model.addAttribute("introduceList", introduceList);
    	
    	return "mypage/my-introduce";
    	
    }//myIntroducePage
    
    @PostMapping("/mypage/deleteIntroduce")
    public String deleteIntroduce(@RequestParam("cvId") int cvId, @RequestParam("cvFilePath") String cvFilePath) {
    	
    	introduceService.deleteIntroduce(cvId);
    	
    	File file = new File(cvFilePath);
    	if(file.exists()) {
    		file.delete();
    	}
    	
    	return "redirect:/mypage/my-introduce";
    }//deleteIntroduce
    
    @PostMapping("/mypage/career-delete")
    @ResponseBody
    public String deleteCareer(@RequestParam("jhId") int jhId) {
    	careerService.deleteCareer(jhId);
    	return "삭제 성공";
    }
    
//    @GetMapping("/introduce/view")
//    public void viewIntroduceFile(@RequestParam("filePath") String filePath, HttpServletResponse response) {
//        File file = new File("C:/upload/introduce/" + filePath);
//
//        response.setCharacterEncoding("UTF-8");  // 인코딩 지정
//        response.setContentType("text/plain; charset=UTF-8");
//
//        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8));
//             PrintWriter out = response.getWriter()) {
//
//            String line;
//            while ((line = br.readLine()) != null) {
//                out.println(line);
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

    
}

