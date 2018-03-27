package com.police.testing.service;

import org.springframework.web.multipart.MultipartFile;

import net.sf.json.JSONObject;

public interface ITestPaperService {
	
	public JSONObject saveFileData(MultipartFile file, String fileName);
}
