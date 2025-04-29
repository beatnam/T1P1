package com.itwillbs.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class EducationDTO {

	private int memberNum;
	private int educationSchool;
	private int eduhighId;
	
	private String eduhighName;
	private String educationMajor;
	private String majorDetail;
	private String educationVenification;

}
