package com.police.testing.dao;

import com.police.testing.pojo.TestQuestion;
import com.police.testing.pojo.TestQuestionWithBLOBs;

public interface TestQuestionMapper {
    int deleteByPrimaryKey(Integer testQuestionsId);

    int insert(TestQuestionWithBLOBs record);

    int insertSelective(TestQuestionWithBLOBs record);

    TestQuestionWithBLOBs selectByPrimaryKey(Integer testQuestionsId);

    int updateByPrimaryKeySelective(TestQuestionWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(TestQuestionWithBLOBs record);

    int updateByPrimaryKey(TestQuestion record);
}