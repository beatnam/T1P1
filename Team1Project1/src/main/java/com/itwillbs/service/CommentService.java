package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.RcBoardCMDTO;
import com.itwillbs.domain.RiBoardCMDTO;
import com.itwillbs.mapper.CommentMapper;

@Service
public class CommentService {

    @Autowired
    private CommentMapper commentMapper;

    // 댓글 조회
    public List<Map<String, Object>> getCommentsByReNum(int reNum) {
        return commentMapper.selectCommentsByReNum(reNum);
    }

    // 댓글 삽입
    public void addComment(RcBoardCMDTO rcBoardCMDTO) {
        commentMapper.insertComment(rcBoardCMDTO);
    }

    // 댓글 수정
    public void updateComment(RcBoardCMDTO rcBoardCMDTO) {
        commentMapper.updateComment(rcBoardCMDTO);
    }

    // 댓글 삭제
    public void deleteComment(int ceId) {
        commentMapper.deleteComment(ceId);
    }

	public void addriComment(RiBoardCMDTO riBoardCMDTO) {
		// TODO Auto-generated method stub
		commentMapper.insertriComment(riBoardCMDTO);
	}

	public void updateriComment(RiBoardCMDTO riBoardCMDTO) {
		// TODO Auto-generated method stub
		commentMapper.updateriComment(riBoardCMDTO);
	}

	public void deleteriComment(int ciId) {
		// TODO Auto-generated method stub
		commentMapper.deleteriComment(ciId);
	}

	public List<Map<String, Object>> getriCommentsByReNum(int riNum) {
		// TODO Auto-generated method stub
		return commentMapper.selectriCommentsByReNum(riNum);
	}
}

