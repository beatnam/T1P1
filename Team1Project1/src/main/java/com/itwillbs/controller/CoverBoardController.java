package com.itwillbs.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.EduHighDTO;
import com.itwillbs.domain.JobDTO;
import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RecruitDTO;
import com.itwillbs.service.JobService;

@Controller
@RequestMapping("/corplist/*")
public class CoverBoardController {
	
	@Inject
	private JobService jobService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@GetMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		System.out.println("CoverBoardController list()");
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<RecruitDTO> listCover = jobService.coverList(pageDTO);
		
		int count = jobService.countBoard(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage -1)/pageBlock * pageBlock + 1; 
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
				
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		System.out.println("RecruitDTO: " + listCover);
		model.addAttribute("listCover", listCover);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/corporation/cover_list";
	}//list()
	
	@GetMapping("/content")
	public String content(Model model, HttpServletRequest request) {
		System.out.println("CoverBoardController content()");
		int recruitId = Integer.parseInt(request.getParameter("recruitId"));
		
		RecruitDTO recruitDTO = jobService.contentBoard(recruitId);
		
		int recruitOccupation = recruitDTO.getRecruitOccupation();
		int recruitJob = recruitDTO.getRecruitJob();
		int recruitEduhigh = recruitDTO.getRecruitEduhigh();
		
		model.addAttribute("recruitDTO", recruitDTO);
		System.out.println("recruitOccupation" + recruitOccupation);
		System.out.println("recruitJob" + recruitJob);
		
		OccupationDTO occupationDTO = new OccupationDTO(); 
		JobDTO jobDTO = new JobDTO();
		EduHighDTO eduHighDTO = new EduHighDTO();
		
		occupationDTO.setOccupationId(recruitOccupation);
		jobDTO.setJobId(recruitJob);
		jobDTO.setOccupationId(recruitOccupation);
		eduHighDTO.setEduhighId(recruitEduhigh);
		System.out.println("occupationDTO" + occupationDTO);
		System.out.println("jobDTO" + jobDTO);
		
		occupationDTO = jobService.occupationNum(occupationDTO);
		jobDTO = jobService.jobNum(jobDTO);
		eduHighDTO = jobService.eduHighName(eduHighDTO);
		
		System.out.println("occupationDTO===" + occupationDTO);
		System.out.println("jobDTO===" + jobDTO);
		
		model.addAttribute("eduHighDTO", eduHighDTO);
		model.addAttribute("occupationDTO", occupationDTO);
		model.addAttribute("jobDTO", jobDTO);
		
		return "/corporation/coverlist_content";
	}//content()
	
	@GetMapping("/update")
	public String update(Model model, HttpServletRequest request) {
		System.out.println("CoverBoardController write()");
		
		List<OccupationDTO> occupations = jobService.getOccupations();
        for(OccupationDTO occupationDTO : occupations) {
        	System.out.println(occupationDTO);
        }
    	model.addAttribute("occupations", occupations);
		
    	int recruitId = Integer.parseInt(request.getParameter("recruitId"));
		
		RecruitDTO recruitDTO = jobService.contentBoard(recruitId);
		
		
		model.addAttribute("recruitDTO", recruitDTO);
		
		return "/corporation/coverlist_update";
	}//update()
	
	@PostMapping("/updatepro")
	public String updatePro(HttpServletRequest request, MultipartFile recruitPhoto) throws IOException {
		System.out.println("CoverBoardController writePro()");
		
		HttpSession session = request.getSession(); //세션값 가져오기
		Integer corpNum = (Integer) session.getAttribute("corpNum"); //현재 세션에서 아이디 num 값 가져옴
	    if (corpNum == null) {
	        System.out.println("⚠ corporationMemberNum이 세션에 없습니다!");
	    } else {
	        System.out.println("✅ 현재 로그인된 사용자 번호: " + corpNum);
	    }
	    //파일 저장 관련
	    UUID uuid = UUID.randomUUID();
	    String filename = uuid + "_" + recruitPhoto.getOriginalFilename();
	    if(recruitPhoto.isEmpty()) {
	    	filename = request.getParameter("oldRecruitPhoto");
	    } else {
	    	FileCopyUtils.copy(recruitPhoto.getBytes(), new File(uploadPath, filename));
	    }
	    
	    //값 보내기
	    RecruitDTO recruitDTO = new RecruitDTO();
	    System.out.println("recruitDTO" + recruitDTO);
	    recruitDTO.setRecruitId(Integer.parseInt(request.getParameter("recruitId")));
	    recruitDTO.setRecruitName(request.getParameter("recruitName"));
	    recruitDTO.setRecruitEduhigh(Integer.parseInt(request.getParameter("recruitEduhigh")));
	    recruitDTO.setRecruitOccupation(Integer.parseInt(request.getParameter("recruitOccupation")));
	    recruitDTO.setRecruitJob(Integer.parseInt(request.getParameter("recruitJob")));
	    recruitDTO.setRecruitSalary(Integer.parseInt(request.getParameter("recruitSalary")));
	    recruitDTO.setRecruitLocation(request.getParameter("recruitLocation"));
	    System.out.println("recruitDTO2" + recruitDTO);
	    
	    String dateStr = request.getParameter("recruitDeatline");

	    if (dateStr != null && !dateStr.isEmpty()) {
	        recruitDTO.setRecruitDeatline(Date.valueOf(dateStr)); // 변환 성공
	    } else {
	        recruitDTO.setRecruitDeatline(Date.valueOf("2025-01-01")); // 기본값 처리 (DB에서 `NULL` 허용해야 함)
	    }
	    recruitDTO.setRecruitWorkday(Integer.parseInt(request.getParameter("recruitWorkday")));
	    recruitDTO.setRecruitContent(request.getParameter("recruitContent"));
	    recruitDTO.setCorporationMemberNum(corpNum);
	    // DB에는 파일 이름이나 전체 경로 등 필요한 정보만 저장
	    recruitDTO.setRecruitPhoto(filename); // DB에 String으로 저장되는 부분
	    System.out.println("recruitDTO3" + recruitDTO);
	    jobService.updateRecruit(recruitDTO);
		
		return "redirect:/corplist/list";
	}
	
	@GetMapping("/write")
	public String write(Model model) {
		System.out.println("CoverBoardController write()");
		
		List<OccupationDTO> occupations = jobService.getOccupations();
        for(OccupationDTO occupationDTO : occupations) {
        	System.out.println(occupationDTO);
        }
    	model.addAttribute("occupations", occupations);
		
		return "/corporation/coverlist_write";
	}//update()
	
	@PostMapping("/writepro")
	public String writePro(HttpServletRequest request, MultipartFile recruitPhoto) throws IOException {
		System.out.println("CoverBoardController writePro()");
		
		HttpSession session = request.getSession(); //세션값 가져오기
		Integer corpNum = (Integer) session.getAttribute("corpNum"); //현재 세션에서 아이디 num 값 가져옴
	    if (corpNum == null) {
	        System.out.println("⚠ corporationMemberNum이 세션에 없습니다!");
	    } else {
	        System.out.println("✅ 현재 로그인된 사용자 번호: " + corpNum);
	    }

	    //파일 저장 관련
	    UUID uuid = UUID.randomUUID();
	    String filename = uuid + "_" + recruitPhoto.getOriginalFilename();
		FileCopyUtils.copy(recruitPhoto.getBytes(), new File(uploadPath, filename));
	    
	    //값 보내기
	    RecruitDTO recruitDTO = new RecruitDTO();
	    System.out.println("recruitDTO" + recruitDTO);
	    recruitDTO.setRecruitName(request.getParameter("recruitName"));
	    recruitDTO.setRecruitEduhigh(Integer.parseInt(request.getParameter("recruitEduhigh")));
	    recruitDTO.setRecruitOccupation(Integer.parseInt(request.getParameter("recruitOccupation")));
	    recruitDTO.setRecruitJob(Integer.parseInt(request.getParameter("recruitJob")));
	    recruitDTO.setRecruitSalary(Integer.parseInt(request.getParameter("recruitSalary")));
	    recruitDTO.setRecruitLocation(request.getParameter("recruitLocation"));
	    System.out.println("recruitDTO2" + recruitDTO);
	    
	    recruitDTO.setRecruitWorkday(Integer.parseInt(request.getParameter("recruitWorkday")));
	    recruitDTO.setRecruitContent(request.getParameter("recruitContent"));
	    recruitDTO.setCorporationMemberNum(corpNum);
	    // DB에는 파일 이름이나 전체 경로 등 필요한 정보만 저장
	    recruitDTO.setRecruitPhoto(filename); // DB에 String으로 저장되는 부분
	    String dateStr = request.getParameter("recruitDeatline");

	    if (dateStr != null && !dateStr.isEmpty()) {
	        try {
	            recruitDTO.setRecruitDeatline(Date.valueOf(dateStr));
	        } catch (IllegalArgumentException e) {
	            System.out.println("⚠ 올바르지 않은 날짜 형식: " + dateStr);
	            recruitDTO.setRecruitDeatline(Date.valueOf("2025-01-01")); // 기본값 처리
	        }
	    } else {
	        recruitDTO.setRecruitDeatline(Date.valueOf("2025-01-01")); // 기본값 처리
	    }
	    System.out.println("recruitDTO3" + recruitDTO);
	    jobService.insertRecruit(recruitDTO);
		
		return "redirect:/corplist/list";
	}
	
	@GetMapping("/job")
    @ResponseBody
    public List<JobDTO> getJobsByOccupation(@RequestParam("occupationId") int occupationId) {
		System.out.println(occupationId);
        return jobService.getJobsByOccupation(occupationId);
    }
	
	@GetMapping("/delete")
	public String delete(HttpServletRequest request) {
		System.out.println("BoardController delete()");
		int recruitId = Integer.parseInt(request.getParameter("recruitId"));
		
		jobService.deleteBoard(recruitId);
		
		return "redirect:/corplist/list";
	}//delete()
	
}
