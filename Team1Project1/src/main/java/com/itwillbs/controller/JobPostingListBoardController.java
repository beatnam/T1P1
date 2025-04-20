package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/coplist/*")
public class JobPostingListBoardController {
	
	@GetMapping("/list")
	public String list() {
		System.out.println("copmembercontroller list()");
		
		return "/coporation/jobpostinglist";
	}//list()
	
	@GetMapping("/content")
	public String content() {
		System.out.println("copmembercontroller content()");
		
		return "/coporation/jobpostinglistcontent";
	}//content()
	
	@GetMapping("/update")
	public String update() {
		System.out.println("copmembercontroller update()");
		
		return "/coporation/jobpostinglistupdate";
	}//update()
	
	@GetMapping("/write")
	public String write() {
		System.out.println("copmembercontroller write()");
		
		return "/coporation/jobpostinglistwrite";
	}//update()
	
}
