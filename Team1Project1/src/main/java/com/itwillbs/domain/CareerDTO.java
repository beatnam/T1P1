package com.itwillbs.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CareerDTO {

	private int jhId;
	private int memberNum;
	
	private String jhCorporation;
	private String jhDepartment;
	private String workContent;
	
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String startDate;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String endDate;
	
    
}

