package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.mapper.ManagerMapper;

@Service
public class ManagerService {
	@Inject
	private ManagerMapper managerMapper;

	

	public int countMember() {
		
		
		return managerMapper.countMember();
	}

	public List<MemberDTO> listMember(PageDTO pageDTO) {
		
		// 10개씩 잘랐을 떄 1페이지 내용 디비에서 가져오기 위해서
		// 시작하는 행 번호 구하기
		// 페이지번호(pageNum) 페이지크기(pageSize) => 시작하는 행번호(startRow)
		// 1 10 => 0 * 10 + 1 => 0 + 1 => 1
		// 2 10 => 1 * 10 + 1 => 10 + 1 => 11
		// 3 10 => 2 * 10 + 1 => 20 + 1 => 21
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;

		// 끝나는 행 번호 구하기
		// 시작하는 행번호(startRow) 페이지크기(pageSize) => 끝나는 행번호(endRow)
		// 1 10 => 1 + 10 -1 => 10
		// 11 10 => 11 + 10 -1 => 20
		// 21 10 => 21 + 10 -1 => 30
		int endRow = startRow + pageDTO.getPageSize() - 1;

		// limit #{startRow - 1}, #{pageSize}
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		return managerMapper.listMember(pageDTO);
	}

}
