package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

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
    private final JobService jobService;

    public JobController(JobService jobService) {
        this.jobService = jobService;
    }

    @GetMapping("/occupation")
    public String getOccupations(Model model) {
        List<OccupationDTO> occupations = jobService.getOccupations();
        model.addAttribute("occupations", occupations);
        return "occupation"; // occupation.html로 이동
    }

    @GetMapping("/job")
    @ResponseBody
    public List<JobDTO> getJobsByOccupation(@RequestParam("occupationId") int occupationId) {
        return jobService.getJobsByOccupation(occupationId);
    }
}

