package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/first/*")
public class FilteringController {

	@GetMapping("/part1")
	public String part1() {
		
		return "/first/part1";
	}

	@PostMapping("/filteringPro")
	public String FilterPro() {

		return "redirect:/first/coverletter";
	}
	
	@GetMapping("/coverletter")
	public String coverletter() {

		return "redirect:/first/coverletter";
	}
}
