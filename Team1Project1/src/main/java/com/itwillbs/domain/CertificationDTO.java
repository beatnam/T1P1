package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CertificationDTO {

	private int memberNum;
	private int certificationId;
	private int resumeID;;
	private String certificationName;
	private String certificationIssuer;
	private String certificationAcquiredDate;
	private String certificationGrade;
	private String certificationVerification;
	
    
}

