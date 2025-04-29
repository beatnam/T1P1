package com.itwillbs.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;

@Mapper
public interface ManagerMapper {

	public List<MemberDTO> listMember(PageDTO pageDTO);

	public int countMember();

	public int countRecruit();

	public List<Map<String, Object>> listRecruit(PageDTO pageDTO);

	public List<Map<String, Object>> listCopMember();

	public List<Map<String, Object>> listCopMember1(int mtId);

}
