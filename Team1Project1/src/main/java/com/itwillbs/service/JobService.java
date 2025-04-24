package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.JobDTO;
import com.itwillbs.domain.OccupationDTO;
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
		jobMapper.insertRecruit(recruitDTO);
	}
}
