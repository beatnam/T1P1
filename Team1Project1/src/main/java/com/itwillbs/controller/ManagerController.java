package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	@GetMapping("/alwaysrecruit_mng")
	public String alwaysRecruitMng() {
		
		return "/manager/alwaysrecruit_mng";
	}
	
	@GetMapping("/board_mng")
	public String boardMng() {
		
		return "/manager/board_mng";
	}
	
	@GetMapping("/fair_mng")
	public String fairMng() {
		
		return "/manager/fair_mng";
	}
	
	@GetMapping("/fair_update")
	public String fairUpdate() {
		
		return "/manager/fair_update";
	}
	
	@GetMapping("/fair_write")
	public String fairWrite() {
		
		return "/manager/fair_write";
	}
	
	@GetMapping("/FAQ_mng")
	public String faqMng() {
		
		return "/manager/FAQ_mng";
	}
	
	@GetMapping("/faq_write")
	public String faqWrite() {
		
		return "/manager/faq_write";
	}
	
	@GetMapping("/member_mng")
	public String memberMng() {
		
		return "/manager/member_mng";
	}
	
	@GetMapping("/openrecruit_mng")
	public String openrecruitMng() {
		
		return "/manager/openrecruit_mng";
	}

	@GetMapping("/openrecruit_update")
	public String openrecruitUpdate() {
		
		return "/manager/openrecruit_update";
	}
	
	@GetMapping("/openrecruit_write")
	public String openrecruitWrite() {
		
		return "/manager/openrecruit_write";
	}
	
	@GetMapping("/review_employment_mng")
	public String reviewEmploymentMng() {
		
		return "/manager/review_employment_mng";
	}
	
	@GetMapping("/review_interview_mng")
	public String reviewInterviewMng() {
		
		return "/manager/review_interview_mng";
	}
}

