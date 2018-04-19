package com.police.testing.dao;

import com.police.testing.pojo.TestingLog;

public interface TestingLogMapper {
    int deleteByPrimaryKey(Integer autoId);

    int insert(TestingLog record);

    int insertSelective(TestingLog record);

    TestingLog selectByPrimaryKey(Integer autoId);

    int updateByPrimaryKeySelective(TestingLog record);

    int updateByPrimaryKey(TestingLog record);
}