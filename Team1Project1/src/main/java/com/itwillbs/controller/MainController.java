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
	
	@GetMapping("/my-profile")
	public String mypage() {

		return "/mypage/my-profile";
	}
	
	@GetMapping("/login")
	public String login() {

		return "/member/login";
	}
	
	@GetMapping("/join")
	public String join() {
		System.out.println("Maincontroller join");	
		return "/member/join";
	}
	
	@GetMapping("/recruit_info")
	public String recruitInfo() {

		return "/recruit_info/info_home";
	}
	
	@GetMapping("/copmain")
	public String copMain() {

		return "/coporation/coporation_main";
	}
	
	@GetMapping("/customerService")
	public String customerService() {

		return "/customerService/customerService";
	}
	
	
	@GetMapping("/riboard")
	public String reviewinterviewBoard() {

		return "/community/reviewinterview_board";
	}
	
	@GetMapping("/ciboard")
	public String commentinterviewBoard() {
		
		return "/community/reviewinterview_board";
	}
}