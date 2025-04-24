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
	
}
