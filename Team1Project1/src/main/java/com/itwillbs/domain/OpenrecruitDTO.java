package com.itwillbs.domain;


import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OpenrecruitDTO {

	private int orId ;
	private int memberNum;
	private String orCorporationName ;
	private String orName;
	private int orOccupation;
	private int orJob;
	private String orLocation ;
	private int orSalary;
	private int orEduhigh;
	private String orUrl;
	private Date orDeadline;
	private int orWorkday;
	private int orCareear;
}
