package com.itwillbs.controller;

import javax.annotation.Resource;
import javax.inject.Inject;

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
	
	@GetMapping("/main")
	public String main() {
		System.out.println("CorporationController copmain()");

		return "/corporation/corporation_main";
	}// corporationmain()

	@PostMapping("/copJoinPro")
	public String copJoinPro(CorporationDTO corporationDTO) {

		corporationDTO.setMtId(300);
		//corporationDTO.setCorporationVerified(false);
		System.out.println(corporationDTO);
		//corporationService.insertMember(corporationDTO);

		return "redirect:/corporation/main";
	}

	@GetMapping("/update")
	public String update() {
		System.out.println("CorporationController update()");

		return "/corporation/corporationmain_update";
	}// update()

	@GetMapping("/openresume")
	public String openResume() {
		System.out.println("CorporationController openResume()");

		return "/corporation/open_resume";
	}// openResume()

	@GetMapping("/coverletter")
	public String coverLetter() {
		System.out.println("CorporationController coverLetter()");

		return "/corporation/cover_letter";
	}// coverLetter()

	@GetMapping("/applyresume")
	public String applyResume() {
		System.out.println("CorporationController applyResume()");

		return "/corporation/apply_resume";
	}// applyResume()

}
