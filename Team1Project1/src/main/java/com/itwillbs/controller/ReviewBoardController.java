package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rvborad/*")
public class ReviewBoardController {
	
	@GetMapping("/rilist")
	public String riList() {
		System.out.println("ReviewBoardController list()");
		
		return "/community/reviewinterview_board";
	}//list()
	
	@GetMapping("/rclist")
	public String ciList() {
		System.out.println("ReviewBoardController list()");
		
		return "/community/reviwcomment_board";
	}//list()
	
	@GetMapping("/riupdate")
	public String riUpdate() {
		System.out.println("ReviewBoardController update()");
		
		return "/community/interviewboard_update";
	}//update()
	
	@GetMapping("/rcupdate")
	public String ciUpdate() {
		System.out.println("ReviewBoardController update()");
		
		return "/community/commentboard_update";
	}//update()
	
	@GetMapping("/riwrite")
	public String riWrite() {
		System.out.println("ReviewBoardController write()");
		
		return "/community/interviewboard_write";
	}//write()
	
	@GetMapping("/rcwrite")
	public String rcWrite() {
		System.out.println("ReviewBoardController rcWrite()");
		
		return "/community/commentboard_write";
	}//write()
	
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
