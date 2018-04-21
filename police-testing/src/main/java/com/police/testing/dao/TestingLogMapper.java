package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.TestingLog;

public interface TestingLogMapper {
    int deleteByPrimaryKey(Integer autoId);

    int insert(TestingLog record);

    int insertSelective(TestingLog record);

    TestingLog selectByPrimaryKey(Integer autoId);

    int updateByPrimaryKeySelective(TestingLog record);

    int updateByPrimaryKey(TestingLog record);
    
    List<String> selectDistDepartmentName(@Param("beginDate") String beginDate, @Param("endDate") String endDate);
    
    List<TestingLog> selectByDepartmentNameAndType(@Param("departmentName") String departmentName, @Param("testingType") String testingType,
    		@Param("beginDate") String beginDate, @Param("endDate") String endDate);

	List<TestingLog> selectByTestPaperIdAndTypeAndSorce(@Param("testPaperId") String testPaperId, @Param("testingType") String testingType,
    		@Param("beginDate") String beginDate, @Param("endDate") String endDate, @Param("score") Integer score);
}