package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.service.GPTService;

@Controller
public class GPTController {

	@Inject
	private GPTService gptService;

	@GetMapping(value = "/first/keyword", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String keyword(@RequestParam String name, Model model) {
		System.out.println("GPTController keyword()");
		String prompt = name + "의 인재상 알려줘";
		String result = gptService.askKeyword(prompt);
		
		System.out.println(result);
		
		return result;
	}

}
