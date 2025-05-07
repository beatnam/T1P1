package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.CorporationDTO;
import com.itwillbs.service.CorpMemberService;
import com.itwillbs.service.ManagerService;

@RestController
public class AjaxController {

	@Inject
	private ManagerService managerService;

	@Inject
	private CorpMemberService corpMemberService;
	
	@GetMapping("/manager/filter")
	public List<Map<String, Object>> memberTypeFilter(HttpServletRequest request) {
		System.out.println("AjaxController memberTypeFilter()");

		Integer mtId = Integer.parseInt(request.getParameter("mtId"));

		System.out.println(mtId);
		if (mtId == 0) {
			List<Map<String, Object>> result = managerService.listCopMember();
			System.out.println(result);
			return result;
		} else {
			List<Map<String, Object>> result = managerService.listCopMember1(mtId);
			System.out.println(result);
			return result;
		}

	}

	@GetMapping("/copmember/idCheck")
	public String copIdCheck(@RequestParam String id) {
		System.out.println("AjaxController idCheck()");

		CorporationDTO corporationDTO = corpMemberService.corpInfo(id);
		String result = "";
		if (corporationDTO != null) {
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

	}

}
