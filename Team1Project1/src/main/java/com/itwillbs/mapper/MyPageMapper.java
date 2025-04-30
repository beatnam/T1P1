package com.itwillbs.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.MyPageDTO;


@Mapper
public interface MyPageMapper {
	
//	public void memberIntroduce(MyPageDTO myPageDTO);
//	
//	public void eduhighId(MyPageDTO myPageDTO);
//	
//	public void memberName(MyPageDTO myPageDTO);
//	
//	public void memberPhone(MyPageDTO myPageDTO);
//	
//	public void memberInfoC(MyPageDTO myPageDTO);

	public MyPageDTO getMyProfile(Integer member_num);

	void insertCareer(CareerDTO careerDTO);

	public MyPageDTO getMyProfileByMemberNum(MyPageDTO myPageDTO);

	public void updateMyIntroduce(MyPageDTO myPageDTO);

	
}


