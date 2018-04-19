package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.TestPaperQuestion;

public interface TestPaperQuestionMapper {
    int deleteByPrimaryKey(Integer autoId);

    int insert(TestPaperQuestion record);

    int insertSelective(TestPaperQuestion record);

    TestPaperQuestion selectByPrimaryKey(Integer autoId);

    int updateByPrimaryKeySelective(TestPaperQuestion record);

    int updateByPrimaryKey(TestPaperQuestion record);
    
    int deleteByTestPaperId(@Param("testPaperId")String testPaperId);
    /**
     * 根据试卷id获取试卷试题关系
     * @param testPaperId
     * @return
     */
    List<TestPaperQuestion> selectByTestPaperId(@Param("testPaperId") String testPaperId);
}