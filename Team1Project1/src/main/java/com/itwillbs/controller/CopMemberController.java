package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/accessresume")
	public String accessresume() {
		System.out.println("copmembercontroller accessresume()");
		
		return "/coporation/access_resume";
	}//accessresume()
	
	@GetMapping("/selfintroductionletter")
	public String selfintroductionletter() {
		System.out.println("copmembercontroller selfintroductionletter()");
		
		return "/coporation/selfintroduction_letter";
	}//selfintroductionletter()
	
	@GetMapping("/appliedresume")
	public String appliedresume() {
		System.out.println("copmembercontroller appliedresume()");
		
		return "/coporation/applied_resume";
	}//appliedresume()
	
	
	
	
}
