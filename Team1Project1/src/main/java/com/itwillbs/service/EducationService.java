package com.itwillbs.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.EduHighDTO;
import com.itwillbs.domain.EducationDTO;
import com.itwillbs.mapper.EducationMapper;


@Service
public class EducationService {
	
	@Inject
	private EducationMapper educationMapper;
	
	public List<EducationDTO> getEducationList(int memberNum){
		return educationMapper.getEducationList(memberNum);
	}

	public void insertEducation(EducationDTO educationDTO) {
		educationMapper.insertEducation(educationDTO);
		
	}

	public EducationDTO getEducationByMemberNum(int member_num) {
		
		return educationMapper.getEducationByMemberNum(member_num);
	}

	public void updateEducation(EducationDTO educationDTO) {
		educationMapper.updateEducation(educationDTO);
		
	}

	
		
	
	

	

}
