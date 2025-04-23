package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.JobDTO;
import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.service.JobService;

@Controller
public class JobController {
    
	@Inject
	private JobService jobService;

    @GetMapping("/occupation")
    public String getOccupations(Model model) {
        System.out.println("JobController getOccupations()");
    	List<OccupationDTO> occupations = jobService.getOccupations();
        for(OccupationDTO occupationDTO : occupations) {
        	System.out.println(occupationDTO);
        }
    	model.addAttribute("occupations", occupations);
        return "coverlist_write"; // occupation.html로 이동
    }

    @GetMapping("/job")
    @ResponseBody
    public List<JobDTO> getJobsByOccupation(@RequestParam("occupationId") int occupationId) {
        return jobService.getJobsByOccupation(occupationId);
    }
}

