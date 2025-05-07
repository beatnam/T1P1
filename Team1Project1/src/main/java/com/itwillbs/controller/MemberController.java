package com.itwillbs.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.service.KakaoService;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	private MemberService memberService;
	
	@Inject
	private KakaoService kakaoService;

	@GetMapping("/join")
	public String join() {

		System.out.println("memberController join");

		return "member/join";
	}

	@PostMapping("/joinPro")
	public String joinPro(MemberDTO memberDTO, HttpServletRequest request) {
		System.out.println("memberController joinPro");

	    // 인증 여부 확인
	    String smsVerified = request.getParameter("smsVerified");
	    if (!"true".equals(smsVerified)) {
	        System.out.println("인증되지 않은 사용자입니다.");
	        return "/member/sms_fail"; // 실패 메시지 페이지 만들어도 좋고, alert 띄워도 됨
	    }

	    String memberJumin = request.getParameter("memberJumin1") + request.getParameter("memberJumin2");
	    String memberEmail = request.getParameter("memberEmail1") + "@" + request.getParameter("memberEmail2");
	    String memberId = request.getParameter("memberId");

	    memberDTO.setMTId(200);
	    memberDTO.setMemberId(memberId);
	    memberDTO.setMemberEmail(memberEmail);
	    memberDTO.setMemberJumin(memberJumin);

	    memberService.joinMember(memberDTO);
	    memberService.joineducationId(memberId);

	    return "redirect:/main/main";
	}
	
	
	

	@PostMapping("/loginPro")
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("memberController loginPro");

		MemberDTO memberDTO2 = memberService.loginMember(memberDTO);
		
		if (memberDTO2 != null) {
			// 아이디 비밀번호 일치
			// 로그인 성공 => 로그인 표시값을 세션에 저장
			session.setAttribute("id", memberDTO2.getMemberId());
			// 세션값에 멤버타입도 같이 넘겨줌 
			session.setAttribute("type", memberDTO2.getMTId());

			session.setAttribute("member_num", memberDTO2.getMemberNum());

			session.setAttribute("num", memberDTO2.getMemberNum());
			
	        System.out.println("세션 ID : " + memberDTO2.getMTId());
	        System.out.println("세션 member_num : " + memberDTO2.getMemberNum());

			return "redirect:/main/main";
		} else{
			return "/main/msg";
		}

	} // loginPro();
	
	
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {
		System.out.println("MemberController kakaoLogin");
		 System.out.println("카카오 인증 코드 : " + code);

		    // 1. 액세스 토큰 발급
		    String accessToken = kakaoService.getAccessToken(code);

		    // 2. 사용자 정보 요청
		    Map<String, Object> userInfo = kakaoService.getUserInfo(accessToken);

		    // 3. 이메일 꺼내기
		    
		    String email = (String) userInfo.get("email");

		    // 4. DB에 없으면 회원가입 처리
		    
		    MemberDTO memberDTO = memberService.kakaoLoginOrJoin(email);
		    if(memberDTO == null) {
		    	return "member/join";
		    }else {
					// 아이디 비밀번호 일치
					// 로그인 성공 => 로그인 표시값을 세션에 저장
					session.setAttribute("id", memberDTO.getMemberId());
					// 세션값에 멤버타입도 같이 넘겨줌 
					session.setAttribute("type", memberDTO.getMTId());

					session.setAttribute("num", memberDTO.getMemberNum());
					
			        System.out.println("세션 ID : " + memberDTO.getMTId());
			        System.out.println("세션 member_num : " + memberDTO.getMemberNum());

					return "redirect:/main/main";
				} 
		    }

	

	    

	//cool sms api 
	@PostMapping("/sendSMS")
	public ResponseEntity<Map<String, String>> sendSMS(@RequestBody Map<String, String> requestData, HttpSession session) {
	    System.out.println("MemberController sendSMS");
	    String phoneNumber = requestData.get("phoneNumber");

	    if (phoneNumber == null || phoneNumber.isEmpty()) {
	        return ResponseEntity.badRequest().body(Map.of("status", "fail"));
	    }

	    String verificationCode = memberService.sendVerificationCode(phoneNumber);
	    if (verificationCode == null) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("status", "fail"));
	    }

	    session.setAttribute("smsCode", verificationCode);
	    return ResponseEntity.ok(Map.of("status", "success"));
	}
	
	
	

	@PostMapping("/verifySMS")
	public ResponseEntity<Map<String, String>> verifySMS(@RequestBody Map<String, String> requestData, HttpSession session) {
	    String inputCode = requestData.get("code");
	    String sessionCode = (String) session.getAttribute("smsCode");

	    if (sessionCode != null && sessionCode.equals(inputCode)) {
	        return ResponseEntity.ok(Map.of("status", "success"));
	    } else {
	        return ResponseEntity.ok(Map.of("status", "fail"));
	    }
	}

	@GetMapping("/login1-1")
	public String loginHome1() {

		return "member/login1-1";
	}

	@GetMapping("/login1-2")
	public String loginHome2() {

		return "member/login1-2";
	}

}
