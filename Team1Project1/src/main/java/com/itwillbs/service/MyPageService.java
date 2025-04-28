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
	
	public MyPageDTO getMyProfile(String id) {
		return myPageMapper.getMyProfile(id);
	}

	public void insertCareer(CareerDTO careerDTO) {
		
		
	}
		
	
	

	

}
