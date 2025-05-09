package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.RecruitDTO;
import com.itwillbs.mapper.MainMapper;

@Service
public class MainService {
	@Inject
	private MainMapper mainMapper;

	public List<Map<Object, Object>> listOR(Map<Object, Object> filter) {

		return mainMapper.listOR(filter);
	}

	public List<Map<Object, Object>> listRecruit(Map<Object, Object> filter) {

		return mainMapper.listRecruit(filter);
	}

	public List<RecruitDTO> getRecentRecruitList(int limit) {
		return mainMapper.selectRecentRecruitList(limit);
	}
	
	public List<Map<String, Object>> search(Map<String, Object> paramMap) {
	    System.out.println("MainService search");
	    return mainMapper.searchKeyword(paramMap);
	}


}
