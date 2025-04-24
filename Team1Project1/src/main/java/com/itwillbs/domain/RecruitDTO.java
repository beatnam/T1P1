package com.itwillbs.domain;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RecruitDTO {
	
	private int recruitId;
	private int recruitName;
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
	
	
	
	
}
