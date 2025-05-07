package com.itwillbs.domain;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RcBoardCMDTO {
	
	private int ceId;
    private int reNum;
    private Integer parentId;
    private String ceContent;
    private int memberNum;
    private LocalDateTime ceDate;
    private String memberId;
	
}
