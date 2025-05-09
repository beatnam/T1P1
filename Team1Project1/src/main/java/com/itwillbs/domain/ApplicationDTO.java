package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApplicationDTO {
	
	private int applicationId;
	private int memberNum;
	private int corporationMemberNum;
	private String resumePdf;
	private String cvPdf;
	private LocalDateTime applicationDate;
	private String applicationState;
	
}
