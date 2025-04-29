package com.itwillbs.service;

import java.sql.Date;
import java.util.List;

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

	public List<RiBoardDTO> riboList(PageDTO pageDTO) {
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

	public List<RcBoardDTO> rcboList(PageDTO pageDTO) {
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
	
	
	
	
}
