package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.JobDTO;
import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.service.JobService;

@Controller
@RequestMapping("/coplist/*")
public class CoverBoardController {
	
	@Inject
	private JobService jobService;

	
	@GetMapping("/list")
	public String list() {
		System.out.println("copmembercontroller list()");
		
		return "/coporation/cover_list";
	}//list()
	
	@GetMapping("/content")
	public String content() {
		System.out.println("copmembercontroller content()");
		
		return "/coporation/coverlist_content";
	}//content()
	
	@GetMapping("/update")
	public String update() {
		System.out.println("copmembercontroller update()");
		
		return "/coporation/coverlist_update";
	}//update()
	
	@GetMapping("/write")
	public String write(Model model) {
		System.out.println("copmembercontroller write()");
		
		List<OccupationDTO> occupations = jobService.getOccupations();
        for(OccupationDTO occupationDTO : occupations) {
        	System.out.println(occupationDTO);
        }
    	model.addAttribute("occupations", occupations);
		
		return "/coporation/coverlist_write";
	}//update()
	
	@GetMapping("/job")
    @ResponseBody
    public List<JobDTO> getJobsByOccupation(@RequestParam("occupationId") int occupationId) {
        return jobService.getJobsByOccupation(occupationId);
    }
}
