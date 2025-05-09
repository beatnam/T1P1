package com.itwillbs.service;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class GPTClient {

	@Value("${gpt.API_KEY}")
	private String apiKey;

	private String url = "https://api.openai.com/v1/chat/completions"; // 요청 주소
	private String model = "gpt-4o-mini";
	private double temperature = 0.5; // 답변 온도

	public String askKeyword(String prompt) {
		// REST API 요청을 위한 HTTP 통신
		// 1) 헤더 정보 설정
		HttpHeaders headers = new HttpHeaders();

		// 헤더 정보의 컨텐츠 타입
		headers.setContentType(MediaType.APPLICATION_JSON);

		// apiKey 담기
		headers.set("Authorization", "Bearer " + apiKey);

		// 2) 요청 파라미터 생성 (JSON 형식)
		Map<String, String> roleSystem = new HashMap<String, String>();
		roleSystem.put("role", "system");
		roleSystem.put("content", "입사 지원에 필요한 인재상을 알고싶어 프롬프트에 해당하는 회사의 인재상" + "단어로만 ,로 연결해서 서너개 부탁해");
		Map<String, String> roleUser = new HashMap<String, String>();
		roleUser.put("role", "user");
		roleUser.put("content", prompt);

		List<Map<String, String>> messages = new ArrayList<Map<String, String>>();
		messages.add(roleSystem);
		messages.add(roleUser);

		JSONObject requestData = new JSONObject();

		requestData.put("model", model);
		requestData.put("temperature", temperature);
		requestData.put("messages", messages);

		// 3) HTTP 요청 정보를 관리하는 HttpEntity 객체 생성
		// 헤더 정보와 요청 정보를 합치는 HttpEntity
		HttpEntity<String> httpEntity = new HttpEntity<String>(requestData.toString(), headers);
		System.out.println("HttpEntity : " + httpEntity);

		// 4) RESTful API 요청 RestTemplate 객체 생성
		RestTemplate restTemplate = new RestTemplate();

		// UTF-8 요청
		List<HttpMessageConverter<?>> messageConverters = new ArrayList<>();
		messageConverters.add(new StringHttpMessageConverter(StandardCharsets.UTF_8));
		messageConverters.addAll(restTemplate.getMessageConverters());
		restTemplate.setMessageConverters(messageConverters);

		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, httpEntity, String.class);
		System.out.println("이까진 오니?");
		System.out.println("responseEntity : " + responseEntity);
		System.out.println("reponseEntity.getBody() : " + responseEntity.getBody());

		return responseEntity.getBody();
	}

}
