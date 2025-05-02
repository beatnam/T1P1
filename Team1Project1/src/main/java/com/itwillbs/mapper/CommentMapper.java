package com.itwillbs.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.RcBoardCMDTO;
import com.itwillbs.domain.RiBoardCMDTO;

@Mapper
public interface CommentMapper {
    List<Map<String, Object>> selectCommentsByReNum(int reNum);  // 조회
    void insertComment(RcBoardCMDTO rcBoardCMDTO);          // 삽입
    void updateComment(RcBoardCMDTO rcBoardCMDTO);          // 수정
    void deleteComment(int ceId);		// 삭제
    List<Map<String, Object>> selectriCommentsByReNum(int riNum);
	void insertriComment(RiBoardCMDTO riBoardCMDTO);
	void updateriComment(RiBoardCMDTO riBoardCMDTO);
	void deleteriComment(int ciId);
}
