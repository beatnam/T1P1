package com.itwillbs.domain;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MyResumeDTO {

	private int memberNum;
	
//	resume 테이블
	private int resumeID;
//	private String title;  //이력서 제목
	private String resumePhoto;
	
//	member 테이블
	private String memberName;
//	private int memberAge;
//	private String memberGender;
	private String memberJumin;
	private String memberEmail;
	private String memberPhone;
	private String memberPostcode;
	private String memberAddress;
    

//	education 테이블
//	private String eduType;
	private String educationSchool;
	private String educationMajor;
	private String majorDetail;
	
//	job_history 테이블
	private int jhId;
	private String jhDepartment;
	private String workContent;
	private Date startDate;
	private Date endDate;
	
//	certification 테이블 
//	private String certificationName;
//	private String certificationIssuer;
//	certification_mapping 테이블
//	private String cermapAquiredDate;
	private List<CertificationDTO> certificationList;
	
//	language 테이블
//	private String languageName;
//	private String languageNameCustom;
//	private String languageIssuer;
	private List<LanguageDTO> languageList;

    
}

