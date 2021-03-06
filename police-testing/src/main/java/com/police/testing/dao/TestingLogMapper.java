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
    
    List<String> selectDistDepartmentName(@Param("beginDate") String beginDate, @Param("endDate") String endDate, 
    		@Param("offset") Integer offset,@Param("limit") Integer limit, @Param("testPaperId") String testPaperId);
    
    List<TestingLog> selectByDepartmentNameAndType(@Param("departmentName") String departmentName, @Param("testingType") String testingType,
    		@Param("beginDate") String beginDate, @Param("endDate") String endDate);

    List<TestingLog> selectByDepartmentTypeAndPaperId(@Param("departmentName") String departmentName, @Param("testingType") String testingType, @Param("testPaperId") String testPaperId);
    
	List<TestingLog> selectByTestPaperIdAndTypeAndSorce(@Param("testPaperId") String testPaperId, @Param("testingType") String testingType, @Param("departmentName") String departmentName,
			
    		@Param("beginDate") String beginDate, @Param("endDate") String endDate, @Param("score") Integer score);

	List<TestingLog> selectByTestPaperIdAndUserId(@Param("testPaperId") String testPaperId, @Param("userId") String userId, @Param("testingType") String testingType);

	List<TestingLog> selectByUserIdAndType(@Param("userId") String userId, @Param("testingType") String testingType,
			@Param("offset") Integer offset,@Param("limit") Integer limit);

	Integer deleteByTestPaperIdAndUserId(@Param("testPaperId") String testPaperId, @Param("userId") String userId);

	List<TestingLog> selectByLikeUserId(@Param("userId") String  userId, @Param("offset") Integer offset,@Param("limit") Integer limit);
}