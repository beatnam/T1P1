package com.itwillbs.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.RecruitDTO;

@Mapper
public interface MainMapper {
	public List<Map<Object, Object>> listOR(Map<Object, Object> filter);

	public List<Map<Object, Object>> listRecruit(Map<Object, Object> filter);

	public List<RecruitDTO> selectRecentRecruitList(int limit);

	public List<Map<String, Object>> searchKeyword(Map<String, Object> paramMap);

	public Map<Object, Object> result(String recruitId);

}
