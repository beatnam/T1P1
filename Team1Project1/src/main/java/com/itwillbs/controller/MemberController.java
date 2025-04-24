package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@GetMapping("/join")
	public String join() {
		System.out.println("MemberController join");
		
		return "member/join";
	}
	@GetMapping("/login")
	public String loginHome() {
		
		return "member/login";
	}
	
	@GetMapping("/login1-1")
	public String loginHome1() {
		
		return "member/login1-1";
	}
	
	@GetMapping("/login1-2")
	public String loginHome2() {
		
		return "member/login1-2";
	}
	
	

}
