package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.JobDTO;
import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.mapper.JobMapper;

@Service
public class JobService {
    private final JobMapper jobMapper;

    public JobService(JobMapper jobMapper) {
        this.jobMapper = jobMapper;
    }

    public List<OccupationDTO> getOccupations() {
        return jobMapper.getOccupations();
    }

    public List<JobDTO> getJobsByOccupation(int occupationId) {
        return jobMapper.getJobsByOccupation(occupationId);
    }
}
