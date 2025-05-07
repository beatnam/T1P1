package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OpenrecruitDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.mapper.ManagerMapper;

@Service
public class ManagerService {
	@Inject
	private ManagerMapper managerMapper;

	public int countMember() {

		return managerMapper.countMember();
	}

	public List<MemberDTO> listMember(PageDTO pageDTO) {

		// 10개씩 잘랐을 떄 1페이지 내용 디비에서 가져오기 위해서
		// 시작하는 행 번호 구하기
		// 페이지번호(pageNum) 페이지크기(pageSize) => 시작하는 행번호(startRow)
		// 1 10 => 0 * 10 + 1 => 0 + 1 => 1
		// 2 10 => 1 * 10 + 1 => 10 + 1 => 11
		// 3 10 => 2 * 10 + 1 => 20 + 1 => 21
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;

		// 끝나는 행 번호 구하기
		// 시작하는 행번호(startRow) 페이지크기(pageSize) => 끝나는 행번호(endRow)
		// 1 10 => 1 + 10 -1 => 10
		// 11 10 => 11 + 10 -1 => 20
		// 21 10 => 21 + 10 -1 => 30
		int endRow = startRow + pageDTO.getPageSize() - 1;

		// limit #{startRow - 1}, #{pageSize}
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		return managerMapper.listMember(pageDTO);
	}

	public int countRecruit() {
		// TODO Auto-generated method stub
		return managerMapper.countRecruit();
	}

	public List<Map<String, Object>> listRecruit(PageDTO pageDTO) {
		System.out.println("ManagerService listRecruit()");

		// 10개씩 잘랐을 떄 1페이지 내용 디비에서 가져오기 위해서
		// 시작하는 행 번호 구하기
		// 페이지번호(pageNum) 페이지크기(pageSize) => 시작하는 행번호(startRow)
		// 1 10 => 0 * 10 + 1 => 0 + 1 => 1
		// 2 10 => 1 * 10 + 1 => 10 + 1 => 11
		// 3 10 => 2 * 10 + 1 => 20 + 1 => 21
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;

		// 끝나는 행 번호 구하기
		// 시작하는 행번호(startRow) 페이지크기(pageSize) => 끝나는 행번호(endRow)
		// 1 10 => 1 + 10 -1 => 10
		// 11 10 => 11 + 10 -1 => 20
		// 21 10 => 21 + 10 -1 => 30
		int endRow = startRow + pageDTO.getPageSize() - 1;

		// limit #{startRow - 1}, #{pageSize}
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		return managerMapper.listRecruit(pageDTO);
	}

	public List<Map<String, Object>> listCopMember() {
		System.out.println("ManagerService listCopMember()");
		return managerMapper.listCopMember();
	}

	public List<Map<String, Object>> listCopMember1(Integer mtId) {
		System.out.println("ManagerService listCopMember1()");
		System.out.println(mtId);
		if (mtId == 0) {
			return managerMapper.listCopMember();
		} else {
			return managerMapper.listCopMember1(mtId);
		}
	}

	public void insertOR(OpenrecruitDTO openrecruitDTO) {
		System.out.println("ManagerService insertOR()");
		managerMapper.insertOR(openrecruitDTO);
	}

	public List<Map<Object, Object>> listOR() {
		System.out.println("ManagerService listOR()");
		return managerMapper.listOR();
	}

	public Map<Object, Object> contentRecruit(int recruitId) {
		System.out.println("ManagerService contentRecruit()");
		return managerMapper.contentRecruit(recruitId);
	}

	public void deleteRecruit(int recruitId) {
		System.out.println("ManagerService deleteRecruit()");
		managerMapper.deleteRecruit(recruitId);

	}

	public void deleteOpenRecruit(int orId) {
		System.out.println("ManagerService deleteOpenRecruit()");
		managerMapper.deleteOpenRecruit(orId);
	}

	public Map<Object, Object> contentOR(int orId) {
		System.out.println("ManagerService contentOR()");
		return managerMapper.contentOR(orId);
	}

	public void updateOR(Map<Object, Object> updateOR) {
		System.out.println("ManagerService updateOR()");
		managerMapper.updateOR(updateOR);
	}

	public void upgradeCorp(String corpId) {
		System.out.println("ManagerService updateCorp()");
		managerMapper.upgradeCorp(corpId);
	}

	public Map<Object, Object> contentCorp(String corpId) {

		return managerMapper.contentCorp(corpId);
	}

	public void insertFAQ(Map<Object, Object> faq) {
		System.out.println("ManagerService insertFAQ()");
		managerMapper.insertFAQ(faq);
	}

	public List<Map<Object, Object>> listFAQ() {
		// TODO Auto-generated method stub
		return managerMapper.listFAQ();
	}

	public Map<Object, Object> contentFAQ(int faqNum) {
		// TODO Auto-generated method stub
		return managerMapper.contentFAQ(faqNum);
	}

	public void updateFAQ(Map<Object, Object> faq) {
		managerMapper.updateFAQ(faq);
	}

	public void deleteFAQ(int faqNum) {

		managerMapper.deleteFAQ(faqNum);

	}

	public void deleteMember(String memberId) {
		
		managerMapper.deleteMember(memberId);

	}

}
