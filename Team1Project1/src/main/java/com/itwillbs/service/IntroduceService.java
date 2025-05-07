package com.itwillbs.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.IntroduceDTO;
import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.mapper.IntroduceMapper;
import com.itwillbs.mapper.MyPageMapper;


@Service
public class IntroduceService {
	
	@Inject
	private IntroduceMapper introduceMapper;

	public void insertIntroduceFile(IntroduceDTO introduceDTO) {
		introduceMapper.insertIntroduceFile(introduceDTO);
		
	}

	public List<IntroduceDTO> getIntroduceByMemberNum(Integer memberNum) {
		return introduceMapper.getIntroduceByMemberNum(memberNum);
	}

	public void deleteIntroduce(int cvId) {
		introduceMapper.deleteIntroduce(cvId);
		
	}
	
	
		
	
	

	

}
