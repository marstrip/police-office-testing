package com.police.testing.dao;

import com.police.testing.pojo.TestPaperQuestion;

public interface TestPaperQuestionMapper {
    int deleteByPrimaryKey(Integer autoId);

    int insert(TestPaperQuestion record);

    int insertSelective(TestPaperQuestion record);

    TestPaperQuestion selectByPrimaryKey(Integer autoId);

    int updateByPrimaryKeySelective(TestPaperQuestion record);

    int updateByPrimaryKey(TestPaperQuestion record);
}