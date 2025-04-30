package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.CorporationDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.mapper.CorporationMapper;

@Service
public class CorporationService {

	@Inject
	private CorporationMapper corporationMapper;

	public void insertMember(CorporationDTO corporationDTO) {
		System.out.println("CorporationService insertMember()");

		corporationMapper.insertMember(corporationDTO);
	}

	public CorporationDTO loginMember(CorporationDTO corporationDTO) {
		System.out.println("CorporationService loginMember()");

		return corporationMapper.loginMember(corporationDTO);
	}

	public void updateRegist(CorporationDTO corporationDTO) {
		System.out.println("CorporationService updateRegist()");

		
		corporationMapper.updateRegist(corporationDTO);
	}


	

}
