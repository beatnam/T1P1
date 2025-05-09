package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.SchoolDTO;

@Mapper
public interface SchoolMapper {
	
	List<SchoolDTO> searchSchoolByKeyword(String keyword);

	String getSchoolNameById(int schoolId);
	
}
