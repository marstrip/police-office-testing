package com.police.testing.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.CaseAnalyzeMapper;
import com.police.testing.pojo.CaseAnalyze;
import com.police.testing.service.ICaseAnalyzeService;

/**
*@author created by answer
*@date 2018年4月14日-下午12:33:20
*
**/
@Component("caseAnalyzeService")
public class CaseAnalyzeServiceImpl implements ICaseAnalyzeService{
	@Autowired
	private CaseAnalyzeMapper caseAnaLyzeMapper;
	
	@Override
	public Integer saveData(String caseName, String caseContent, String caseType) {
		String caseId = "CA" + UUID.randomUUID().toString().replace("-", "");
		CaseAnalyze caseAnalyze = new CaseAnalyze();
		caseAnalyze.setCaseId(caseId);
		caseAnalyze.setCaseName(caseName);
		caseAnalyze.setCaseContent(caseContent);
		caseAnalyze.setCaseType(caseType);
		caseAnalyze.setCreateDate(new Date());
		caseAnalyze.setEnable("1");
		return caseAnaLyzeMapper.insert(caseAnalyze);
	}

	@Override
	public Integer updateData(String caseId, String caseName, String caseContent, String caseType) {
		CaseAnalyze caseAnalyze = caseAnaLyzeMapper.selectByPrimaryKey(caseId);
		caseAnalyze.setCaseContent(caseContent);
		caseAnalyze.setCaseName(caseName);
		caseAnalyze.setCaseType(caseType);
		caseAnalyze.setUpdateDate(new Date());
		return caseAnaLyzeMapper.updateByPrimaryKey(caseAnalyze);
	}

	@Override
	public Integer deleteData(String caseId) {
		CaseAnalyze caseAnalyze = new CaseAnalyze();
		caseAnalyze.setCaseId(caseId);
		caseAnalyze.setEnable("0");
		return caseAnaLyzeMapper.updateByPrimaryKeySelective(caseAnalyze);
	}

	@Override
	public List<CaseAnalyze> getList(String caseName) {
		return caseAnaLyzeMapper.selectByLikeCaseName(caseName);
	}

}

