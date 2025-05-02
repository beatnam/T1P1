package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RiBoardCMDTO {
	
	private int ciId;
	private int riNum;
	private Integer parentId;
	private String ciContent;
	private int memberNum;
	private LocalDateTime ciDate;
	private String memberId;
}
