package com.itwillbs.controller;

import java.util.List;

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
import com.itwillbs.service.ReviewBoardService;

@Controller
@RequestMapping("/rvborad/*")
public class ReviewBoardController {
	
	@Inject
	private ReviewBoardService reviewBoardService;
	
	@GetMapping("/rilist")
	public String riList(HttpServletRequest request, Model model) {
	    System.out.println("ReviewBoardController rilist()");
	    
	    int pageSize = 10;
	    String pageNum = request.getParameter("pageNum");
	    if (pageNum == null) {
	        pageNum = "1";
	    }
	    int currentPage = Integer.parseInt(pageNum);

	    PageDTO pageDTO = new PageDTO();
	    pageDTO.setPageSize(pageSize);
	    pageDTO.setPageNum(pageNum);
	    pageDTO.setCurrentPage(currentPage);
	    List<RiBoardDTO> listRibo = reviewBoardService.riboList(pageDTO);
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
	}//riWite()
	
	@PostMapping("/riwritepro")
	public String riwitePro(RiBoardDTO riBoardDTO, HttpSession session) {
		System.out.println("ReviewBoardController riwitePro()");
		int num = (int) session.getAttribute("num");
		riBoardDTO.setMemberNum(num);
		reviewBoardService.riInsertBoard(riBoardDTO);
		
		return "redirect:/rvborad/rilist";
	}//riWite()
	
	@GetMapping("/riupdate")
	public String riUpdate(HttpSession session, Model model) {
		System.out.println("ReviewBoardController update()");
		int num = (int) session.getAttribute("num");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberNum(num);
		memberDTO = reviewBoardService.infoName(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		
		return "/community/interviewboard_update";
	}//update()
	
	@GetMapping("/rclist")
	public String rcList(HttpServletRequest request, Model model) {
		System.out.println("ReviewBoardController rcList()");
		
		int pageSize = 10;
	    String pageNum = request.getParameter("pageNum");
	    if (pageNum == null) {
	        pageNum = "1";
	    }
	    int currentPage = Integer.parseInt(pageNum);

	    PageDTO pageDTO = new PageDTO();
	    pageDTO.setPageSize(pageSize);
	    pageDTO.setPageNum(pageNum);
	    pageDTO.setCurrentPage(currentPage);
	    List<RcBoardDTO> listRcbo = reviewBoardService.rcboList(pageDTO);
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
	}//list()
	
	@GetMapping("/rcupdate")
	public String ciUpdate() {
		System.out.println("ReviewBoardController ciUpdate()");
		
		return "/community/commentboard_update";
	}//update()
	
	@GetMapping("/rcwrite")
	public String rcWrite(HttpSession session, Model model) {
		System.out.println("ReviewBoardController rcWrite()");
		int num = (int) session.getAttribute("num");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberNum(num);
		memberDTO = reviewBoardService.infoName(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		
		return "/community/commentboard_write";
	}//write()
	
	@PostMapping("/rcwritepro")
	public String rcwitePro(RcBoardDTO rcBoardDTO, HttpSession session) {
		System.out.println("ReviewBoardController rcwitePro()");
		int num = (int) session.getAttribute("num");
		rcBoardDTO.setMemberNum(num);
		reviewBoardService.rcInsertBoard(rcBoardDTO);
		
		return "redirect:/rvborad/rclist";
	}//riWite()
	
	@GetMapping("/ricontent")
	public String riContent() {
		System.out.println("ReviewBoardController riContent()");
		
		return "/community/interviewboard_content";
	}//content()
	
	@GetMapping("/rccontent")
	public String ciContent() {
		System.out.println("ReviewBoardController ciContent()");
		
		return "/community/commentboard_content";
	}//content()
	
	
	
}
