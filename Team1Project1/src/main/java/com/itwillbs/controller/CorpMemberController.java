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
@RequestMapping("/corpmain/*")
public class CorpMemberController {
	
	@GetMapping("/main")
	public String main() {
		System.out.println("corpmembercontroller corpmain()");
		
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
