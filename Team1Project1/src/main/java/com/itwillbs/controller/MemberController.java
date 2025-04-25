package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
		memberDTO.setMtId(200);
		memberService.joinMember(memberDTO);
		return "redirect:/main/main";
	}

	@GetMapping("/login")
	public String loginHome() {
		System.out.println("memberController login");

		return "member/login";
	}

	@PostMapping("/loginPro")
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("memberController loginPro");

		MemberDTO memberDTO2 = memberService.loginMember(memberDTO);
		
		if (memberDTO2 != null) {
			// 아이디 비밀번호 일치
			// 로그인 성공 => 로그인 표시값을 세션에 저장
			session.setAttribute("id", memberDTO2.getMemberId());
			// 세션값에 멤버타입도 같이 넘겨줌 
			session.setAttribute("type", memberDTO2.getMtId());
			// /board/main 주소변경하면서 이동
			return "redirect:/main/main";
		} else {
			// 아이디 비밀번호 틀림
			// member/msg.jsp 주소변경없이 이동
			return "/main/msg";
		}

	} // loginPro();


	@GetMapping("/login1-1")
	public String loginHome1() {

		return "member/login1-1";
	}

	@GetMapping("/login1-2")
	public String loginHome2() {

		return "member/login1-2";
	}

}
