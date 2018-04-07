package com.police.testing.service;

import org.springframework.web.multipart.MultipartFile;

import net.sf.json.JSONObject;

public interface IQuestionService {
	/**
	 * 批量上传试题
	 * @param file
	 * @return
	 */
	public JSONObject saveQuestionByWord(MultipartFile file, String fileName);
}
