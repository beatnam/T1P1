package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



//pom.xml
//<!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
//<dependency>
//<groupId>org.projectlombok</groupId>
//<artifactId>lombok</artifactId>
//<version>1.18.38</version>
//<scope>provided</scope>
//</dependency>


// 회원관련 데이터를 저장해서 전달
@Setter
@Getter
@ToString
public class MemberDTO {
	
	private int memberNum;
	private int mtId;
	private String memberId;
	private String memberPasswd;
	private String memberJumin;
	private String memberName;
	private String memberPhone;
	private int	addressId;
	private String memberEmail;
	private String memberIntroduce;
	private Boolean memberInfo;
	private Boolean memberInfoC;
	private String memberPostcode;
	private String memberAddress;
	
}
