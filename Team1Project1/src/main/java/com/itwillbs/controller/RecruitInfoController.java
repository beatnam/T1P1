package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.ManagerService;

@Controller
@RequestMapping("/recruit_info/*")
public class RecruitInfoController {

	@Inject
	private ManagerService managerService;

	@GetMapping("/always_list")
	public String alwaysList(HttpServletRequest request, Model model) {

		// 상시채용 공고
		System.out.println("ProgramController program()");
		int pageSize = 12;
		String pageNum = request.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		PageDTO pageDTO = new PageDTO();

		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		// pageDTO.setSearch(search);

		List<Map<String, Object>> recruitList = managerService.listRecruit(pageDTO);

		// 게시판 전체 글개수
		int count = managerService.countRecruit();
		// 검색어 포함한 글 개수
//		int count = boardService.countBoard(pageDTO);

		// 한 화면에 보여줄 페이지 개수
		int pageBlock = 5;

		// 한 화면에 보여줄 시작페이지 번호
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;

		// 한 화면에 보여줄 끝페이지 번호
		int endPage = startPage + pageBlock - 1;

		// 전체 페이지 개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("recruitList", recruitList);
		return "recruit_info/always_list";
	}

	@GetMapping("/always_content")
	public String alwaysContent(@RequestParam int recruitId, Model model) {
		System.out.println("RecruitInfoController alwaysContent()");

		Map<Object, Object> recruitContent = managerService.contentRecruit(recruitId);

		model.addAttribute("recruitContent", recruitContent);
		return "recruit_info/always_content";
	}

	@GetMapping("/fair")
	public String fair() {

		return "recruit_info/fair";
	}

	@GetMapping("/open")
	public String open(Model model) {

		List<Map<Object, Object>> ORlist = managerService.listOR();

		model.addAttribute("ORlist", ORlist);

		return "recruit_info/open";
	}

}
