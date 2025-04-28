package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;

@Mapper
public interface ManagerMapper {

	public List<MemberDTO> listMember(PageDTO pageDTO);

	public int countMember();

}
