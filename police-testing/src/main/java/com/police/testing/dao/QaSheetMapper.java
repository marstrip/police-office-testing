package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.QaSheet;
import com.police.testing.pojo.QaSheetWithBLOBs;

public interface QaSheetMapper {
    int deleteByPrimaryKey(String qaId);

    int insert(QaSheetWithBLOBs record);

    int insertSelective(QaSheetWithBLOBs record);

    QaSheetWithBLOBs selectByPrimaryKey(String qaId);

    int updateByPrimaryKeySelective(QaSheetWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(QaSheetWithBLOBs record);

    int updateByPrimaryKey(QaSheet record);

	List<QaSheetWithBLOBs> selectByLikeQuestionContent(@Param("questionContent")String questionContent, 
    		@Param("offset") Integer offset, @Param("limit") Integer limit);
	
	 int updateEnable(@Param("qaId") String qaId);
}