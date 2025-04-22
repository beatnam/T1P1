package com.itwillbs.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/copmain/*")
public class CopMemberController {
	
	@GetMapping("/main")
	public String main() {
		System.out.println("copmembercontroller copmain()");
		
		return "/coporation/coporation_main";
	}//coporationmain()
	
	@GetMapping("/update")
	public String update() {
		System.out.println("copmembercontroller update()");
		
		return "/coporation/coporationmain_update";
	}//update()
	
	@GetMapping("/openresume")
	public String openResume() {
		System.out.println("copmembercontroller openResume()");
		
		return "/coporation/open_resume";
	}//openResume()
	
	@GetMapping("/coverletter")
	public String coverLetter() {
		System.out.println("copmembercontroller coverLetter()");
		
		return "/coporation/cover_letter";
	}//coverLetter()
	
	@GetMapping("/applyresume")
	public String applyResume() {
		System.out.println("copmembercontroller applyResume()");
		
		return "/coporation/apply_resume";
	}//applyResume()
	
	@PostMapping("/refresh")
    public ResponseEntity<Map<String, String>> refresh() {
        // 여기서 데이터 갱신 로직 수행 (예: DB 업데이트)
        // 예제에서는 단순히 메시지를 반환
        
        Map<String, String> response = new HashMap<>();
        response.put("message", "데이터 갱신 완료");

        return ResponseEntity.ok(response);
    }
	
	
}
