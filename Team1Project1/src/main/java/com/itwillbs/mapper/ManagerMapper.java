package com.itwillbs.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OpenrecruitDTO;
import com.itwillbs.domain.PageDTO;

@Mapper
public interface ManagerMapper {

	public List<MemberDTO> listMember(PageDTO pageDTO);

	public int countMember();

	public int countRecruit();

	public List<Map<String, Object>> listRecruit(PageDTO pageDTO);

	public List<Map<String, Object>> listCopMember();

	public List<Map<String, Object>> listCopMember1(int mtId);

	public void insertOR(OpenrecruitDTO openrecruitDTO);

	public List<Map<Object, Object>> listOR(PageDTO pageDTO);

	public Map<Object, Object> contentRecruit(int recruitId);

	public void deleteRecruit(int recruitId);

	public void deleteOpenRecruit(int orId);

	public Map<Object, Object> contentOR(int orId);

	public void updateOR(Map<Object, Object> updateOR);

	public void upgradeCorp(String corpId);

	public Map<Object, Object> contentCorp(String corpId);

	public void insertFAQ(Map<Object, Object> faq);

	public List<Map<Object, Object>> listFAQ();

	public Map<Object, Object> contentFAQ(int faqNum);

	public void updateFAQ(Map<Object, Object> faq);

	public void deleteFAQ(int faqNum);

	public void deleteMember(String memberId);

	public void downgradeCorp(String corpId);

	public int countOR();

	public List<Map<Object, Object>> listREBoard(PageDTO pageDTO);

	public List<Map<Object, Object>> listRIBoard(PageDTO pageDTO2);

	public void deleteRE(int num);

	public void deleteRI(int num);

}
