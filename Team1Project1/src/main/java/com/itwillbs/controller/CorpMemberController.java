package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.CorporationDTO;
import com.itwillbs.service.CorpMemberService;
import com.itwillbs.service.CorporationService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/corpmain/*")
public class CorpMemberController {
	
	@Inject
	private CorporationService corporationService;
	
	@Inject
	private CorpMemberService corpMemberService;
	
	@GetMapping("/main")
	public String main(HttpSession session, Model model) {
		System.out.println("corpmembercontroller main()");
		
		String corporationMemberId = (String)session.getAttribute("corporationMemberId");
		
		CorporationDTO corporationDTO = corpMemberService.corpInfo(corporationMemberId);
		System.out.println(corporationDTO);
		model.addAttribute("corporationDTO", corporationDTO);
		
		return "/corporation/corporation_main";
	}//corporationMain()
	
	@GetMapping("/update")
	public String update(HttpSession session, Model model) {
		System.out.println("corpmembercontroller update()");
		
		String corporationMemberId = (String)session.getAttribute("corporationMemberId");
		
		CorporationDTO corporationDTO = corpMemberService.corpInfo(corporationMemberId);
		System.out.println(corporationDTO);
		model.addAttribute("corporationDTO", corporationDTO);
		
		return "/corporation/corporationmain_update";
	}//update()
	
	@PostMapping("/updatepro")
	public String updatePro(HttpSession session, Model model, CorporationDTO corporationDTO) {
		System.out.println("corpmembercontroller updatePro()");
		
		System.out.println("corporationDTO : " + corporationDTO);
		corpMemberService.updateMember(corporationDTO);
		
		return "redirect:/corpmain/main";
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
