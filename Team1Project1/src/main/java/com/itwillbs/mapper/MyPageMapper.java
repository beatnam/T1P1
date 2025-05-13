package com.itwillbs.mapper;

import java.util.List;
import java.util.Map;

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

	

	public MyPageDTO getMyProfileByMemberNum(MyPageDTO myPageDTO);

	public void updateMyIntroduce(MyPageDTO myPageDTO);

	public void deleteMember(int memberNum);



	public List<Map<Object, Object>> getapplication(Integer member_num);

	
}


