package com.itwillbs.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.CertificationDTO;
import com.itwillbs.domain.EducationDTO;
import com.itwillbs.domain.LanguageDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MyResumeDTO;
import com.itwillbs.service.CareerService;
import com.itwillbs.service.EducationService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MyResumeService;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;


@Controller
@RequestMapping("/resume/*")
public class ResumeController {
	
	@Inject
	private MemberService memberService;
	@Inject 
	private EducationService educationService;
	@Inject 
	private MyResumeService myResumeService;
	@Inject
	private CareerService careerService;

	@GetMapping("/my-resume")
	public String resumeView(HttpSession session, Model model, HttpServletRequest request) {
		Integer member_num = (Integer)session.getAttribute("member_num");
		if(member_num == null) {
			return "redirect:/main/login";
		}
		
		MemberDTO memberDTO = myResumeService.getMemberInfoFromResume(member_num);
	    model.addAttribute("member", memberDTO);
	    
	    List<EducationDTO> educationList = myResumeService.getEducationList(member_num);
	    model.addAttribute("educationList", educationList);
	    
	    List<CertificationDTO> certList = myResumeService.getCertificationList(member_num);
	    model.addAttribute("certificationList", certList);
	    
	    List<LanguageDTO> langList = myResumeService.getLanguageList(member_num);
	    model.addAttribute("languageList", langList);
	    
	    List<MyResumeDTO> resumeList = myResumeService.getResumeList(member_num);
	    model.addAttribute("resumeList", resumeList);
	    
	    String uploadPath = "C:/upload/resume";
	    File folder = new File(uploadPath);
	    File[] files = folder.listFiles((dir, name) -> name.startsWith("resume_" + member_num + "_") && name.endsWith(".pdf"));
	    
	    List<String> fileNames = new ArrayList<>();
	    if (files != null) {
	        for (File file : files) {
	            fileNames.add(file.getName());
	        }
	    }
	    model.addAttribute("pdfFileList", fileNames);
	    
	    
	    return "resume/my-resume";
	}//resumeView
	
	
    @GetMapping("/my-resume-edit")
    public String resumeEdit(HttpSession session, Model model){
    	Integer member_num = (Integer)session.getAttribute("member_num");
    	if(member_num == null) {
    		return "redirect:/main/login";
    	}
    	
    	MemberDTO memberDTO = memberService.getMemberInfo(member_num);
    	List<EducationDTO> educationList = educationService.getEducationList(member_num);
    	
    	System.out.println("educationList : " + educationList);
    	
    	model.addAttribute("memberDTO", memberDTO);
    	model.addAttribute("educationList", educationList);
        return "resume/my-resume-edit";  
    }//resumeEdit
    
    
    @PostMapping("/submit")
    public String resumeSubmit(HttpSession session, HttpServletRequest request, 
    		HttpServletResponse response, @RequestParam(value = "resumePhoto", required = false) MultipartFile resumePhoto) {
    	
    	System.out.println("이력서 제출 컨트롤러 진입");
    	Integer member_num = (Integer)session.getAttribute("member_num");
    	if(member_num == null) {
    		return "redirect:/main/login";
    	}
    	
    	MemberDTO memberDTO = memberService.getMemberInfo(member_num);
    	List<EducationDTO> educationList = educationService.getEducationList(member_num);
    	List<CareerDTO> careerList = careerService.getCareerList(member_num);
    	
    	String intro = request.getParameter("additionalIntro");
    	
    	try {
    		String uploadPath = "C:/upload/resume";
    		File folder = new File(uploadPath);
    		if(!folder.exists()) folder.mkdirs();
    		
    		String fileName = "resume_" + member_num + "_" + System.currentTimeMillis() + ".pdf";
    		File saveFile = new File(uploadPath, fileName);
    		
    		Document doc = new Document();
            PdfWriter.getInstance(doc, new FileOutputStream(saveFile));
            
            doc.open();
            BaseFont bfKorean = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font fontKorean = new Font(bfKorean, 12);
            doc.add(new Paragraph("이력서", fontKorean));
            doc.add(new Paragraph("■ 기본정보", fontKorean));
            doc.add(new Paragraph("이름: " + memberDTO.getMemberName(), fontKorean));
            doc.add(new Paragraph("주민등록번호: " + memberDTO.getMemberJumin(), fontKorean));
            doc.add(new Paragraph("이메일: " + memberDTO.getMemberEmail(), fontKorean));
            doc.add(new Paragraph("휴대폰번호: " + memberDTO.getMemberPhone(), fontKorean));
            doc.add(new Paragraph("우편번호: " + memberDTO.getMemberPostcode(), fontKorean));
            doc.add(new Paragraph("주소: " + memberDTO.getMemberAddress(), fontKorean));
            doc.add(Chunk.NEWLINE);
            
            if (!educationList.isEmpty()) {
                EducationDTO edu = educationList.get(0);
                doc.add(new Paragraph("■ 최종학력", fontKorean));
                doc.add(new Paragraph("학교명: " + edu.getSchoolName(), fontKorean));
                doc.add(new Paragraph("전공: " + edu.getEducationMajor(), fontKorean));
                doc.add(new Paragraph("세부전공: " + edu.getMajorDetail(), fontKorean));
                doc.add(Chunk.NEWLINE);
            }
            
            doc.add(new Paragraph("■ 자격증", fontKorean));
            String certificationName = request.getParameter("certificationName");
            String certificationIssuer = request.getParameter("certificationIssuer");
            String cermapAquiredDate = request.getParameter("cermapAquiredDate");

            doc.add(new Paragraph("자격명: " + (certificationName != null ? certificationName : ""), fontKorean));
            doc.add(new Paragraph("발급기관: " + (certificationIssuer != null ? certificationIssuer : ""), fontKorean));
            doc.add(new Paragraph("취득일: " + (cermapAquiredDate != null ? cermapAquiredDate : ""), fontKorean));
            doc.add(Chunk.NEWLINE);
            
            doc.add(new Paragraph("■ 외국어", fontKorean));
            String languageName = request.getParameter("languageName");
            String languageIssuer = request.getParameter("languageIssuer");
            String langmapGrade = request.getParameter("langmapGrade");
            
            doc.add(new Paragraph("언어: " + (languageName != null ? languageName : ""), fontKorean));
            doc.add(new Paragraph("발급기관: " + (languageIssuer != null ? languageIssuer : ""), fontKorean));
            doc.add(new Paragraph("성적: " + (langmapGrade != null ? langmapGrade : ""), fontKorean));
            doc.add(Chunk.NEWLINE);
            
            doc.close();
            
            System.out.println("PDF 생성 완료");
            
            MyResumeDTO myResumeDTO = new MyResumeDTO();
            myResumeDTO.setMemberNum(member_num);
            myResumeDTO.setResumePhoto(fileName);
            myResumeService.insertResume(myResumeDTO);
            
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	System.out.println("이름: " + memberDTO.getMemberName());
    	System.out.println("이메일: " + memberDTO.getMemberEmail());
    	System.out.println("자기소개: " + intro);
    	System.out.println("학력 개수: " + educationList.size());
    	if (!educationList.isEmpty()) {
    	    EducationDTO edu = educationList.get(0);
    	    System.out.println("학교명: " + edu.getSchoolName());
    	    System.out.println("전공: " + edu.getEducationMajor());
    	}
    	    	
    	return "redirect:/mypage/my-resume";
    }//resumeSubmit
    
    @PostMapping("/delete")
    public String deleteResume(@RequestParam("resumeID")int resumeID, @RequestParam("resumePhoto")String resumePhoto) {
    	myResumeService.deleteResume(resumeID);
    	String uploadPath = "C:/upload/resume";
    	File file = new File(uploadPath, resumePhoto);
    	if(file.exists()) {
    		file.delete();
    	}
    	return "redirect:/mypage/my-resume";
    }//deleteResume
    
}

