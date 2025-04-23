package com.itwillbs.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/copmain/*")
public class CopMemberController {
	
	@GetMapping("/main")
	public String main() {
		System.out.println("copmembercontroller copmain()");
		
		return "/coporation/coporation_main";
	}//coporationmain()
	
	@GetMapping("/update")
	public String update() {
		System.out.println("copmembercontroller update()");
		
		return "/coporation/coporationmain_update";
	}//update()
	
	@GetMapping("/openresume")
	public String openResume() {
		System.out.println("copmembercontroller openResume()");
		
		return "/coporation/open_resume";
	}//openResume()
	
	@GetMapping("/coverletter")
	public String coverLetter() {
		System.out.println("copmembercontroller coverLetter()");
		
		return "/coporation/cover_letter";
	}//coverLetter()
	
	@GetMapping("/applyresume")
	public String applyResume() {
		System.out.println("copmembercontroller applyResume()");
		
		return "/coporation/apply_resume";
	}//applyResume()
	
	
}
