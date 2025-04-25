package com.itwillbs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/*")
public class MainController {

	@GetMapping("/main")
	public String part1() {
		System.out.println("MainController part1()");
		return "/main/main";
	}

	@GetMapping("/msg")
	public String msg() {
		System.out.println("MainController msg()");
		return "/main/msg";
	}

	@GetMapping("/my-profile")
	public String mypage() {
		System.out.println("MainController mypage()");
		return "/mypage/my-profile";
	}

	@GetMapping("/login")
	public String login() {
		System.out.println("MainController login()");
		return "/member/login";
	}

	@GetMapping("/join")
	public String join() {

		return "/member/join";
	}

	@GetMapping("/cop_join")
	public String copJoin() {
		System.out.println("MainController copJoin()");
		return "/corporation/cop_join";
	}

	@GetMapping("/cop_login")
	public String copLogin() {
		System.out.println("MainController coplogin()");
		return "/corporation/cop_login";
	}

	@GetMapping("/recruit_info")
	public String recruitInfo() {
		System.out.println("MainController recruitInfo()");
		return "/recruit_info/info_home";
	}

	@GetMapping("/corpmain")
	public String corpMain() {

		return "/corporation/corporation_main";
	}

	@GetMapping("/customerService")
	public String customerService() {
		System.out.println("MainController customerService()");
		return "/customerService/customerService";
	}

	@GetMapping("/riboard")
	public String reviewinterviewBoard() {
		System.out.println("MainController reviewinterviewBoard()");

		return "/community/reviewinterview_board";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/main/main";
	}

	@GetMapping("/ciboard")
	public String commentinterviewBoard() {

		System.out.println("MainController commentinterviewBoard()");
		return "/community/reviewinterview_board";

	}

	@GetMapping("/communitymain")
	public String communityMain() {

		return "/community/community_info";
	}

}
