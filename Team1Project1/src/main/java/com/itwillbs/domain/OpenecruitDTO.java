package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class OpenecruitDTO {

	private int orId ;
	private int memberNum;
	private String orCoporationName ;
	private String orName;
	private int orOccupation;
	private int orJob;
	private String orLocation ;
	private int orSalary;
	private int orEduhigh;
	private String orUrl;
	private Date orDeadline;
	
}
