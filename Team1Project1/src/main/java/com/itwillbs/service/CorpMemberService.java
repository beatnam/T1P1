package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.CorporationDTO;
import com.itwillbs.mapper.CorpMemberMapper;

@Service
public class CorpMemberService {
	
	@Inject
	private CorpMemberMapper corpMemberMapper;
	
	public CorporationDTO corpInfo(String corporationMemberId) {
		System.out.println("CorporationService corpInfo()");
		
		return corpMemberMapper.corpInfo(corporationMemberId);
	}

	public void updateMember(CorporationDTO corporationDTO) {
		System.out.println("CorpMemberService updateMember()");
		
		corpMemberMapper.updateMember(corporationDTO);
	}

	public CorporationDTO corpInfo2(String corporationName) {
		// TODO Auto-generated method stub
		return corpMemberMapper.corpInfo2(corporationName);
	}
	
}
