package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MyPageDTO;
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
	public String joinPro(MemberDTO memberDTO, HttpServletRequest request) {
		System.out.println("memberController joinPro");

		
		String memberJumin = request.getParameter("memberJumin1") + request.getParameter("memberJumin2"); 
		String memberEmail = request.getParameter("memberEmail1") + "@" + request.getParameter("memberEmail2"); 
		String memberId = request.getParameter("memberId"); 
		
		memberDTO.setMTId(200);		
		memberDTO.setMemberId(memberId);		
		memberDTO.setMemberEmail(memberEmail);
		memberDTO.setMemberJumin(memberJumin);
		
		
		memberService.joinMember(memberDTO);
		memberService.joineducationId(memberId);
		
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
			session.setAttribute("type", memberDTO2.getMTId());

			session.setAttribute("num", memberDTO2.getMemberNum());
			
	        System.out.println("세션 ID : " + memberDTO2.getMTId());
	        System.out.println("세션 member_num : " + memberDTO2.getMemberNum());

			return "redirect:/main/main";
		} else{
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
