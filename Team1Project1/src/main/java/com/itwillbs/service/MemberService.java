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
	//회원가입 정보 넣기
		
			
	}

	
	public void joineducationId(String memberId) {
		// TODO Auto-generated method stub
		Integer num = memberMapper.memberNum(memberId);	
		
		memberMapper.joineducationId(num);	// 학력 테이블 memeberNum넣기 
	}
	
	
	
	public MemberDTO loginMember(MemberDTO memberDTO) {
		
		return memberMapper.loginMember(memberDTO);	//로그인
	}


	

}//클래스
