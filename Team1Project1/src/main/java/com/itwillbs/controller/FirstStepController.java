package com.itwillbs.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;
import com.itwillbs.domain.ApplicationDTO;
import com.itwillbs.domain.CoverletterDTO;
import com.itwillbs.domain.OccupationDTO;
import com.itwillbs.service.FirstStepService;
import com.itwillbs.service.JobService;
import com.itwillbs.service.MainService;

@Controller
@RequestMapping("/first/*")
public class FirstStepController {
	@Inject
	private MainService mainService;

	@Inject
	private JobService jobService;

	@Inject
	FirstStepService firstStepService;

	@Resource(name = "coverLetterPath")
	private String coverLetterPath;

	@GetMapping("/filtering")
	public String part1(Model model, HttpSession session) {

		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/first/plz_login";
		} else {

			List<OccupationDTO> occupations = jobService.getOccupations();

			model.addAttribute("occupations", occupations);

			return "/first/part1";
		}
	}

	// 세션값 없으면 얼럿 후 로그인으로 이동
	@GetMapping("/plz_login")
	public String plzLogin() {

		return "/first/plz_login";
	}

	// 세션값 없으면 얼럿 후 로그인으로 이동
	@GetMapping("/application")
	public String applyDirect(@RequestParam String recruitId, Model model) {
		System.out.println(recruitId);
		Map<Object, Object> result = mainService.result(recruitId);

		model.addAttribute("recruit", result);

		return "/first/direct_application";
	}

	@PostMapping("/filteringPro")
	public String FilterPro(@RequestParam Map<Object, Object> filter, Model model) {

		List<Map<Object, Object>> resultOR = mainService.listOR(filter);
		List<Map<Object, Object>> resultRecruit = mainService.listRecruit(filter);
		model.addAttribute("resultOR", resultOR);
		model.addAttribute("resultRecruit", resultRecruit);

		return "/first/coverletter";
	}

	// 저장, 지원 후 메인 이동
	@PostMapping("/submit_application")
	public String submitApplication(HttpSession session, @RequestParam String companyName,
			@RequestParam("gptResult") String gptResult) {
		System.out.println(companyName);

		int corpNum = searchCorp(companyName);
		System.out.println(corpNum);
		int memberNum = (int) session.getAttribute("member_num");

		CoverletterDTO cvDTO = new CoverletterDTO();
		cvDTO.setMemberNum(memberNum);
		cvDTO.setCvContent(gptResult);
		cvDTO.setCvDate(LocalDateTime.now());
		cvDTO.setCorporationMemberNum(corpNum);
		// 1. UUID 기반 파일 이름 생성
		String uuid = UUID.randomUUID().toString();
		String fileName = "coverletter_" + uuid + ".pdf";

		// 2. 디렉토리 생성
		File dir = new File(coverLetterPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		// 3. 파일 경로 설정
		String absolutePath = coverLetterPath + File.separator + fileName;

		try {
			generatePdfFromContent(gptResult, absolutePath); // PDF 생성
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 오류 시 에러 페이지 이동
		}
		cvDTO.setCvFileName(fileName);
		// 4. 저장 후 메인으로 이동
		firstStepService.saveAndApply(cvDTO);

		ApplicationDTO appDTO = new ApplicationDTO();
		appDTO.setMemberNum(memberNum);
		appDTO.setCorporationMemberNum(corpNum);
		appDTO.setCvPdf(fileName);
		appDTO.setApplicationDate(LocalDateTime.now());

		String resume = searchResume(memberNum);
		System.out.println(resume);
		if (resume == null) {
			return "redirect:/first/plz_resume";
			
		} else {
			appDTO.setResumePdf(resume);

			firstStepService.apply(appDTO);

			return "redirect:/main/main";
		}
	}
	
	// 세션값 없으면 얼럿 후 로그인으로 이동
	@GetMapping("/plz_resume")
	public String plzResume() {

		return "/first/plz_resume";
	}
	

	private String searchResume(int memberNum) {
		String resume = firstStepService.searchResume(memberNum);
		return resume;
	}

	private Integer searchCorp(String companyName) {

		int corpNum = firstStepService.searchCorp(companyName);

		return corpNum;
	}

	// 저장만 하고 메인 이동
	@PostMapping("/save_and_home")
	public String saveAndHome(HttpSession session, @RequestParam("gptResult") String gptResult) {
		System.out.println("saveAndHome()");

		int memberNum = (int) session.getAttribute("member_num");

		CoverletterDTO cvDTO = new CoverletterDTO();
		cvDTO.setMemberNum(memberNum);
		cvDTO.setCvContent(gptResult);
		cvDTO.setCvDate(LocalDateTime.now());

		// 1. UUID 기반 파일 이름 생성
		String uuid = UUID.randomUUID().toString();
		String fileName = "coverletter_" + uuid + ".pdf";

		// 2. 디렉토리 생성
		File dir = new File(coverLetterPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		// 3. 파일 경로 설정
		String absolutePath = coverLetterPath + File.separator + fileName;

		try {
			generatePdfFromContent(gptResult, absolutePath); // PDF 생성
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 오류 시 에러 페이지 이동
		}

		cvDTO.setCvFileName(fileName);
		// 4. 저장 후 메인으로 이동
		firstStepService.saveCoverLetter(cvDTO);
		return "redirect:/main/main";
	}

	private void generatePdfFromContent(String content, String filePath) throws Exception {
		Document document = new Document();

		PdfWriter.getInstance(document, new FileOutputStream(filePath)); // ← iText 5 방식
		document.open();
		String fontPath = "/usr/local/share/fonts/malgun.ttf"; // 또는 나눔고딕 등 TTF 폰트 경로
		BaseFont baseFont = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		Font font = new Font(baseFont, 12);
		for (String line : content.split("\n")) {
			document.add(new Paragraph(line, font));
		}

		document.close();
	}

	// 저장 후 해당 홈페이지 이동
	@PostMapping("/save_and_page")
	public String saveAndPage(HttpSession session, @RequestParam("companyUrl") String companyUrl,
			@RequestParam("gptResult") String gptResult) {
		System.out.println(companyUrl);

		int memberNum = (int) session.getAttribute("member_num");

		CoverletterDTO cvDTO = new CoverletterDTO();
		cvDTO.setMemberNum(memberNum);
		cvDTO.setCvContent(gptResult);
		cvDTO.setCvDate(LocalDateTime.now());

		// 1. UUID 기반 파일 이름 생성
		String uuid = UUID.randomUUID().toString();
		String fileName = "coverletter_" + uuid + ".pdf";

		// 2. 디렉토리 생성
		File dir = new File(coverLetterPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		// 3. 파일 경로 설정
		String absolutePath = coverLetterPath + File.separator + fileName;
		String relativePath = coverLetterPath;

		try {
			generatePdfFromContent(gptResult, absolutePath); // PDF 생성
			cvDTO.setCvFilePath(relativePath); // DB에 상대 경로 저장
		} catch (Exception e) {
			e.printStackTrace();
			return "error"; // 오류 시 에러 페이지 이동
		}

		cvDTO.setCvFileName(fileName);
		// 4. 저장 후 메인으로 이동
		firstStepService.saveCoverLetter(cvDTO);

		return "redirect:" + companyUrl;
	}

}
