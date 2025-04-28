package com.itwillbs.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String copJoinPro(CorporationDTO corporationDTO, HttpServletRequest request) {
		System.out.println("CorporationController copJoinPro()");

		String corporationMemberEmail = request.getParameter("email1") + "@" + request.getParameter("email2");

		corporationDTO.setCorporationMemberEmail(corporationMemberEmail);
		corporationDTO.setMtId(300);
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
			session.setAttribute("id", corporationDTO2.getCorporationMemberId());
			session.setAttribute("type", corporationDTO2.getMtId());
			return "redirect:/corporation/update_regist";

		} else if ((corporationDTO2 != null) && (corporationDTO2.getMtId()) == 400) {
			// 사업자 등록증 제출하고 승인을 기다리는 상태
			return "redirect:/corporation/cop_alert";

		} else if ((corporationDTO2 != null) && (corporationDTO2.getMtId()) == 500) {
			// 모든 승인을 받고 활동 가능한 상태
			session.setAttribute("id", corporationDTO2.getCorporationMemberId());
			session.setAttribute("type", corporationDTO2.getMtId());

			session.setAttribute("corpNum", corporationDTO2.getCorporationMemberNum());

			return "redirect:/main/main";

		} else {

			return "redirect:/main/msg";
		}

	}

	// 사업자 등록증 제출하고 승인을 기다리는 상태
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

	@PostMapping("/updateRegistPro")
	public String updateRegistPro(HttpSession session, HttpServletRequest request,
			MultipartFile corporationRegistrationPdf, MultipartFile corporationPhoto) throws IOException {
		System.out.println("CorporationController updateRegistPro()");

		String corporationMemberId = (String) session.getAttribute("id");

		System.out.println(corporationMemberId);

		UUID uuid = UUID.randomUUID();

		String filename = uuid.toString() + "_" + corporationRegistrationPdf.getOriginalFilename();
		FileCopyUtils.copy(corporationRegistrationPdf.getBytes(), new File(uploadPath, filename));

		String filename1 = uuid.toString() + "_" + corporationPhoto.getOriginalFilename();
		FileCopyUtils.copy(corporationPhoto.getBytes(), new File(uploadPath, filename1));

		CorporationDTO corporationDTO = new CorporationDTO();

		corporationDTO.setCorporationMemberId(corporationMemberId);
		System.out.println(corporationDTO.getCorporationMemberId());
		corporationDTO.setCorporationRegistrationPdf(filename);
		corporationDTO.setCorporationPhoto(filename1);

		corporationService.updateRegist(corporationDTO);

		return "redirect:/corporation/logout";

	}// updateRegist()

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 제거
		return "redirect:/main/main"; // 로그인 페이지로 이동
	}

}
