package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ivborad/*")
public class InterviewBoradController {
	
	@GetMapping("/list")
	public String list() {
		System.out.println("InterviewBoradController list()");
		
		return "/community/interviewreviewboard";
	}//list()
	
	@GetMapping("/update")
	public String update() {
		System.out.println("InterviewBoradController update()");
		
		return "/community/boardupdate";
	}//update()
	
	@GetMapping("/write")
	public String write() {
		System.out.println("InterviewBoradController write()");
		
		return "/community/boardwrite";
	}//write()
	
	@GetMapping("/content")
	public String content() {
		System.out.println("InterviewBoradController content()");
		
		return "/community/boardcontent";
	}//content()
	
	
	
	
	
}
