package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.CaseAnalyze;

/**
*@author created by answer
*@date 2018年4月14日-下午12:32:12
*
**/
public interface ICaseAnalyzeService {
	
	public Integer saveData(String caseName, String caseContent, String caseType);
	
	public Integer updateData(String caseId, String caseName, String caseContent, String caseType);
	
	public Integer deleteData(String caseId);
	
	public List<CaseAnalyze> getList(String caseName);
}

