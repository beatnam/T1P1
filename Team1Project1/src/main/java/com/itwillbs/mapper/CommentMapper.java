package com.itwillbs.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.RcBoardCMDTO;
import com.itwillbs.domain.RiBoardCMDTO;

@Mapper
public interface CommentMapper {
	public List<Map<String, Object>> selectCommentsByReNum(int reNum);  // 조회
	public void insertComment(RcBoardCMDTO rcBoardCMDTO);          // 삽입
	public void updateComment(RcBoardCMDTO rcBoardCMDTO);          // 수정
	public void deleteComment(int ceId);		// 삭제
	public List<Map<String, Object>> selectriCommentsByReNum(int riNum);
    public void insertriComment(RiBoardCMDTO riBoardCMDTO);
    public void updateriComment(RiBoardCMDTO riBoardCMDTO);
    public void deleteriComment(int ciId);
    public void addriReplies(RiBoardCMDTO riBoardCMDTO);
	public void addreReplies(RcBoardCMDTO rcBoardCMDTO);
    
    
	
	
}
