package com.itwillbs.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MyResumeDTO;
import com.itwillbs.mapper.MyResumeMapper;


@Service
public class MyResumeService {
	
	@Inject
	private MyResumeMapper myResumeMapper;
	
	public MyResumeDTO getResumeMyMemberNum(int memberNum) {
		return myResumeMapper.getResumeByMemberNum(memberNum);
	}
		
	public void insertResume(MyResumeDTO myResumeDTO) {
		myResumeMapper.insertResume(myResumeDTO);
	}
	
	public void updateResume(MyResumeDTO myResumeDTO) {
		myResumeMapper.updateResume(myResumeDTO);
	}
	

	

}
