package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.RecruitDTO;
import com.itwillbs.service.MainService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Inject
	private MainService mainservice;

	@GetMapping("/search")
	public String search(
		    @RequestParam("query") String query,
		    @RequestParam(defaultValue = "0") int page,
		    Model model
		) {
		System.out.println("MainController search");

		    int pageSize = 10;
		    int startRow = page * pageSize;

		    // 추후 페이징하려면 paramMap을 넘겨야 하므로 미리 준비
		    Map<String, Object> paramMap = new HashMap<>();
		    paramMap.put("keyword", "%" + query + "%");
		    paramMap.put("startRow", startRow);
		    paramMap.put("pageSize", pageSize);

		    List<Map<String, Object>> result = mainservice.search(paramMap);
		    model.addAttribute("result", result);
		    model.addAttribute("query", query);

		    return "main/search";
}


	
	
	
	@GetMapping("/main")
	public String part1(Model model) {
		System.out.println("MainController part1()");
		
		List<RecruitDTO> recruitList = mainservice.getRecentRecruitList(8);
		model.addAttribute("recruitList", recruitList);
		
		return "/main/main";
	}

	@GetMapping("/my-profile")
	public String mypage() {
		System.out.println("MainController mypage()");
		
		return "redirect:/mypage/my-profile";
	}

	@GetMapping("/msg")
	public String msg() {
		System.out.println("MainController msg()");
		return "/main/msg";
	}
	

	@GetMapping("/login")
	public String login() {
		System.out.println("MainController login()");
		return "/member/login";
	}

	@GetMapping("/join")
	public String join() {
		System.out.println("MainController join()");
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
