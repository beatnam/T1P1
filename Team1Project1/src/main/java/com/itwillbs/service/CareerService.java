package com.itwillbs.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.CareerDTO;
import com.itwillbs.domain.MyPageDTO;
import com.itwillbs.mapper.CareerMapper;
import com.itwillbs.mapper.MyPageMapper;


@Service
public class CareerService {
	
	@Inject
	private CareerMapper careerMapper;
	
	public void insertCareer(CareerDTO careerDTO) {
		careerMapper.insertCareer(careerDTO);
	}
	
	public List<CareerDTO> getCareerList(int member_num) {
	    return careerMapper.getCareerList(member_num);
	}

	public void deleteCareerByMemberNum(Integer member_num) {
		careerMapper.deleteCareerByMemberNum(member_num);
		
	}

	public void deleteCareer(int jhId) {
		careerMapper.deleteCareer(jhId);
		
	}


	

}
