package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.CorporationDTO;
import com.itwillbs.service.CorpMemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/corpmain/*")
public class CorpMemberController {
	
	@Inject
	private CorpMemberService corpMemberService;
	
	@GetMapping("/main")
	public String main(HttpSession session, Model model) {
		System.out.println("corpmembercontroller main()");
		
		String corporationMemberId = (String)session.getAttribute("corporationMemberId");
		
		CorporationDTO corporationDTO = corpMemberService.corpInfo(corporationMemberId);
		System.out.println(corporationDTO);
		model.addAttribute("corporationDTO", corporationDTO);
		
		
//		String corporationMemberId = (String)session.getAttribute("corporationMemberId");
//		corporationDTO.setCorporationMemberId(corporationMemberId);
//		corporationDTO = corpMemberService.corpInfo(corporationMemberId);
//		model.addAttribute("corporationDTO", corporationDTO);
		return "/corporation/corporation_main";
	}//corporationMain()
	
	@GetMapping("/update")
	public String update() {
		System.out.println("corpmembercontroller update()");
		
		
		return "/corporation/corporationmain_update";
	}//update()
	
	@GetMapping("/openresume")
	public String openResume() {
		System.out.println("corpmembercontroller openResume()");
		
		return "/corporation/open_resume";
	}//openResume()
	
	@GetMapping("/coverletter")
	public String coverLetter() {
		System.out.println("corpmembercontroller coverLetter()");
		
		return "/corporation/cover_letter";
	}//coverLetter()
	
	@GetMapping("/applyresume")
	public String applyResume() {
		System.out.println("corpmembercontroller applyResume()");
		
		return "/corporation/apply_resume";
	}//applyResume()
	
	
}
