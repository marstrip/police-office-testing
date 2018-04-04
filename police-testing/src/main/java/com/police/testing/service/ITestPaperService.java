package com.police.testing.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.police.testing.pojo.TestPaper;

import net.sf.json.JSONObject;

public interface ITestPaperService {
	/**
	 * 保存提交的文件数据
	 * @param file
	 * @param fileName
	 * @return
	 */
	public JSONObject saveFileData(MultipartFile file, String fileName);
	
	/**
	 * 获取全部试卷数据
	 * @return
	 */
	public List<TestPaper> getTestPaperList();
}
