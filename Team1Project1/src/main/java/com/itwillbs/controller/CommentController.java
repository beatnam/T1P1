package com.itwillbs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.RcBoardCMDTO;
import com.itwillbs.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

//    // 댓글 조회
//    @GetMapping("/list")
//    public String listComments(@RequestParam("re_num") int reNum, Model model) {
//        List<RcBoardCMDTO> comments = commentService.getCommentsByReNum(reNum);
//        model.addAttribute("comments", comments);
//        model.addAttribute("re_num", reNum);
//        return "/rvborad/";
//    }

    // 댓글 삽입
    @PostMapping("/add")
    public String addComment(@RequestParam("re_num") int reNum,
                             @RequestParam("ce_content") String ceContent,
                             HttpSession session) {
    	System.out.println("add = " + reNum + " : " + ceContent );
        int memberNum = (int) session.getAttribute("num");
        RcBoardCMDTO rcBoardCMDTO = new RcBoardCMDTO();
        rcBoardCMDTO.setReNum(reNum);
        rcBoardCMDTO.setCeContent(ceContent);
        rcBoardCMDTO.setMemberNum(memberNum);
        System.out.println("rcBoardCMDTO = " + rcBoardCMDTO);
        commentService.addComment(rcBoardCMDTO);
        return "redirect:/rvborad/rccontent?reNum=" + reNum;
    }
    
    // 댓글 수정
    @PostMapping("/update")
    public String updateComment(@RequestParam("ce_id") int ceId,
                                @RequestParam("ce_content") String ceContent) {
    	RcBoardCMDTO rcBoardCMDTO = new RcBoardCMDTO();
    	rcBoardCMDTO.setCeId(ceId);
    	rcBoardCMDTO.setCeContent(ceContent);
        commentService.updateComment(rcBoardCMDTO);
        return "redirect:/rvborad/rccontent?reNum=" + rcBoardCMDTO.getReNum();
    }

    // 댓글 삭제
    @PostMapping("/delete")
    public String deleteComment(@RequestParam("ce_id") int ceId,
    							@RequestParam("re_num") int reNum) {
    	
        commentService.deleteComment(ceId);
        return "redirect:/rvborad/rccontent?reNum=" + reNum;
    }
}


