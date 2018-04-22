package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.TestQuestion;
import com.police.testing.pojo.TestQuestionWithBLOBs;

public interface TestQuestionMapper {
    int deleteByPrimaryKey(Integer testQuestionsId);

    int insert(TestQuestionWithBLOBs record);

    int insertSelective(TestQuestionWithBLOBs record);

    TestQuestionWithBLOBs selectByPrimaryKey(String testQuestionsId);

    int updateByPrimaryKeySelective(TestQuestionWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(TestQuestionWithBLOBs record);

    int updateByPrimaryKey(TestQuestion record);
    
    /**
     * 根据上传时间和id集合获取数据
     * @param beginDate
     * @param endDate
     * @param uploadFileLogs
     * @return
     */
    List<TestQuestionWithBLOBs> selectByCreateDateAndUploadFileIds(@Param("beginDate") String beginDate, @Param("endDate") String endDate,
    		@Param("list") List<String> uploadFileLogs);
    
    /**
     * 根据限定题库的范围随机获取指定数量和题目类型的试题
     * @param beginDate
     * @param endDate
     * @param uploadFileLogs
     * @param questionType
     * @param number
     * @return
     */
    List<TestQuestionWithBLOBs> selectRandomByQuestionTypeAndNumber(@Param("beginDate") String beginDate, @Param("endDate") String endDate,
    		@Param("list") List<String> uploadFileLogs, @Param("questionType") String questionType, @Param("number")Integer number);
    /**
     * 根据试题ID批量获取试题
     * @param testQuestionIds
     * @param limit 
     * @param offset 
     * @return
     */
	List<TestQuestionWithBLOBs> selectByTestQuestionIds(@Param("testQuestionIds") List<String> testQuestionIds, @Param("offset") Integer offset, @Param("limit") Integer limit);

	List<TestQuestionWithBLOBs> selectByLikeQuestionName(@Param("questionName")String questionName, 
    		@Param("offset") Integer offset, @Param("limit") Integer limit);

	Integer updateEnable(@Param("testQuestionsId") String testQuestionsId);
}