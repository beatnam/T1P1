package com.itwillbs.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.CorporationDTO;
import com.itwillbs.service.CorporationService;

@Controller
@RequestMapping("/corporation/*")
public class CorporationController {

	@Inject
	private CorporationService corporationService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@GetMapping("/main")
	public String main() {
		System.out.println("CorporationController copmain()");

		return "/corporation/corporation_main";
	}// corporationmain()

	@PostMapping("/copJoinPro")
	public String copJoinPro(CorporationDTO corporationDTO) {
		System.out.println("CorporationController copJoinPro()");

		corporationDTO.setMtId(300);
		corporationDTO.setCorporationVerified(false);
		System.out.println(corporationDTO);
		corporationService.insertMember(corporationDTO);

		return "redirect:/main/main";
	}

	@PostMapping("/copLoginPro")
	public String copLoginPro(CorporationDTO corporationDTO, HttpSession session) {
		System.out.println("CorporationController copLoginPro()");

		CorporationDTO corporationDTO2 = corporationService.loginMember(corporationDTO);

		if ((corporationDTO2 != null) && (corporationDTO2.getMtId()) == 300) {
			// 사업자 등록증 제출 전이라 제출 페이지로 이동
			session.setAttribute("corporationId", corporationDTO2.getCorporationMemberId());
			return "redirect:/corporation/update_regist";

		} else if ((corporationDTO2 != null) && (corporationDTO2.getMtId()) == 400) {
			// 사업자 등록증 제출하고 승인을 기다리는 상태
			return "redirect:/corporation/cop_alert";

		} else if ((corporationDTO2 != null) && (corporationDTO2.getMtId()) == 500) {
			// 모든 승인을 받고 활동 가능한 상태
			session.setAttribute("corporationId", corporationDTO2.getCorporationMemberId());
			return "redirect:/main/main";
		
		}else {
		
			return "redirect:/corporation/msg";
		}
		
		

	}
	@GetMapping("/msg")
	public String copErr() {
		System.out.println("CorporationController copErr()");

		return "/corporation/msg";
	}// copAlert()
	
	@GetMapping("/cop_alert")
	public String alert() {
		System.out.println("CorporationController alert()");

		return "/corporation/cop_alert";
	}// copAlert()
	
	@GetMapping("/update_regist")
	public String updateRegist() {
		System.out.println("CorporationController updateRegist()");

		return "/corporation/update_regist";
	}// updateRegist()
	
	
	
	@GetMapping("/update")
	public String update() {
		System.out.println("CorporationController update()");

		return "redirect:/corporation/corporationmain_update";
	}// update()

}
