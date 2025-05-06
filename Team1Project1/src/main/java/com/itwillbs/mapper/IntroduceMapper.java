package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.IntroduceDTO;
import com.itwillbs.domain.MyPageDTO;


@Mapper
public interface IntroduceMapper {

	void insertIntroduceFile(IntroduceDTO introduceDTO);

	List<IntroduceDTO> getIntroduceByMemberNum(Integer memberNum);

	void deleteIntroduce(int cvId);
	


	
}


