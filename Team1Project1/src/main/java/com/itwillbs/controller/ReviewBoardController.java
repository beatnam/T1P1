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

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RcBoardDTO;
import com.itwillbs.domain.RiBoardDTO;
import com.itwillbs.service.CommentService;
import com.itwillbs.service.ManagerService;
import com.itwillbs.service.ReviewBoardService;

@Controller
@RequestMapping("/rvborad/*")
public class ReviewBoardController {

	@Inject
	private ReviewBoardService reviewBoardService;

	@Inject
	private CommentService commentService;

	@Inject
	private ManagerService managerService;

	@GetMapping("/rilist")
	public String riList(HttpServletRequest request, Model model) {
		System.out.println("ReviewBoardController rilist()");

		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		//검색어 설정
		String search = request.getParameter("search");
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setSearch(search);
		List<Map<String, Object>> listRibo = reviewBoardService.riboList(pageDTO);
		int count = reviewBoardService.ricountBoard(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		System.out.println("listRibo : " + listRibo);

		model.addAttribute("listRibo", listRibo);
		model.addAttribute("pageDTO", pageDTO);

		return "/community/reviewinterview_board";
	}

	@GetMapping("/riwrite")
	public String riWrite(HttpSession session, Model model) {
		System.out.println("ReviewBoardController riWite()");
		int num = (int) session.getAttribute("num");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberNum(num);
		memberDTO = reviewBoardService.infoName(memberDTO);
		model.addAttribute("memberDTO", memberDTO);

		return "/community/interviewboard_write";
	}// riWite()

	@PostMapping("/riwritepro")
	public String riwitePro(RiBoardDTO riBoardDTO, HttpSession session) {
		System.out.println("ReviewBoardController riwitePro()");
		int num = (int) session.getAttribute("num");
		riBoardDTO.setMemberNum(num);
		reviewBoardService.riInsertBoard(riBoardDTO);

		return "redirect:/rvborad/rilist";
	}// riWite()

	@GetMapping("/riupdate")
	public String riUpdate(HttpServletRequest request, Model model) {
		System.out.println("ReviewBoardController update()");
		int riNum = Integer.parseInt(request.getParameter("riNum"));
		RiBoardDTO riBoardDTO = reviewBoardService.contentRi(riNum);
		System.out.println("riBoardDTO = " + riBoardDTO);
		model.addAttribute("riBoardDTO", riBoardDTO);
		int num = riBoardDTO.getMemberNum();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberNum(num);
		memberDTO = reviewBoardService.infoName(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		return "/community/interviewboard_update";

	}// update()

	@PostMapping("/riupdatepro")
	public String riupdatePro(HttpServletRequest request) {
		System.out.println("ReviewBoardController update()");
		RiBoardDTO riBoardDTO = new RiBoardDTO();
		riBoardDTO.setRiNum(Integer.parseInt(request.getParameter("riNum"))); // 글 번호
		riBoardDTO.setRiSubject(request.getParameter("riSubject")); // 글 제목
		riBoardDTO.setRiContent(request.getParameter("riContent")); // 글 내용
		riBoardDTO.setMemberNum(Integer.parseInt(request.getParameter("memberNum"))); // 작성자

		reviewBoardService.riupdatePro(riBoardDTO);

		return "redirect:/rvborad/rilist";
	}// update()

	@GetMapping("/rclist")
	public String rcList(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("ReviewBoardController rcList()");

		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		//검색어 설정
		String search = request.getParameter("search");
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setSearch(search);
		List<Map<String, Object>> listRcbo = reviewBoardService.rcboList(pageDTO);
		int count = reviewBoardService.rccountBoard(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("listRcbo", listRcbo);
		model.addAttribute("pageDTO", pageDTO);

		return "/community/reviwcomment_board";
	}// list()

	@GetMapping("/rcupdate")
	public String rcUpdate(Model model, HttpServletRequest request) {
		System.out.println("ReviewBoardController rcUpdate()");
		int reNum = Integer.parseInt(request.getParameter("reNum"));
		RcBoardDTO rcBoardDTO = reviewBoardService.contentRc(reNum);
		System.out.println("rcBoardDTO = " + rcBoardDTO);
		model.addAttribute("rcBoardDTO", rcBoardDTO);

		int num = rcBoardDTO.getMemberNum();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberNum(num);
		memberDTO = reviewBoardService.infoName(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		return "/community/commentboard_update";
	}// update()

	@PostMapping("/rcupdatepro")
	public String rcupdatePro(HttpServletRequest request, Model model) {
		System.out.println("ReviewBoardController rcupdatePro()");
		RcBoardDTO rcBoardDTO = new RcBoardDTO();
		rcBoardDTO.setReNum(Integer.parseInt(request.getParameter("reNum"))); // 글 번호
		rcBoardDTO.setReSubject(request.getParameter("reSubject")); // 글 제목
		rcBoardDTO.setReContent(request.getParameter("reContent")); // 글 내용
		rcBoardDTO.setMemberNum(Integer.parseInt(request.getParameter("memberNum"))); // 작성자

		reviewBoardService.rcupdatePro(rcBoardDTO);

		return "redirect:/rvborad/rclist";
	}// update()

	@GetMapping("/rcwrite")
	public String rcWrite(HttpSession session, Model model) {
		System.out.println("ReviewBoardController rcWrite()");
		int num = (int) session.getAttribute("num");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberNum(num);
		memberDTO = reviewBoardService.infoName(memberDTO);
		model.addAttribute("memberDTO", memberDTO);

		return "/community/commentboard_write";
	}// write()

	@PostMapping("/rcwritepro")
	public String rcwitePro(RcBoardDTO rcBoardDTO, HttpSession session) {
		System.out.println("ReviewBoardController rcwitePro()");
		int num = (int) session.getAttribute("num");
		rcBoardDTO.setMemberNum(num);
		reviewBoardService.rcInsertBoard(rcBoardDTO);

		return "redirect:/rvborad/rclist";
	}// riWite()

	@GetMapping("/ricontent")
	public String riContent(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("ReviewBoardController riContent()");
		int riNum = Integer.parseInt(request.getParameter("riNum"));
		reviewBoardService.updateRiReadcount(riNum);
		RiBoardDTO riBoardDTO = reviewBoardService.contentRi(riNum);
		System.out.println("riBoardDTO = " + riBoardDTO);
		model.addAttribute("riBoardDTO", riBoardDTO);

		int num = riBoardDTO.getMemberNum();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberNum(num);
		memberDTO = reviewBoardService.infoName(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		List<Map<String, Object>> riComments = commentService.getriCommentsByReNum(riNum);
		model.addAttribute("riComments", riComments);
		return "/community/interviewboard_content";
	}// content()

	@GetMapping("/rccontent")
	public String rcContent(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("ReviewBoardController ciContent()");
		int reNum = Integer.parseInt(request.getParameter("reNum"));
		reviewBoardService.updateRcReadcount(reNum);
		RcBoardDTO rcBoardDTO = reviewBoardService.contentRc(reNum);
		System.out.println("rcBoardDTO = " + rcBoardDTO);
		model.addAttribute("rcBoardDTO", rcBoardDTO);

		int num = rcBoardDTO.getMemberNum();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberNum(num);
		memberDTO = reviewBoardService.infoName(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		List<Map<String, Object>> comments = commentService.getCommentsByReNum(reNum);
		model.addAttribute("comments", comments);
		return "/community/commentboard_content";
	}// content()

	@GetMapping("/ridelete")
	public String riDelete(HttpServletRequest request) {
		int riNum = Integer.parseInt(request.getParameter("riNum"));
		reviewBoardService.rideleteBo(riNum);
		return "redirect:/rvborad/rilist";
	}

	@GetMapping("/rcdelete")
	public String rcDelete(HttpServletRequest request) {
		int reNum = Integer.parseInt(request.getParameter("reNum"));
		reviewBoardService.rcdeleteBo(reNum);
		return "redirect:/rvborad/rclist";
	}

	@GetMapping("/FAQ")
	public String contentFAQ(Model model) {

		List<Map<Object, Object>> listFAQ = managerService.listFAQ();
		model.addAttribute("listFAQ", listFAQ);
		return "/community/FAQ";
	}

}
