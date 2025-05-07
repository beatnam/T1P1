package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class IntroduceDTO {

	private int cvId;
	private int memberNum;
	private int corporationMemberNum;
	private String cvContent;
	private String cvFileName;
	private String cvFilePath;
	private Date cvDate;
	

    
}

