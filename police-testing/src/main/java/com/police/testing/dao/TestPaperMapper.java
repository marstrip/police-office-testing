package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.TestPaper;

public interface TestPaperMapper {
    int deleteByPrimaryKey(String testPaperId);

    int insert(TestPaper record);

    int insertSelective(TestPaper record);

    TestPaper selectByPrimaryKey(String testPaperId);

    int updateByPrimaryKeySelective(TestPaper record);

    int updateByPrimaryKey(TestPaper record);
    /**
     * 根据试卷id获取数据
     * @param testPaperId
     * @return
     */
    List<TestPaper> selectByTestPaperId(@Param("testPaperIds") List<String> testPaperId);
    /**
     * 根据试卷名称获取数据集合
     * @return
     */
    List<TestPaper> selectByLikeTestPapaerName(@Param("testPaperName") String testPaperName);
}