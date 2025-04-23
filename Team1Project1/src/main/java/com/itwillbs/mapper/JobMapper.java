package com.itwillbs.mapper;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.JobDTO;
import com.itwillbs.domain.OccupationDTO;

public interface JobMapper {
    List<OccupationDTO> getOccupations(); // 직무 리스트 가져오기
    List<JobDTO> getJobsByOccupation(int occupationId); // 특정 직무에 대한 직종 리스트
}
