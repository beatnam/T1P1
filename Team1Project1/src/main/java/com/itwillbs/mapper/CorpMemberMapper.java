package com.itwillbs.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.CorporationDTO;

@Mapper
public interface CorpMemberMapper {

	public CorporationDTO corpInfo(String corporationMemberId);

	public void updateMember(CorporationDTO corporationDTO);
	

	
}
