package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.police.testing.pojo.TestSelf;

public interface TestSelfMapper {
    int deleteByPrimaryKey(String testSelfId);

    int insert(TestSelf record);

    int insertSelective(TestSelf record);

    TestSelf selectByPrimaryKey(String testSelfId);

    int updateByPrimaryKeySelective(TestSelf record);

    int updateByPrimaryKeyWithBLOBs(TestSelf record);

    int updateByPrimaryKey(TestSelf record);
    
    /**
     * 根据名称获取数据集合
     * @param selfName
     * @return
     */
    List<TestSelf> selectByLikeTestSelfName(@Param("testSelfContent") String testSelfContent, 
    		@Param("offset") Integer offset, @Param("limit") Integer limit);
    
    int updateEnable(@Param("testSelfId") String testSelfId);
}