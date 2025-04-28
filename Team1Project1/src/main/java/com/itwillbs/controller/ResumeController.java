package com.itwillbs.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/resume/*")
public class ResumeController {

    @GetMapping("/my-resume-edit")
    public String resumeEdit(){
        return "resume/my-resume-edit";  
    }
    
    @PostMapping("/submit")
    public String resumeSubmit() {
    	return "redirect:/mypage/my-resume";
    }
    
}

