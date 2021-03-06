package com.police.testing.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.QaSheetMapper;
import com.police.testing.pojo.QaSheetWithBLOBs;
import com.police.testing.service.IQaSheetService;

/**
*@author created by answer
*@date 2018年4月14日-下午2:06:00
*
**/
@Component("qaSheetService")
public class QaSheetServiceImpl implements IQaSheetService{
	@Autowired
	private QaSheetMapper qaSheetMapper;
	
	@Override
	public Integer saveData(String questionContent) {
		// TODO Auto-generated method stub
		String qaId = "QA" + UUID.randomUUID().toString().replace("-", "");
		QaSheetWithBLOBs qaSheet = new QaSheetWithBLOBs();
		qaSheet.setQaId(qaId);
		qaSheet.setQuestionContent(questionContent);
		Date now = new Date();
		qaSheet.setCreateDate(now);
		qaSheet.setUpdateDate(now);
		qaSheet.setEnable("1");
		qaSheet.setQaStatus("0");
		return qaSheetMapper.insertSelective(qaSheet);
	}

	@Override
	public Integer updateData(String qaId, String questionContent, String questionAnswer, String qaStatus) {
		// TODO Auto-generated method stub
		QaSheetWithBLOBs qaSheetWithBLOBs = qaSheetMapper.selectByPrimaryKey(qaId);
		if(StringUtils.isNotBlank(questionAnswer)){
			qaSheetWithBLOBs.setQuestionAnswer(questionAnswer);
		}
		if(StringUtils.isNotBlank(qaStatus)){
			qaSheetWithBLOBs.setQaStatus(qaStatus);
		}
		if(StringUtils.isNotBlank(questionAnswer)){
			qaSheetWithBLOBs.setQuestionAnswer(questionAnswer);
		}
		return qaSheetMapper.updateByPrimaryKeySelective(qaSheetWithBLOBs);
	}

	@Override
	public Integer deleteData(String qaId) {
		return qaSheetMapper.updateEnable(qaId);
	}

	@Override
	public List<QaSheetWithBLOBs> getList(String questionContent, Integer offset, Integer limit, String qaStatus) {
		return qaSheetMapper.selectByLikeQuestionContent(questionContent, offset, limit, qaStatus);
	}

	@Override
	public QaSheetWithBLOBs getContentById(String qaId) {
		QaSheetWithBLOBs qaSheetWithBLOBs = qaSheetMapper.selectByPrimaryKey(qaId);
		return qaSheetWithBLOBs;
	}

	@Override
	public long getCount(String questionContent, String qaStatus) {
		List<QaSheetWithBLOBs> qaSheets = qaSheetMapper.selectByLikeQuestionContent(questionContent, null, null, qaStatus);
		return qaSheets.size();
	}
}

