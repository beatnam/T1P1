package com.itwillbs.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.CertificationDTO;
import com.itwillbs.domain.EducationDTO;
import com.itwillbs.domain.JobHistoryDTO;
import com.itwillbs.domain.LanguageDTO;
import com.itwillbs.domain.MemberDTO;
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

	public void saveResumePhoto(MyResumeDTO myResumeDTO) {
		myResumeMapper.saveResumePhoto(myResumeDTO);	
	}

	public void updateMemberFromResume(MyResumeDTO myResumeDTO) {
		myResumeMapper.updateMemberFromResume(myResumeDTO);
		
	}

	public void insertEducationList(MyResumeDTO myResumeDTO) {
		EducationDTO educationDTO = new EducationDTO();
		
		educationDTO.setMemberNum(myResumeDTO.getMemberNum());
		educationDTO.setEducationSchool(Integer.parseInt(myResumeDTO.getEducationSchool()));
		educationDTO.setEducationMajor(myResumeDTO.getEducationMajor());
		educationDTO.setMajorDetail(myResumeDTO.getMajorDetail());
		
		myResumeMapper.insertEducation(educationDTO);
		
	}

	public void insertJobHistory(MyResumeDTO myResumeDTO) {
		JobHistoryDTO jobHistoryDTO = new JobHistoryDTO();
		jobHistoryDTO.setMemberNum(myResumeDTO.getMemberNum());
		jobHistoryDTO.setJhId(myResumeDTO.getJhId());
		jobHistoryDTO.setJhDepartment(myResumeDTO.getJhDepartment());
		jobHistoryDTO.setWorkContent(myResumeDTO.getWorkContent());
		jobHistoryDTO.setStartDate(myResumeDTO.getStartDate());
		jobHistoryDTO.setEndDate(myResumeDTO.getEndDate());
	    
	    myResumeMapper.insertJobHistory(jobHistoryDTO);
		
	}

	public List<MyResumeDTO> getResumeList(Integer member_num) {
		
		return myResumeMapper.getResumeList(member_num);
	}

	public MemberDTO getMemberInfoFromResume(Integer member_num) {
		
		return myResumeMapper.getMemberInfoFromResume(member_num);
	}

	public List<EducationDTO> getEducationList(Integer member_num) {
		
		return myResumeMapper.getEducationList(member_num);
	}

	public List<CertificationDTO> getCertificationList(Integer member_num) {
		
		return myResumeMapper.getCertificationList(member_num);
	}

	public List<LanguageDTO> getLanguageList(Integer member_num) {
		
		return myResumeMapper.getLanguageList(member_num);
	}

	public void deleteResume(int resumeID) {
		myResumeMapper.deleteResume(resumeID);
	}

	

	
	

	

}
