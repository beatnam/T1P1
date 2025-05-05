package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.mapper.MemberMapper;

@Service
public class MemberService {
	
//	MemberMapper 객체생성
	@Inject
	private MemberMapper memberMapper;

	public void joinMember(MemberDTO memberDTO) {
		System.out.println("MemberService joinMember()");
		
		memberMapper.joinMember(memberDTO);
			
	}//insertMember()

	public MemberDTO loginMember(MemberDTO memberDTO) {
		
		return memberMapper.loginMember(memberDTO);
	}

	public MemberDTO getMemberInfo(Integer member_num) {
		
		return memberMapper.getMemberInfo(member_num);
	}

	

	

}//클래스
