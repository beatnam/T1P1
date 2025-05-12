package com.itwillbs.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customerService")
public class CustomerController {

    @GetMapping("/customerService")
    public String showTerms(HttpServletRequest request) {
        // 약관 내용 가져오기 로직
        request.setAttribute("terms", "약관 내용입니다");
        return "customerService/customerService";
    }
}