package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.TestPaperUpload;

public interface TestPaperUploadMapper {
    int deleteByPrimaryKey(Integer autoId);

    int insert(TestPaperUpload record);

    int insertSelective(TestPaperUpload record);

    TestPaperUpload selectByPrimaryKey(Integer autoId);

    int updateByPrimaryKeySelective(TestPaperUpload record);

    int updateByPrimaryKey(TestPaperUpload record);
    /**
     * 通过试题id获取上传文件集合
     * @param testPaperId
     * @return
     */
	List<TestPaperUpload> selectUploadIdsByTestPaperId(@Param("testPaperId") String testPaperId);
}