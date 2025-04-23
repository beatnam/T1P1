package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.CorporationDTO;
import com.itwillbs.mapper.CorporationMapper;

@Service
public class CorporationService {

	@Inject
	private CorporationMapper corporationMapper;
	
	public void insertMember(CorporationDTO corporationDTO) {
		
		corporationMapper.insertMember(corporationDTO);
	}

}
