package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.service.ManagerService;

@RestController
public class AjaxController {

	@Inject
	private ManagerService managerService;

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
}
