package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.domain.OpenrecruitDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.JobService;
import com.itwillbs.service.ManagerService;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	@Inject
	private JobService jobService;
	@Inject
	private ManagerService managerService;

	@GetMapping("/recruit_mng")
	public String recruitMng(HttpServletRequest request, Model model) {
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

		return "/manager/recruit_mng";

	}

	@GetMapping("/recruit_delete")
	public String deleteRecruit(@RequestParam int recruitId) {
		System.out.println("ManagerController deleteRecruit()");
		managerService.deleteRecruit(recruitId);

		return "redirect:/manager/recruit_mng";
	}

	@GetMapping("/openrecruit_delete")
	public String deleteOpenRecruit(@RequestParam int orId) {
		System.out.println("ManagerController deleteOpenRecruit()");
		managerService.deleteOpenRecruit(orId);

		return "redirect:/manager/openrecruit_mng";
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
	public String FAQMng(Model model) {
		System.out.println("ManagerController FAQMng()");

		List<Map<Object, Object>> listFAQ = managerService.listFAQ();
		model.addAttribute("listFAQ", listFAQ);
		return "/manager/FAQ_mng";
	}

	@GetMapping("/FAQ_write")
	public String FAQWrite() {

		return "/manager/FAQ_write";
	}

	@PostMapping("/FAQ_writePro")
	public String FAQWritePro(@RequestParam Map<Object, Object> faq) {
		System.out.println("ManagerController FAQWritePro()");

		managerService.insertFAQ(faq);

		return "redirect:/manager/FAQ_mng";
	}

	@GetMapping("/FAQ_update")
	public String FAQUpdate(@RequestParam int faqNum, Model model) {

		Map<Object, Object> FAQ = managerService.contentFAQ(faqNum);

		model.addAttribute("FAQ", FAQ);

		return "/manager/FAQ_update";
	}

	@PostMapping("/FAQ_updatePro")
	public String FAQUpdatePro(@RequestParam Map<Object, Object> faq) {
		System.out.println("ManagerController FAQUpdatePro()");
		managerService.updateFAQ(faq);

		return "redirect:/manager/FAQ_mng";
	}

	@GetMapping("/FAQ_delete")
	public String FAQDelete(@RequestParam int faqNum) {
		System.out.println("ManagerController FAQDelete()");
		managerService.deleteFAQ(faqNum);

		return "redirect:/manager/FAQ_mng";
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

	@GetMapping("/deleteMember")
	public String deleteMember(@RequestParam String memberId) {
		System.out.println(memberId);

		managerService.deleteMember(memberId);
		return "redirect:/manager/member_mng";
	}

	@GetMapping("/copmember_mng")
	public String copMemberMng(HttpServletRequest request, Model model) {
//		List<Map<String, Object>> copmemList = managerService.listCopMember();
//		
//		model.addAttribute("copmemList",copmemList);

		return "/manager/copmember_mng";
	}

	@GetMapping("/openrecruit_mng")
	public String openrecruitMng(Model model) {

		List<Map<Object, Object>> ORlist = managerService.listOR();

		model.addAttribute("ORlist", ORlist);

		System.out.println(ORlist);
		return "/manager/openrecruit_mng";
	}

	@GetMapping("/openrecruit_write")
	public String openrecruitWrite(Model model, HttpSession session) {
		List<OccupationDTO> occupations = jobService.getOccupations();

		model.addAttribute("occupations", occupations);
		return "/manager/openrecruit_write";
	}

	@PostMapping("/openrecruit_writePro")
	public String openrecruitWritePro(HttpServletRequest request, OpenrecruitDTO openrecruitDTO) {

		System.out.println("ManagerController openrecruitWritePro()");
		int memberNum = Integer.parseInt(request.getParameter("memberNum"));
		openrecruitDTO.setMemberNum(memberNum);
		System.out.println(openrecruitDTO);
		managerService.insertOR(openrecruitDTO);

		return "redirect:/manager/openrecruit_mng";
	}

	@GetMapping("/openrecruit_update")
	public String openrecruitUpdate(@RequestParam int orId, Model model) {
		List<OccupationDTO> occupations = jobService.getOccupations();

		model.addAttribute("occupations", occupations);
		Map<Object, Object> contentOR = managerService.contentOR(orId);

		model.addAttribute("contentOR", contentOR);
		return "/manager/openrecruit_update";
	}

	@PostMapping("/openrecruit_updatePro")
	public String openrecruitUpdatePro(@RequestParam Map<Object, Object> updateOR) {
		System.out.println(updateOR);

		managerService.updateOR(updateOR);
		return "redirect:/manager/openrecruit_mng";
	}

	@GetMapping("/upgradeCorp")
	public String upgradeCorp(@RequestParam String corpId) {
		System.out.println("AjaxController updateCorp()");
		managerService.upgradeCorp(corpId);

		return "redirect:/manager/copmember_mng";
	}
	
	@GetMapping("/downgradeCorp")
	public String downgradeCorp(@RequestParam String corpId) {
		System.out.println("AjaxController updateCorp()");
		managerService.downgradeCorp(corpId);

		return "redirect:/manager/copmember_mng";
	}
	

	@GetMapping("/content_corp")
	public String contentCorp(@RequestParam String corpId, Model model) {

		Map<Object, Object> corporation = managerService.contentCorp(corpId);

		model.addAttribute("corporation", corporation);
		return "/manager/content_copmember";
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
