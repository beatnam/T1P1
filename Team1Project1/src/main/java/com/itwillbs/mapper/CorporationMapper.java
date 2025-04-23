package com.itwillbs.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.CorporationDTO;



@Mapper
public interface CorporationMapper {
	
	public void insertMember(CorporationDTO corporationDTO);
	
	
	
	
	
	
}
