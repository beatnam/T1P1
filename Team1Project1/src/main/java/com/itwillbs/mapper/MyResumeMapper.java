package com.itwillbs.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.MyResumeDTO;


@Mapper
public interface MyResumeMapper {
	
	public int resumeID(int num);
	
	public void title(MyResumeDTO myResumeDTO);
	
	
	
	public void memberName(MyResumeDTO myResumeDTO);
	
	public void memberAge(MyResumeDTO myResumeDTO);
	
	public void memberGender(MyResumeDTO myResumeDTO);
	
	public void memberJumin1(MyResumeDTO myResumeDTO);
	
	public void memberJumin2(MyResumeDTO myResumeDTO);
	
	public void memberEmail(MyResumeDTO myResumeDTO);
	
	public void memberEmailDomain(MyResumeDTO myResumeDTO);
	
	public void memberPhone(MyResumeDTO myResumeDTO);
	
	public void memberAddress(MyResumeDTO myResumeDTO);
	
	
	public void eduType(MyResumeDTO myResumeDTO);
	
	public void educationSchool(MyResumeDTO myResumeDTO);
	
	public void educationMajor(MyResumeDTO myResumeDTO);
	
	
	public void JHId(MyResumeDTO myResumeDTO);
	
	public void JHDepartment(MyResumeDTO myResumeDTO);
	
	public void workContent(MyResumeDTO myResumeDTO);
	
	public void startDate(MyResumeDTO myResumeDTO);
	
	public void endDate(MyResumeDTO myResumeDTO);
	
	
	public void certificationName(MyResumeDTO myResumeDTO);
	
	public void certificationIssuer(MyResumeDTO myResumeDTO);
	
	public void cermapAquiredDate(MyResumeDTO myResumeDTO);
	
	
	public void languageName(MyResumeDTO myResumeDTO);
	
	public void languageNameCustom(MyResumeDTO myResumeDTO);
	
	public void languageIssuer(MyResumeDTO myResumeDTO);
	
	public void langmapGrade(MyResumeDTO myResumeDTO);
	
	
}


