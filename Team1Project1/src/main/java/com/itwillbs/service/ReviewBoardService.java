package com.itwillbs.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RcBoardDTO;
import com.itwillbs.domain.RiBoardDTO;
import com.itwillbs.mapper.ReviewBoardMapper;

@Service
public class ReviewBoardService {
	
	@Inject
	private ReviewBoardMapper reviewBoardMapper;
	
	public void riInsertBoard(RiBoardDTO riBoardDTO) {
		System.out.println("ReviewBoardService riInsertBoard()");
		
		riBoardDTO.setRiReadcount(0);
		riBoardDTO.setRiDate(new Date(System.currentTimeMillis()));
		System.out.println("riBoardDTO = " + riBoardDTO);
		reviewBoardMapper.riInsertBoard(riBoardDTO);
	}

	public MemberDTO infoName(MemberDTO memberDTO) {
		System.out.println("ReviewBoardService infoName()");
		return reviewBoardMapper.infoName(memberDTO);
	}

	public List<Map<String, Object>> riboList(PageDTO pageDTO){
		System.out.println("ReviewBoardService riboList()");
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return reviewBoardMapper.riboList(pageDTO);
	}

	public int ricountBoard(PageDTO pageDTO) {
		System.out.println("ReviewBoardService ricountBoard()");
		return reviewBoardMapper.ricountBoard(pageDTO);
	}

	public List<Map<String, Object>> rcboList(PageDTO pageDTO){
		System.out.println("ReviewBoardService rcboList()");
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return reviewBoardMapper.rcboList(pageDTO);
	}

	public int rccountBoard(PageDTO pageDTO) {
		System.out.println("ReviewBoardService rccountBoard()");
		return reviewBoardMapper.rccountBoard(pageDTO);
	}

	public void rcInsertBoard(RcBoardDTO rcBoardDTO) {
		System.out.println("ReviewBoardService rcInsertBoard()");
		
		rcBoardDTO.setReReadcount(0);
		rcBoardDTO.setReDate(new Date(System.currentTimeMillis()));
		System.out.println("rcBoardDTO = " + rcBoardDTO);
		reviewBoardMapper.rcInsertBoard(rcBoardDTO);
		
	}

	public void updateRiReadcount(int riNum) {
		System.out.println("ReviewBoardService updateRiReadcount()");
		reviewBoardMapper.updateRiReadcount(riNum);
	}
	public void updateRcReadcount(int reNum) {
		System.out.println("ReviewBoardService updateRcReadcount()");
		reviewBoardMapper.updateRcReadcount(reNum);
	}

	public RiBoardDTO contentRi(int riNum) {
		System.out.println("ReviewBoardService contentRi()");
		return reviewBoardMapper.contentRi(riNum);
	}

	public RcBoardDTO contentRc(int reNum) {
		System.out.println("ReviewBoardService contentRc()");
		return reviewBoardMapper.contentRc(reNum);
	}

	public void riupdatePro(RiBoardDTO riBoardDTO) {
		System.out.println("ReviewBoardService riupdatePro()");
		reviewBoardMapper.riupdatePro(riBoardDTO);
	}

	public void rcupdatePro(RcBoardDTO rcBoardDTO) {
		System.out.println("ReviewBoardService rcupdatePro()");
		reviewBoardMapper.rcupdatePro(rcBoardDTO);
	}

	public void rideleteBo(int riNum) {
		System.out.println("ReviewBoardService rideleteBo()");
		reviewBoardMapper.rideleteBo(riNum);
	}

	public void rcdeleteBo(int reNum) {
		System.out.println("ReviewBoardService rcdeleteBo()");
		reviewBoardMapper.rcdeleteBo(reNum);
	}
	
	
	
	
}
