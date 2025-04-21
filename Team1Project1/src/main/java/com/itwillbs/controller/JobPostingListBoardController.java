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
		
		return "/coporation/jobposting_list";
	}//list()
	
	@GetMapping("/content")
	public String content() {
		System.out.println("copmembercontroller content()");
		
		return "/coporation/jobpostinglist_content";
	}//content()
	
	@GetMapping("/update")
	public String update() {
		System.out.println("copmembercontroller update()");
		
		return "/coporation/jobpostinglist_update";
	}//update()
	
	@GetMapping("/write")
	public String write() {
		System.out.println("copmembercontroller write()");
		
		return "/coporation/jobpostinglist_write";
	}//update()
	
}
