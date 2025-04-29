package com.itwillbs.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.CorporationDTO;



@Mapper
public interface CorporationMapper {
	
	public void insertMember(CorporationDTO corporationDTO);

	public CorporationDTO loginMember(CorporationDTO corporationDTO);

	public void updateRegist(CorporationDTO corporationDTO);
	
}
