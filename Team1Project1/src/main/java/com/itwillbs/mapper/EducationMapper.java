package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.EduHighDTO;
import com.itwillbs.domain.EducationDTO;
import com.itwillbs.domain.MyPageDTO;


@Mapper
public interface EducationMapper {

	public List<EducationDTO> getEducationList(int memberNum);

	public void insertEducation(EducationDTO educationDTO);

	public void updateEducation(EducationDTO educationDTO);

	public EducationDTO getEducationByMemberNum(int member_num);

	
	

	
}


