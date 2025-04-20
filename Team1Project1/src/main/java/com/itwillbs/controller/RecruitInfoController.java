package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recruit_info/*")
public class RecruitInfoController {
	
	@GetMapping("/info_home")
	public String recruitHome() {
		
		return "recruit_info/info_home";
	}
	
	
	@GetMapping("/always")
	public String always() {
		
		return "recruit_info/always";
	}
	
	@GetMapping("/fair")
	public String fair() {
		
		return "recruit_info/fair";
	}
	
	@GetMapping("/open")
	public String open() {
		
		return "recruit_info/open";
	}
	


	
}
