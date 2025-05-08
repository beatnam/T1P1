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
	public String idCheck(HttpServletRequest request) {
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
	

	
	
}
