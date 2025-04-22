package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rvborad/*")
public class reviewBoradController {
	
	@GetMapping("/rilist")
	public String riList() {
		System.out.println("InterviewBoradController list()");
		
		return "/community/reviewinterview_board";
	}//list()
	
	@GetMapping("/rclist")
	public String ciList() {
		System.out.println("InterviewBoradController list()");
		
		return "/community/reviwcomment_board";
	}//list()
	
	@GetMapping("/riupdate")
	public String riUpdate() {
		System.out.println("InterviewBoradController update()");
		
		return "/community/interviewboard_update";
	}//update()
	
	@GetMapping("/rcupdate")
	public String ciUpdate() {
		System.out.println("InterviewBoradController update()");
		
		return "/community/commentboard_update";
	}//update()
	
	@GetMapping("/riwrite")
	public String riWrite() {
		System.out.println("InterviewBoradController write()");
		
		return "/community/interviewboard_write";
	}//write()
	
	@GetMapping("/rcwrite")
	public String ciWrite() {
		System.out.println("InterviewBoradController write()");
		
		return "/community/commentboard_write";
	}//write()
	
	@GetMapping("/ricontent")
	public String riContent() {
		System.out.println("InterviewBoradController content()");
		
		return "/community/interviewboard_content";
	}//content()
	
	@GetMapping("/rccontent")
	public String ciContent() {
		System.out.println("InterviewBoradController content()");
		
		return "/community/commentboard_content";
	}//content()
	
	
	
}
