package com.itwillbs.service;

import javax.inject.Inject;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class GPTService {

	@Inject
	private GPTClient gptClient;
	
	public String askKeyword(String prompt) {
		System.out.println("ChatGPTService askChatGPT");

		String result = gptClient.askKeyword(prompt);

		// 배열의 내용만 뽑아오기
		JSONObject jsonObject = new JSONObject(result);
		JSONArray jsonArray = jsonObject.getJSONArray("choices");
		JSONObject firstChoice = jsonArray.getJSONObject(0);
		JSONObject message = firstChoice.getJSONObject("message");

		String cont = message.getString("content");

		return cont;
		
	}

	public String updateCoverLetter(String prompt) {
		String result = gptClient.updateCoverLetter(prompt);

		// 배열의 내용만 뽑아오기
		JSONObject jsonObject = new JSONObject(result);
		JSONArray jsonArray = jsonObject.getJSONArray("choices");
		JSONObject firstChoice = jsonArray.getJSONObject(0);
		JSONObject message = firstChoice.getJSONObject("message");

		String cont = message.getString("content");

		return cont;
	}

}
