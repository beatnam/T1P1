package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.service.JobService;
import com.itwillbs.service.MainService;

@Controller
@RequestMapping("/first/*")
public class FilteringController {
	@Inject
	private MainService mainService;

	@Inject
	private JobService jobService;

	@GetMapping("/filtering")
	public String part1(Model model) {

		List<OccupationDTO> occupations = jobService.getOccupations();

		model.addAttribute("occupations", occupations);

		return "/first/part1";
	}

	@PostMapping("/filteringPro")
	public String FilterPro(@RequestParam Map<Object, Object> filter, Model model) {

		List<Map<Object, Object>> resultOR = mainService.listOR(filter);
		List<Map<Object, Object>> resultRecruit = mainService.listRecruit(filter);
		System.out.println(resultOR);
		System.out.println(resultRecruit);
		model.addAttribute("resultOR", resultOR);
		model.addAttribute("resultRecruit", resultRecruit);

		return "/first/coverletter";
	}

	@GetMapping("/coverletter")
	public String coverletter() {

		return "/first/coverletter";
	}
}
