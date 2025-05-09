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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.ApplicationDTO;
import com.itwillbs.domain.CorporationDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RecruitDTO;
import com.itwillbs.service.CorpMemberService;
import com.itwillbs.service.CorporationService;
import com.itwillbs.service.JobService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/corpmain/*")
public class CorpMemberController {
	
	@Inject
	private CorporationService corporationService;
	
	@Inject
	private JobService jobService;
	
	@Inject
	private CorpMemberService corpMemberService;
	
	@GetMapping("/main")
	public String main(HttpSession session, Model model) {
		System.out.println("corpmembercontroller main()");
		
		String corporationMemberId = (String)session.getAttribute("id");
		
		CorporationDTO corporationDTO = corpMemberService.corpInfo(corporationMemberId);
		System.out.println(corporationDTO);
		model.addAttribute("corporationDTO", corporationDTO);
		
		return "/corporation/corporation_main";
	}//corporationMain()
	
	@GetMapping("/update")
	public String update(HttpSession session, Model model) {
		System.out.println("corpmembercontroller update()");
		
		String corporationMemberId = (String)session.getAttribute("id");
		
		CorporationDTO corporationDTO = corpMemberService.corpInfo(corporationMemberId);
		System.out.println(corporationDTO);
		model.addAttribute("corporationDTO", corporationDTO);
		
		return "/corporation/corporationmain_update";
	}//update()
	
	@PostMapping("/updatepro")
	public String updatePro(HttpSession session, Model model, CorporationDTO corporationDTO) {
		System.out.println("corpmembercontroller updatePro()");
		
		System.out.println("corporationDTO : " + corporationDTO);
		corpMemberService.updateMember(corporationDTO);
		
		return "redirect:/corpmain/main";
	}//update()
	
	@GetMapping("/openresume")
	public String openResume(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("corpmembercontroller openResume()");
		Integer corpNum = (Integer) session.getAttribute("corpNum");
		System.out.println("corpNum : " + corpNum);
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
		pageDTO.setCorporationMemberNum(corpNum);
		
		List<Map<String, Object>> listResume = jobService.resumeList(pageDTO);

		int count = jobService.countResume(pageDTO);
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

		model.addAttribute("listResume", listResume);
		model.addAttribute("pageDTO", pageDTO);
		return "/corporation/open_resume";
	}//openResume()
	
	@GetMapping("/coverletter")
	public String coverLetter(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("corpmembercontroller coverLetter()");
		Integer corpNum = (Integer) session.getAttribute("corpNum");
		System.out.println("corpNum : " + corpNum);
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
		pageDTO.setCorporationMemberNum(corpNum);
		
		List<Map<String, Object>> listResume = jobService.resumeList(pageDTO);

		int count = jobService.countResume(pageDTO);
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

		model.addAttribute("listResume", listResume);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/corporation/cover_letter";
	}//coverLetter()
	
	@GetMapping("/applyresume")
	public String applyResume(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("corpmembercontroller applyResume()");
		Integer corpNum = (Integer) session.getAttribute("corpNum");
		System.out.println("corpNum : " + corpNum);
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
		pageDTO.setCorporationMemberNum(corpNum);
		
		List<Map<String, Object>> listResume = jobService.resumeList(pageDTO);

		int count = jobService.countResume(pageDTO);
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

		model.addAttribute("listResume", listResume);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/corporation/apply_resume";
	}//applyResume()
	
	@PostMapping("/approve")
	public String approve(@RequestBody Map<String, Object> requestData) {
	    List<String> applicationIds = (List<String>) requestData.get("application_ids"); // 선택한 지원서 ID 리스트
	    String status = (String) requestData.get("status"); // 'Y' 또는 'N'

	    jobService.updateApplicationStatus(applicationIds, status); // 서비스 호출

	    return "redirect:/corpmain/applyresume"; // 리디렉션 처리
	}
	
	@GetMapping("/applyemail")
	public String applyEmail() {
		System.out.println("corpmembercontroller applyEmail()");
		
		return "/corporation/email_apply";
	}//applyResume()
	
}
