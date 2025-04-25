package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.MemberDTO;

@Mapper
public interface MemberMapper {
	
	// 추상메서드
	public void joinMember(MemberDTO memberDTO);

	public MemberDTO loginMember(MemberDTO memberDTO);

	
	
}//인터페이스
