package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RiBoardCMDTO {
	
	private int ciId;
	private int riNum;
	private int parentId;
	private String ciContent;
	private int memberNum;
	private Date ciDate;
	
}
