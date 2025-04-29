package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RiBoardDTO {
	
	private int riNum;
	private int memberNum;
	private String riSubject;
	private String riContent;
	private Date riDate;
	private int riReadcount;
	
}
