package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.JobDTO;
import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.domain.RecruitDTO;
import com.itwillbs.service.JobService;

@Controller
@RequestMapping("/corplist/*")
public class CoverBoardController {
	
	@Inject
	private JobService jobService;

	
	@GetMapping("/list")
	public String list() {
		System.out.println("CoverBoardController list()");
		
		return "/corporation/cover_list";
	}//list()
	
	@GetMapping("/content")
	public String content() {
		System.out.println("CoverBoardController content()");
		
		return "/corporation/coverlist_content";
	}//content()
	
	@GetMapping("/update")
	public String update(Model model) {
		System.out.println("CoverBoardController write()");
		
		List<OccupationDTO> occupations = jobService.getOccupations();
        for(OccupationDTO occupationDTO : occupations) {
        	System.out.println(occupationDTO);
        }
    	model.addAttribute("occupations", occupations);
		
		return "/corporation/coverlist_update";
	}//update()
	
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
	public String writePro(RecruitDTO recruitDTO) {
		System.out.println("CoverBoardController writePro()");
		
		jobService.insertRecruit(recruitDTO);
		
		
		
		return "redirect:/corplist/list";
	}
	
	@GetMapping("/job")
    @ResponseBody
    public List<JobDTO> getJobsByOccupation(@RequestParam("occupationId") int occupationId) {
		System.out.println(occupationId);
        return jobService.getJobsByOccupation(occupationId);
    }
	
}
