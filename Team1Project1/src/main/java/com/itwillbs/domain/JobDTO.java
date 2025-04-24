package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class JobDTO {
    private int jobId;
    private int occupationId;
    private String jobName;

    // Getters and Setters
}