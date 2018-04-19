package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.UploadFileLog;

public interface UploadFileLogMapper {
    int deleteByPrimaryKey(String uploadFileId);

    int insert(UploadFileLog record);

    int insertSelective(UploadFileLog record);

    UploadFileLog selectByPrimaryKey(String uploadFileId);

    int updateByPrimaryKeySelective(UploadFileLog record);

    int updateByPrimaryKeyWithBLOBs(UploadFileLog record);

    int updateByPrimaryKey(UploadFileLog record);
    /**
     * 根据上传文件名称获取数据
     * @param fileName
     * @return
     */
    List<UploadFileLog> selectByFileName(@Param("fileName") String fileName);

    /**
     * 根据上传时间区间获取数据
     * @param beginDate
     * @param endDate
     * @return
     */
    List<UploadFileLog> selectByCreateDate(@Param("beginDate") String beginDate, @Param("endDate") String endDate, 
    		@Param("fileName") String fileName);
}