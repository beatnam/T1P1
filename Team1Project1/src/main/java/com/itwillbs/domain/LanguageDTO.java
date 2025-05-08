package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class LanguageDTO {

	private int memberNum;
	private int languageId;
	private int resumeID;
	private String languageName;
	private String languageIssuer;
	private Date languageAcquiredDate;
	private String languageGrade;
	private String languageVerification;
	
    
}

