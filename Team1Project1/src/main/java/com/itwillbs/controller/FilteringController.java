package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/first/*")
public class FilteringController {

	@PostMapping("/filteringPro")
	public String FilterPro() {

		return "redirect:/coverletter";
	}
}
