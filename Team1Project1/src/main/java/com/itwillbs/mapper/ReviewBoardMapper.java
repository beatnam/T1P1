package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RcBoardDTO;
import com.itwillbs.domain.RiBoardDTO;

@Mapper
public interface ReviewBoardMapper {

	public void riInsertBoard(RiBoardDTO riBoardDTO);
	public MemberDTO infoName(MemberDTO memberDTO);
	public int ricountBoard(PageDTO pageDTO);
	public List<RiBoardDTO> riboList(PageDTO pageDTO);
	public List<RcBoardDTO> rcboList(PageDTO pageDTO);
	public int rccountBoard(PageDTO pageDTO);
	public void rcInsertBoard(RcBoardDTO rcBoardDTO);
	
	
	

}
