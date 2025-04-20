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
	
	@GetMapping("/coporationmain")
	public String coporationmain() {
		System.out.println("copmembercontroller copmain()");
		
		return "/coporation/coporationmain";
	}//coporationmain()
	
	@GetMapping("/update")
	public String update() {
		System.out.println("copmembercontroller update()");
		
		return "/coporation/coporationmainupdate";
	}//update()
	
	@GetMapping("/accessresume")
	public String accessresume() {
		System.out.println("copmembercontroller accessresume()");
		
		return "/coporation/accessresume";
	}//accessresume()
	
	@GetMapping("/selfintroductionletter")
	public String selfintroductionletter() {
		System.out.println("copmembercontroller selfintroductionletter()");
		
		return "/coporation/selfintroductionletter";
	}//selfintroductionletter()
	
	@GetMapping("/appliedresume")
	public String appliedresume() {
		System.out.println("copmembercontroller appliedresume()");
		
		return "/coporation/appliedresume";
	}//appliedresume()
	
	
	
	
}
