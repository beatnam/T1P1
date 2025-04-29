package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.CareerDTO;

@Mapper
public interface CareerMapper {
	
	void insertCareer(CareerDTO careerDTO);
	
	public List<CareerDTO> getCareerList(int member_num);

	
	
	
	
	
}
