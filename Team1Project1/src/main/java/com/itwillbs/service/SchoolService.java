package com.itwillbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.SchoolDTO;
import com.itwillbs.mapper.SchoolMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SchoolService {
	@Autowired
    private SchoolMapper schoolMapper;

   public List<SchoolDTO> searchSchoolByKeyword(String keyword){
	   System.out.println("SchoolService keyword: " + keyword);
	    List<SchoolDTO> list = schoolMapper.searchSchoolByKeyword(keyword);
	    System.out.println("SchoolService 결과 개수: " + (list == null ? "null" : list.size()));
	    
	   return schoolMapper.searchSchoolByKeyword(keyword);
   }

   public String getSchoolNameById(int schoolId) {
	   return schoolMapper.getSchoolNameById(schoolId);  
   }
	
	
}
