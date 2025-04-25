package com.itwillbs.service;

import java.time.LocalDateTime;
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
		
		recruitDTO.setRecruitDate(LocalDateTime.now());
		System.out.println("recruitDTO : " + recruitDTO);
		jobMapper.insertRecruit(recruitDTO);
	}

	public List<RecruitDTO> coverList() {
		System.out.println("JobService coverList()");
		
		return jobMapper.coverList();
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
	
	
}
