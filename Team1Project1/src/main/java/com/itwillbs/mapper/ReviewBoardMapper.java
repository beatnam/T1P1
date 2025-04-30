package com.itwillbs.mapper;

import java.util.List;
import java.util.Map;

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
	List<Map<String, Object>> riboList(PageDTO pageDTO);
	List<Map<String, Object>> rcboList(PageDTO pageDTO);
	public int rccountBoard(PageDTO pageDTO);
	public void rcInsertBoard(RcBoardDTO rcBoardDTO);
	public RiBoardDTO contentRi(int riNum);
	public void updateRiReadcount(int riNum);
	public RcBoardDTO contentRc(int reNum);
	public void updateRcReadcount(int reNum);
	public void riupdatePro(RiBoardDTO riBoardDTO);
	public void rcupdatePro(RcBoardDTO rcBoardDTO);
	public void rideleteBo(int riNum);
	public void rcdeleteBo(int reNum);
	
	
	

}
