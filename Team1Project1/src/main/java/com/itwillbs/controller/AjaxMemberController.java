package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.ManagerService;
import com.itwillbs.service.MemberService;

@RestController
public class AjaxMemberController {


	@Inject
	private MemberService memberService;
	

	@GetMapping("/member/idCheck")
	public String idcheck(HttpServletRequest request) {
		System.out.println("AjaxController idCheck()");
		String id = request.getParameter("id");

		// id에 해당하는 값이 DB에 저장돼이었는지 확인해서 DTO에 담아옴
		MemberDTO memberDTO = memberService.infoMember(id);
		String result = "";
		if (memberDTO != null) {
			// 아이디 있음, 아이디 중복
			result = "아이디 중복";
			result = "iddup";
			return result;
		} else {
			// 아이디 없음, 해당 아이디 사용 가능
			result = "아이디 사용 가능";
			result = "idok";
		}
		// 결과값 리턴
		return result;
	}// idCheck
	
	
	@GetMapping("/member/juminCheck")
	public String juminCheck(HttpServletRequest request) {
		System.out.println("AjaxController juminCheck()");
		String jumin = request.getParameter("jumin");

		// id에 해당하는 값이 DB에 저장돼이었는지 확인해서 DTO에 담아옴
		MemberDTO memberDTO = memberService.infojumin(jumin);
		String result = "";
		if (memberDTO != null) {
			// 아이디 있음, 아이디 중복
			result = "주민중복 중복";
			result = "juminup";
			return result;
		} else {
			// 아이디 없음, 해당 아이디 사용 가능
			result = "주민번호 사용 가능";
			result = "juminok";
		}
		// 결과값 리턴
		return result;
	}// idCheck
	
	
	@GetMapping("/member/emailCheck")
	public String emailCheck(HttpServletRequest request) {
		System.out.println("AjaxController emailCheck()");
		String email = request.getParameter("email");

		// id에 해당하는 값이 DB에 저장돼이었는지 확인해서 DTO에 담아옴
		MemberDTO memberDTO = memberService.infoemail(email);
		String result = "";
		if (memberDTO != null) {
			// 아이디 있음, 아이디 중복
			result = "이메일 중복";
			result = "emailup";
			return result;
		} else {
			// 아이디 없음, 해당 아이디 사용 가능
			result = "이메일 사용 가능";
			result = "emailok";
		}
		// 결과값 리턴
		return result;
	}// idCheck
	
	
	@GetMapping("/member/phoneCheck")
	public String phoneCheck(HttpServletRequest request) {
		System.out.println("AjaxController phoneCheck()");
		String phone = request.getParameter("phone");

		// id에 해당하는 값이 DB에 저장돼이었는지 확인해서 DTO에 담아옴
		MemberDTO memberDTO = memberService.infophone(phone);
		String result = "";
		if (memberDTO != null) {
			// 아이디 있음, 아이디 중복
			result = "휴대폰 중복";
			result = "phoneup";
			return result;
		} else {
			// 아이디 없음, 해당 아이디 사용 가능
			result = "휴대폰 사용 가능";
			result = "phoneok";
		}
		// 결과값 리턴
		return result;
	}// idCheck
	

	
	
}
