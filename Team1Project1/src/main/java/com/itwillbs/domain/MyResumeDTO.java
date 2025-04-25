package com.itwillbs.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MyResumeDTO {

	private int resumeID;
	private String title;  //이력서 제목
	
	private String memberName;
	private int memberAge;
	private String memberGender;
	private String memberJumin1;
	private String memberJumin2;
	private String memberEmail;
	private String memberEmailDomain;
	private String memberPhone;
	private String memberPostcode;
	private String memberAddress;
    

	
	private String eduType;
	private String educationSchool;
	private String educationMajor;
	
	
	private String JHId;
	private String JHDepartment;
	private String workContent;
	private String startDate;
	private String endDate;
	
	
	private String certificationName;
	private String certificationIssuer;
	private String cermapAquiredDate;
	
	
	private String languageName;
	private String languageNameCustom;
	private String languageIssuer;
	private String langmapGrade;
    
}

