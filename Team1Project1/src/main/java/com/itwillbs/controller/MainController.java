package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@GetMapping("/main")
	public String part1() {

		return "/main/main";
	}
	
	@GetMapping("/recruit_info")
	public String recruitInfo() {

		return "/recruit_info/info_home";
	}
	
	@GetMapping("/copmain")
	public String copmain() {

		return "/coporation/coporation_main";
	}
	
	@GetMapping("/ivboard")
	public String interviewreviewboard() {

		return "/community/interviewreview_board";
	}
}
