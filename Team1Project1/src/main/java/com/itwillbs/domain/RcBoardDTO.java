package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RcBoardDTO {
	
	private int reNum;
	private int memberNum;
	private String reSubject;
	private String reContent;
	private Date reDate;
	private int reReadcount;
	
}
