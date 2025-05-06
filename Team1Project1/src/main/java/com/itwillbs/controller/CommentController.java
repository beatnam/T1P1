package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.RcBoardCMDTO;
import com.itwillbs.domain.RiBoardCMDTO;
import com.itwillbs.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;
    
    //취업 후기 댓글
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
    public String updateComment(@RequestParam("re_num") int reNum,
    							@RequestParam("ce_id") int ceId,
                                @RequestParam("ce_content") String ceContent) {
    	RcBoardCMDTO rcBoardCMDTO = new RcBoardCMDTO();
    	rcBoardCMDTO.setCeId(ceId);
    	rcBoardCMDTO.setCeContent(ceContent);
    	System.out.println("rcBoardCMDTO = " + rcBoardCMDTO);
        commentService.updateComment(rcBoardCMDTO);
        return "redirect:/rvborad/rccontent	?reNum=" + reNum;
    }

    // 댓글 삭제
    @PostMapping("/delete")
    public String deleteComment(@RequestParam("ce_id") int ceId,
    							@RequestParam("re_num") int reNum) {
    	
        commentService.deleteComment(ceId);
        return "redirect:/rvborad/rccontent?reNum=" + reNum;
    }
    //면접후기 댓글
 // 댓글 삽입
    @PostMapping("/riadd")
    public String addriComment(@RequestParam("ri_num") int riNum,
                             @RequestParam("ci_content") String ciContent,
                             HttpSession session) {
    	System.out.println("riadd = " + riNum + " : " + ciContent );
        int memberNum = (int) session.getAttribute("num");
        RiBoardCMDTO riBoardCMDTO = new RiBoardCMDTO();
        riBoardCMDTO.setRiNum(riNum);
        riBoardCMDTO.setCiContent(ciContent);
        riBoardCMDTO.setMemberNum(memberNum);
        System.out.println("riBoardCMDTO = " + riBoardCMDTO);
        System.out.println("riBoardCMDTO = " + riBoardCMDTO);
        commentService.addriComment(riBoardCMDTO);
        return "redirect:/rvborad/ricontent?riNum=" + riNum;
    }
    
    // 댓글 수정
    @PostMapping("/riupdate")
    public String updateriComment(@RequestParam("ri_num") int riNum,
    							@RequestParam("ci_id") int ciId,
                                @RequestParam("ci_content") String ciContent) {
    	RiBoardCMDTO riBoardCMDTO = new RiBoardCMDTO();
    	riBoardCMDTO.setCiId(ciId);
    	riBoardCMDTO.setCiContent(ciContent);
    	System.out.println("riBoardCMDTO = " + riBoardCMDTO);
        commentService.updateriComment(riBoardCMDTO);
        
        return "redirect:/rvborad/ricontent?riNum=" + riNum;
    }

    // 댓글 삭제
    @PostMapping("/ridelete")
    public String deleteriComment(@RequestParam("ci_id") int ciId,
    							@RequestParam("ri_num") int riNum) {
    	
        commentService.deleteriComment(ciId);
        return "redirect:/rvborad/ricontent?riNum=" + riNum;
    }
    
    @PostMapping("/rirepliesadd")
    public String addriReplies(@RequestParam("ri_num") int riNum,
    						@RequestParam("parent_id") int parentId,
				            @RequestParam("ci_content") String ciContent,
				            HttpSession session) {
    	int memberNum = (int) session.getAttribute("num");
		RiBoardCMDTO riBoardCMDTO = new RiBoardCMDTO();
		riBoardCMDTO.setRiNum(riNum);
		riBoardCMDTO.setCiContent(ciContent);
		riBoardCMDTO.setParentId(parentId);
		riBoardCMDTO.setMemberNum(memberNum);
		System.out.println("riBoardCMDTO = " + riBoardCMDTO);
		commentService.addriReplies(riBoardCMDTO);
		return "redirect:/rvborad/ricontent?riNum=" + riNum;
	}
    
    
    @PostMapping("/rerepliesadd")
    public String rerepliesadd(@RequestParam("re_num") int reNum,
							@RequestParam("parent_id") int parentId,
				            @RequestParam("ce_content") String ceContent,
				            HttpSession session) {
		int memberNum = (int) session.getAttribute("num");
		RcBoardCMDTO rcBoardCMDTO = new RcBoardCMDTO();
		rcBoardCMDTO.setReNum(reNum);
		rcBoardCMDTO.setCeContent(ceContent);
		rcBoardCMDTO.setParentId(parentId);
		rcBoardCMDTO.setMemberNum(memberNum);
		System.out.println("rcBoardCMDTO = " + rcBoardCMDTO);
		commentService.addreReplies(rcBoardCMDTO);
		return "redirect:/rvborad/rccontent?reNum=" + reNum;
	}
    
    
    
}


