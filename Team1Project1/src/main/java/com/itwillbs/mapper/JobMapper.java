package com.itwillbs.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.JobDTO;
import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.domain.RecruitDTO;

@Mapper
public interface JobMapper {
	public List<OccupationDTO> getOccupations(); // 직무 리스트 가져오기
	public List<JobDTO> getJobsByOccupation(int occupationId); // 특정 직무에 대한 직종 리스트
	public void insertRecruit(RecruitDTO recruitDTO);
	public Integer getMaxNum();
	public List<RecruitDTO> coverList();
	public RecruitDTO contentBoard(int recruitId);
	public OccupationDTO occupationNum(OccupationDTO occupationDTO);
	public JobDTO jobNum(JobDTO jobDTO);
	public void updateRecruit(RecruitDTO recruitDTO);
	
}
