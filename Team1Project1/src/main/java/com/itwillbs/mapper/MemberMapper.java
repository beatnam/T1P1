package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.MemberDTO;

@Mapper
public interface MemberMapper {
	
	// 추상메서드
	public void joinMember(MemberDTO memberDTO);

	public MemberDTO loginMember(MemberDTO memberDTO);

	public MemberDTO getMemberInfo(Integer member_num);

	

	
	public Integer memberNum(String memberId);
	public void joineducationId(int num);

	public MemberDTO getMemberByEmail(String memberEmail);

	public MemberDTO infoMember(String memberId);

	public MemberDTO infojumin(String memberJumin);

	public MemberDTO infoemail(String memberEmail);

	public MemberDTO infophone(String memberPhone);


	
	
}//인터페이스
