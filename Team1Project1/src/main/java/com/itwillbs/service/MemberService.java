package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.json.JSONObject;
import org.springframework.stereotype.Service;


import com.itwillbs.domain.MemberDTO;
import com.itwillbs.mapper.MemberMapper;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;





@Service
public class MemberService {
	
//	MemberMapper 객체생성
	@Inject
	private MemberMapper memberMapper;
	
	private final DefaultMessageService messageService;

	public MemberService() {
	    // NurigoApp.init()을 통해 API 키, 시크릿, 도메인 설정
	    this.messageService = NurigoApp.INSTANCE.initialize("NCSAUKOQEOMO96JP", "SXC1SSRZWZ0O7VZNEGWB1OHQ3O9HYVGM", "https://api.coolsms.co.kr");
	}


	public void joinMember(MemberDTO memberDTO) {
		System.out.println("MemberService joinMember()");
		
		memberMapper.joinMember(memberDTO);
	//회원가입 정보 넣기
		
			
	}

	public MemberDTO getMemberInfo(Integer member_num) {
		
		return memberMapper.getMemberInfo(member_num);
	}

	

	
	public void joineducationId(String memberId) {
		// TODO Auto-generated method stub
		Integer num = memberMapper.memberNum(memberId);	
		
		memberMapper.joineducationId(num);	// 학력 테이블 memeberNum넣기 
	}
	
	
	
	public MemberDTO loginMember(MemberDTO memberDTO) {
		
		return memberMapper.loginMember(memberDTO);	//로그인
	}
	
	//카카오로그인
	public MemberDTO kakaoLoginOrJoin(String email) {
	    System.out.println("MemberService kakaoLoginOrJoin()");

	    // 이메일로 기존 회원 조회
	    MemberDTO memberDTO = memberMapper.getMemberByEmail(email);

	    return memberDTO;
	}


	
	  

	    
	    public String sendVerificationCode(String phoneNumber) {
	        String verificationCode = generateCode();

	        Message message = new Message();
	        message.setFrom("01046653670");  // 발신 번호
	        message.setTo(phoneNumber);
	        message.setText("[출근] 인증번호는 [" + verificationCode + "] 입니다.");

	        try {
	        	 SingleMessageSendingRequest request = new SingleMessageSendingRequest(message);
	             SingleMessageSentResponse response = this.messageService.sendOne(request);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return verificationCode;
	    }

	    
	    private String generateCode() {
	        return String.valueOf((int)(Math.random() * 900000) + 100000);
	    }
	

}//클래스
