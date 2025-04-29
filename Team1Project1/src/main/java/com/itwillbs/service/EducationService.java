package com.itwillbs.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.EducationDTO;
import com.itwillbs.mapper.EducationMapper;


@Service
public class EducationService {
	
	@Inject
	private EducationMapper educationMapper;
	
	public List<EducationDTO> getEducationList(int memberNum){
		return educationMapper.getEducationList(memberNum);
	}
		
	
	

	

}
