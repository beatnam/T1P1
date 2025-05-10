package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.service.JobService;
import com.itwillbs.service.MainService;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/first/*")
public class FirstStepController {
	@Inject
	private MainService mainService;

	@Inject
	private JobService jobService;

	@GetMapping("/filtering")
	public String part1(Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/first/plz_login";
		} else {

			List<OccupationDTO> occupations = jobService.getOccupations();

			model.addAttribute("occupations", occupations);

			return "/first/part1";
		}
	}

	// 세션값 없으면 얼럿 후 로그인으로 이동
	@GetMapping("/plz_login")
	public String plzLogin() {

		return "/first/plz_login";
	}

	@PostMapping("/filteringPro")
	public String FilterPro(@RequestParam Map<Object, Object> filter, Model model) {

		List<Map<Object, Object>> resultOR = mainService.listOR(filter);
		List<Map<Object, Object>> resultRecruit = mainService.listRecruit(filter);
//		System.out.println(resultOR);
//		System.out.println(resultRecruit);
		model.addAttribute("resultOR", resultOR);
		model.addAttribute("resultRecruit", resultRecruit);

		return "/first/coverletter";
	}

	@PostMapping("/submit_application")
	public String submitApplication(@RequestParam String companyName) {
		System.out.println(companyName);
		return null;
	}

	@PostMapping("/save_and_page")
	public String saveAndPage(@RequestParam("companyUrl") String companyUrl,
			@RequestParam("gptResult") String gptResult) {
		System.out.println("오긴오나?");
		System.out.println(companyUrl);
		System.out.println(gptResult);
		return "redirect:" + companyUrl;
	}
	
	

}
