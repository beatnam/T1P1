package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.ManagerService;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	@Inject
	private ManagerService managerService;

	@GetMapping("/recruit_mng")
	public String recruitMng(HttpServletRequest request, Model model) {
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

		List<Map<String, Object>> recruitList = managerService.listRecruit();

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
		
		
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("recruitList", recruitList);

		return "/manager/ecruit_mng";

	}

	@GetMapping("/board_mng")
	public String boardMng() {

		return "/manager/board_mng";
	}

	@GetMapping("/fair_mng")
	public String fairMng() {

		return "/manager/fair_mng";
	}

	@GetMapping("/fair_update")
	public String fairUpdate() {

		return "/manager/fair_update";
	}

	@GetMapping("/fair_write")
	public String fairWrite() {

		return "/manager/fair_write";
	}

	@GetMapping("/FAQ_mng")
	public String faqMng() {

		return "/manager/FAQ_mng";
	}

	@GetMapping("/faq_write")
	public String faqWrite() {

		return "/manager/faq_write";
	}

	@GetMapping("/member_mng")
	public String memberMng(HttpServletRequest request, Model model) {
		System.out.println("ManagerController memberMng()");

		// 한 화면에 보여줄 글 개수 설정 10개
		int pageSize = 20;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		String search = request.getParameter("search");

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		// pageDTO.setSearch(search);

		List<MemberDTO> memberList = managerService.listMember(pageDTO);

		// 게시판 전체 글개수
//		int count = boardService.countBoard();
		// 검색어 포함한 글 개수
		int count = managerService.countMember();

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

		model.addAttribute("memberList", memberList);
		model.addAttribute("pageDTO", pageDTO);
		return "/manager/member_mng";
	}

	@GetMapping("/copmember_mng")
	public String copMemberMng() {

		return "/manager/copmember_mng";
	}

	@GetMapping("/openrecruit_mng")
	public String openrecruitMng() {

		return "/manager/openrecruit_mng";
	}

	@GetMapping("/openrecruit_update")
	public String openrecruitUpdate() {

		return "/manager/openrecruit_update";
	}

	@GetMapping("/openrecruit_write")
	public String openrecruitWrite() {

		return "/manager/openrecruit_write";
	}

	@PostMapping("/openrecruit_writePro")
	public String openrecruitWritePro() {

		return "redirect:/manager/openrecruit_mng";
	}

	@GetMapping("/review_employment_mng")
	public String reviewEmploymentMng() {

		return "/manager/review_employment_mng";
	}

	@GetMapping("/review_interview_mng")
	public String reviewInterviewMng() {

		return "/manager/review_interview_mng";
	}
}
