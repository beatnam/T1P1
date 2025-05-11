package com.itwillbs.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.ApplicationDTO;
import com.itwillbs.domain.CoverletterDTO;

@Mapper
public interface FirstStepMapper {

	public void saveCoverLetter(CoverletterDTO cvDTO);

	public int searchCorp(String companyName);

	public void saveAndApply(CoverletterDTO cvDTO);

	public String searchResume(int memberNum);

	public void apply(ApplicationDTO appDTO);
}
