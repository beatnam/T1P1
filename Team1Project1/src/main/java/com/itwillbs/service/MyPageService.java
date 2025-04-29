package com.itwillbs.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.mapper.MyPageMapper;


@Service
public class MyPageService {
	
	@Inject
	private MyPageMapper myPageMapper;
	
//	public MyPageDTO getMyProfile(Integer member_num) {
//		return myPageMapper.getMyProfile(member_num);
//	}

	public void insertCareer(CareerDTO careerDTO) {
		
		
	}

	public MyPageDTO getMyProfileByMemberNum(MyPageDTO myPageDTO) {
		
		
		return myPageMapper.getMyProfileByMemberNum(myPageDTO);
	}
		
	
	

	

}
