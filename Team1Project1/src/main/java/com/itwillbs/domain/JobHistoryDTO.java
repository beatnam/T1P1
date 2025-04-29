package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class JobHistoryDTO {

	private int jhId;
	private int memberNum;
	private String jhCorporation;
	private String jhDepartment;
	private String workContent;
	private String workVerification ;
	
	private Date startDate;
	private Date endDate;

}
