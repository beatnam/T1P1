package com.itwillbs.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPCell;

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
import com.lowagie.text.Image;
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

	@Resource(name = "resumePath")
	private String resumePath;
	
	
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
	    
	    File folder = new File(resumePath);
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
    	List<CareerDTO> careerList = careerService.getCareerList(member_num);
    	
    	System.out.println("educationList : " + educationList);
    	System.out.println("careerList" + careerList);
    	
    	model.addAttribute("memberDTO", memberDTO);
    	model.addAttribute("educationList", educationList);
    	model.addAttribute("careerList", careerList);
        return "resume/my-resume-edit";  
    }//resumeEdit
    
    
    @PostMapping("/submit")
    public String resumeSubmit(HttpSession session, HttpServletRequest request, 
    		HttpServletResponse response,Map<String, Object> map, @RequestParam(value = "resumePhoto", required = false) MultipartFile resumePhoto) {
    	
    	System.out.println("이력서 제출 컨트롤러 진입");
//    	System.out.println(map);
    	Integer member_num = (Integer)session.getAttribute("member_num");
    	if(member_num == null) {
    		return "redirect:/main/login";
    	}
    	
    	MemberDTO memberDTO = memberService.getMemberInfo(member_num);
    	List<EducationDTO> educationList = educationService.getEducationList(member_num);
    	
    	String intro = request.getParameter("additionalIntro");
    	
    	try {
    	
    		File folder = new File(resumePath);
    		if(!folder.exists()) folder.mkdirs();
    		
    		int member_num2 = memberDTO.getMemberNum();
    		int index = 1;
    		String baseName = "resume_" + member_num2;  
    		String fileName;
    		File saveFile;
    		
    		
    		//파일명 중복 없게 만들기
    		do {
    			fileName = baseName + "_" + index + ".pdf";
    			saveFile = new File(resumePath, fileName);
    			index++;
    		}while (saveFile.exists());
    		
          MyResumeDTO myResumeDTO = new MyResumeDTO();
          myResumeDTO.setMemberNum(member_num);
          myResumeDTO.setResumePhoto(fileName);
    		
    		//PDF 생성
    		Document doc = new Document();
            PdfWriter.getInstance(doc, new FileOutputStream(saveFile));
            
            doc.open();
            
            BaseFont bfKorean = BaseFont.createFont("/usr/local/share/fonts/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font fontKorean = new Font(bfKorean, 12);
            Font fontTitle = new Font(bfKorean, 14, Font.BOLD);
            
            doc.add(new Paragraph("이력서", fontTitle));
            doc.add(Chunk.NEWLINE);
            
            if(resumePhoto != null && !resumePhoto.isEmpty()) {
            	String photoPath = resumePath + "/" + resumePhoto.getOriginalFilename();
            	File photoFile = new File(photoPath);
            	resumePhoto.transferTo(photoFile);
            	
            	Image photo = Image.getInstance(photoFile.getAbsolutePath());
            	photo.scaleToFit(120, 120);
            	
            	doc.add(photo);
            	doc.add(Chunk.NEWLINE);
            }
            
            //기본정보
            doc.add(new Paragraph("■ 기본정보", fontKorean));    		
            doc.add(new Paragraph("이름: " + memberDTO.getMemberName(), fontKorean));
            doc.add(new Paragraph("주민등록번호: " + memberDTO.getMemberJumin(), fontKorean));
            doc.add(new Paragraph("이메일: " + memberDTO.getMemberEmail(), fontKorean));
            doc.add(new Paragraph("휴대폰번호: " + memberDTO.getMemberPhone(), fontKorean));
            doc.add(new Paragraph("우편번호: " + memberDTO.getMemberPostcode(), fontKorean));
            doc.add(new Paragraph("주소: " + memberDTO.getMemberAddress(), fontKorean));
            doc.add(Chunk.NEWLINE);
            
            //학력
            if (!educationList.isEmpty()) {
                EducationDTO edu = educationList.get(0);
                doc.add(new Paragraph("■ 최종학력", fontKorean));
                doc.add(new Paragraph("학교명: " + edu.getSchoolName(), fontKorean));
                doc.add(new Paragraph("전공: " + edu.getEducationMajor(), fontKorean));
                doc.add(new Paragraph("세부전공: " + edu.getMajorDetail(), fontKorean));
                doc.add(Chunk.NEWLINE);
            }
            
//            경력
        	List<CareerDTO> careerList = careerService.getCareerList(member_num);
        	if(careerList != null && !careerList.isEmpty()) {
        		doc.add(new Paragraph("■ 경력사항", fontKorean));
        		for(int i = 0; i < careerList.size(); i++) {
        			CareerDTO careerDTO = careerList.get(i);
        			doc.add(new Paragraph("회사명 : " + careerDTO.getJhCorporation(), fontKorean));
        			doc.add(new Paragraph("부서명 : " + careerDTO.getJhDepartment(), fontKorean));
        			doc.add(new Paragraph("업무 내용 : " + careerDTO.getWorkContent(), fontKorean));
        			doc.add(new Paragraph("근무 기간 : " + careerDTO.getStartDate() + " ~ " + careerDTO.getEndDate(), fontKorean));
        			doc.add(Chunk.NEWLINE);
        		}
        	}
            
            //저장
//            MyResumeDTO myResumeDTO = new MyResumeDTO();
//            myResumeDTO.setMemberNum(member_num);
//            myResumeDTO.setResumePhoto(fileName);
//            
            List<CertificationDTO> certList = myResumeService.getCertificationList(member_num);
            
            //자격증 
            String certificationName[] = request.getParameterValues("certificationName");
            String certificationIssuer[] = request.getParameterValues("certificationIssuer");
            String certificationAcquiredDate[] = request.getParameterValues("certificationAcquiredDate");
           
            myResumeService.insertResume(myResumeDTO);
            int resumeId = myResumeDTO.getResumeID();
            
            if(certificationName != null) {
            	List<CertificationDTO> certList2 = new ArrayList<CertificationDTO>();
            	for(int i = 0; i < certificationName.length; i++) {
            		System.out.println(i);
            		doc.add(new Paragraph("■ 자격증"+(i+1), fontKorean));
            		CertificationDTO certificationDTO = new CertificationDTO();
            		certificationDTO.setMemberNum(member_num);
            		certificationDTO.setResumeID(resumeId);
            		certificationDTO.setCertificationName(certificationName[i]);
            		certificationDTO.setCertificationIssuer(certificationIssuer[i]);
            		String rawDate = certificationAcquiredDate[i];
            		if(rawDate == null || rawDate.trim().isEmpty()) {
            			certificationDTO.setCertificationAcquiredDate(null);
            		}else {
            			certificationDTO.setCertificationAcquiredDate(rawDate);
            		}
//            		certificationDTO.setCertificationAcquiredDate(certificationAcquiredDate[i]);
            		certList2.add(certificationDTO);
            		myResumeService.insertCertification(certificationDTO);
            		doc.add(new Paragraph("자격명 : " + (certificationDTO.getCertificationName()), fontKorean));
            		doc.add(new Paragraph("발급기관: " + (certificationDTO.getCertificationIssuer()), fontKorean));
                    doc.add(new Paragraph("취득일: " + (certificationDTO.getCertificationAcquiredDate()), fontKorean));
                    doc.add(Chunk.NEWLINE);
            	}
            			
            }
            
//            외국어
            String languageName[] = request.getParameterValues("languageName");
            String languageNameCustom[] = request.getParameterValues("languageNameCustom");
            String languageIssuer[] = request.getParameterValues("languageIssuer");
            String languageGrade[] = request.getParameterValues("languageGrade");
            
            if(languageIssuer != null && languageGrade != null) {
            	for(int i = 0; i < languageIssuer.length; i++) {
            		String finalLang = "";
            		
            		if (languageName != null && i < languageName.length && languageName[i] != null && !"custom".equals(languageName[i])) {
                        finalLang = languageName[i];
                    } else if (languageNameCustom != null && i < languageNameCustom.length && languageNameCustom[i] != null) {
                        finalLang = languageNameCustom[i];
                    }
            		
            		if(!finalLang.isEmpty() || !languageIssuer[i].isEmpty()) {
            			LanguageDTO languageDTO = new LanguageDTO();
            			languageDTO.setMemberNum(member_num);
            			languageDTO.setResumeID(resumeId);
            			languageDTO.setLanguageName(finalLang);
            			languageDTO.setLanguageIssuer(languageIssuer[i]);
            			languageDTO.setLanguageGrade(languageGrade[i]);
            			
            			myResumeService.isertLanguage(languageDTO);
            			
            			doc.add(new Paragraph("■ 외국어"+(i+1), fontKorean));
                        doc.add(new Paragraph("언어: " + (languageDTO.getLanguageName()), fontKorean));
                        doc.add(new Paragraph("발급기관: " + (languageDTO.getLanguageIssuer()), fontKorean));
                        doc.add(new Paragraph("성적: " + (languageDTO.getLanguageGrade()), fontKorean));
                        doc.add(Chunk.NEWLINE);
            		}
            	}
            }
            
            
//            String languageName = request.getParameter("languageName");
//            String languageIssuer = request.getParameter("languageIssuer");
//            String langmapGrade = request.getParameter("langmapGrade");
            
            doc.close();
            
            System.out.println("PDF 생성 완료");
            
            
            
//            myResumeService.insertResume(myResumeDTO);
            
            
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
    	myResumeService.deleteCertification(resumeID);
    	myResumeService.deleteLanguage(resumeID);
    	
    
    	File file = new File(resumePath, resumePhoto);
    	if(file.exists()) {
    		file.delete();
    	}
    	
    	return "redirect:/mypage/my-resume";
    }//deleteResume
    
}

