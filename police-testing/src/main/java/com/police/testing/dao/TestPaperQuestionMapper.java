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

    List<TestPaperQuestion> sumQuestionFailCount(@Param("offset") Integer offset, @Param("limit") Integer limit);

    Integer sumQuestionRightCount(@Param("testQuestionId") String testQuestionId);

	void updateRightCount(@Param("testPaperId") String testPaperId, @Param("testQuestionsId") String testQuestionsId);

	void updateFailCount(@Param("testPaperId") String testPaperId, @Param("testQuestionsId") String testQuestionsId);

	List<TestPaperQuestion> selectByQuestionId(@Param("testQuestionsId") String testQuestionsId);
}