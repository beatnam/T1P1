package com.itwillbs.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.domain.ApplicationDTO;
import com.itwillbs.domain.CareearDTO;
import com.itwillbs.domain.EduHighDTO;
import com.itwillbs.domain.JobDTO;
import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RecruitDTO;

@Mapper
public interface JobMapper {
	public List<OccupationDTO> getOccupations(); // 직무 리스트 가져오기
	public List<JobDTO> getJobsByOccupation(int occupationId); // 특정 직무에 대한 직종 리스트
	public void insertRecruit(RecruitDTO recruitDTO);
	public Integer getMaxNum();
	public List<RecruitDTO> coverList(PageDTO pageDTO);
	public RecruitDTO contentBoard(int recruitId);
	public OccupationDTO occupationNum(OccupationDTO occupationDTO);
	public JobDTO jobNum(JobDTO jobDTO);
	public void updateRecruit(RecruitDTO recruitDTO);
	public EduHighDTO eduHighName(EduHighDTO eduHighDTO);
	public void deleteBoard(int recruitId);
	public Integer countBoard(PageDTO pageDTO);
	public List<Map<String, Object>> resumeList(PageDTO pageDTO);
	public Integer countResume(PageDTO pageDTO);
	public void updateApplicationStatus(@Param("applicationIds") List<String> applicationIds, @Param("status") String status);
	

}
