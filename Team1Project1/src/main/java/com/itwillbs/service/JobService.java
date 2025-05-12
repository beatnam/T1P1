package com.itwillbs.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.ApplicationDTO;
import com.itwillbs.domain.CareearDTO;
import com.itwillbs.domain.EduHighDTO;
import com.itwillbs.domain.JobDTO;
import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RecruitDTO;
import com.itwillbs.mapper.JobMapper;

@Service
public class JobService {
	private final JobMapper jobMapper;

	public JobService(JobMapper jobMapper) {
		System.out.println("JobService JobService()");
		this.jobMapper = jobMapper;
	}

	public List<OccupationDTO> getOccupations() {
		System.out.println("JobService getOccupations()");
		return jobMapper.getOccupations();
	}

	public List<JobDTO> getJobsByOccupation(int occupationId) {
		System.out.println("JobService getJobsByOccupation()");
		return jobMapper.getJobsByOccupation(occupationId);
	}

	public void insertRecruit(RecruitDTO recruitDTO) {
		System.out.println("JobService insertRecruit()");
		System.out.println("📌 recruitDeatline 값: " + recruitDTO.getRecruitDeatline());
		recruitDTO.setRecruitDate(LocalDateTime.now());
		System.out.println("recruitDTO : " + recruitDTO);
		jobMapper.insertRecruit(recruitDTO);
	}

	public List<RecruitDTO> coverList(PageDTO pageDTO) {
		System.out.println("JobService coverList()");

		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		return jobMapper.coverList(pageDTO);
	}

	public RecruitDTO contentBoard(int recruitId) {
		System.out.println("JobService contentBoard()");

		return jobMapper.contentBoard(recruitId);
	}

	public OccupationDTO occupationNum(OccupationDTO OccupationDTO) {
		System.out.println("JobService occupationNum()");
		System.out.println("OccupationDTO" + OccupationDTO);

		return jobMapper.occupationNum(OccupationDTO);
	}

	public JobDTO jobNum(JobDTO jobDTO) {
		System.out.println("JobService jobNum()");
		System.out.println("jobDTO" + jobDTO);
		return jobMapper.jobNum(jobDTO);
	}

	public void updateRecruit(RecruitDTO recruitDTO) {
		System.out.println("JobService updateRecruit()");
		System.out.println("recruitDTO : " + recruitDTO);
		jobMapper.updateRecruit(recruitDTO);
	}

	public EduHighDTO eduHighName(EduHighDTO eduHighDTO) {
		System.out.println("JobService eduHighName()");
		System.out.println("eduHighDTO : " + eduHighDTO);
		return jobMapper.eduHighName(eduHighDTO);
	}

	public void deleteBoard(int recruitId) {
		System.out.println("JobService eduHighName()");
		jobMapper.deleteBoard(recruitId);
	}

	public Integer countBoard(PageDTO pageDTO) {
		System.out.println("JobService countBoard()");
		return jobMapper.countBoard(pageDTO);
	}

	public List<Map<String, Object>> resumeList(PageDTO pageDTO) {
		System.out.println("JobService resumeList()");
		
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return jobMapper.resumeList(pageDTO);
	}

	public Integer countResume(PageDTO pageDTO) {
		System.out.println("JobService countResume()");
		
		return jobMapper.countResume(pageDTO);
	}

	public void updateApplicationStatus(List<String> applicationIds, String status) {
        jobMapper.updateApplicationStatus(applicationIds, status); // MyBatis XML에서 처리
    }

	public List<Map<String, Object>> agreeResume(PageDTO pageDTO) {
		System.out.println("JobService resumeList()");
		
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return jobMapper.agreeResume(pageDTO);
	}

	public Integer countagreeResume(PageDTO pageDTO) {
		// TODO Auto-generated method stub
		return jobMapper.countagreeResume(pageDTO);
	}


}
