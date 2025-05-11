package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.ApplicationDTO;
import com.itwillbs.domain.CoverletterDTO;
import com.itwillbs.mapper.FirstStepMapper;

@Service
public class FirstStepService {

	@Inject
	private FirstStepMapper firstStepMapper;
	public void saveCoverLetter(CoverletterDTO cvDTO) {
		
		firstStepMapper.saveCoverLetter(cvDTO);
	}
	public Integer searchCorp(String companyName) {
		// TODO Auto-generated method stub
		return firstStepMapper.searchCorp(companyName);
	}
	public void saveAndApply(CoverletterDTO cvDTO) {
		// TODO Auto-generated method stub
		firstStepMapper.saveAndApply(cvDTO);
	}
	public String searchResume(int memberNum) {
		// TODO Auto-generated method stub
		return firstStepMapper.searchResume(memberNum);
	}
	public void apply(ApplicationDTO appDTO) {
		firstStepMapper.apply(appDTO);
		
	}

	
}
