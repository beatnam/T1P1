package com.itwillbs.service;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.domain.MyResumeDTO;
import com.itwillbs.mapper.MyPageMapper;


@Service
public class MyPageService {
	
	@Inject
	private MyPageMapper myPageMapper;
	
//	public MyPageDTO getMyProfile(Integer member_num) {
//		return myPageMapper.getMyProfile(member_num);
//	}


	public MyPageDTO getMyProfileByMemberNum(MyPageDTO myPageDTO) {
		return myPageMapper.getMyProfileByMemberNum(myPageDTO);
	}

	public void updateMyIntroduce(MyPageDTO myPageDTO) {
		myPageMapper.updateMyIntroduce(myPageDTO);
	}

	public void deleteMember(int memberNum) {
		myPageMapper.deleteMember(memberNum);		
	}
	
	public  List<Map<Object, Object>> getapplication(Integer member_num) {
		// TODO Auto-generated method stub
		return myPageMapper.getapplication(member_num);
	}
	
	
	

}
