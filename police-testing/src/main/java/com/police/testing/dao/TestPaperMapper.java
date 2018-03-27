package com.police.testing.dao;

import com.police.testing.pojo.TestPaper;

public interface TestPaperMapper {
    int deleteByPrimaryKey(String testPaperId);

    int insert(TestPaper record);

    int insertSelective(TestPaper record);

    TestPaper selectByPrimaryKey(String testPaperId);

    int updateByPrimaryKeySelective(TestPaper record);

    int updateByPrimaryKey(TestPaper record);
}