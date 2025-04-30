package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CareerDTO {

	private int JH_id;
	private int member_num;
	
	private String JH_Corporation;
	private String JH_department;
	private String work_content;
	private Date start_date;
	private Date end_date;
	
	
	
	
	

    

    
}

