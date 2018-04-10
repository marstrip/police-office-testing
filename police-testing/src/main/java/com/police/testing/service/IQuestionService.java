package com.police.testing.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.police.testing.pojo.TestQuestionWithBLOBs;

import net.sf.json.JSONObject;

public interface IQuestionService {
	/**
	 * 批量上传试题
	 * @param file
	 * @return
	 */
	public JSONObject saveQuestionByWord(MultipartFile file, String fileName);
	
	/**
	 * 根据时间和选中ID集合获取数据集
	 * @param beginDate
	 * @param endDate
	 * @param uploadLogIds
	 * @return
	 */
	public List<TestQuestionWithBLOBs> getListByCreateAndUploadLogIds(String beginDate, String endDate, String[] uploadLogIds);
	
	/**
	 * 根据条件限定的题目范围内随机获取题目
	 * @param beginDate
	 * @param endDate
	 * @param uploadLogIds
	 * @param number
	 * @param questionType
	 * @return
	 */
	public List<TestQuestionWithBLOBs> getListByQuestionTypeAndNumber(String beginDate, String endDate, String[] uploadLogIds, Integer number, String questionType);
}
