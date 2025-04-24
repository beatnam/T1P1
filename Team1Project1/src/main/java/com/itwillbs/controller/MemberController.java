package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject
	private MemberService memberService;

	@GetMapping("/join")
	public String join() {
		System.out.println("memberController join");
		return "member/join";
	}
	
	
	
	@PostMapping("/joinPro")
	public String joinPro(MemberDTO memberDTO) {
		System.out.println("memberController joinPro");
		
		
		memberService.joinMember(memberDTO);
		return "redirect:/member/join";
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
