package com.itwillbs.domain;

import java.util.Date;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RecruitDTO {
	
	private int recruitId;
	private String recruitName;
	private int corporationMemberNum;
	private int recruitOccupation;
	private int recruitJob;
	private String recruitLocation;
	private int recruitEduhigh;
	private int recruitSalary;
	private String recruitContent;
	private LocalDateTime recruitDate;
	private int recruitWorkday;
	private String recruitPhoto;
	private Date recruitDeatline;
	private int recruitCareear;
	
	private int dday;
	
	private String corporationName;
	private String occupationName;
	private String jobName;
	private String careearName;

	
}
