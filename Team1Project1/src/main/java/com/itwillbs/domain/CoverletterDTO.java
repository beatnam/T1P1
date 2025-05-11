package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CoverletterDTO {
	private int cvId;
	private int memberNum;
	private int corporationMemberNum;
	private String cvContent;
	private LocalDateTime cvDate;
	private String cvFileName;
	private String cvFilePath;
}
