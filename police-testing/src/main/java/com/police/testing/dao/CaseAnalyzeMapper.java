package com.police.testing.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.CaseAnalyze;

public interface CaseAnalyzeMapper {
    int deleteByPrimaryKey(String caseId);

    int insert(CaseAnalyze record);

    int insertSelective(CaseAnalyze record);

    CaseAnalyze selectByPrimaryKey(String caseId);

    int updateByPrimaryKeySelective(CaseAnalyze record);

    int updateByPrimaryKeyWithBLOBs(CaseAnalyze record);

    int updateByPrimaryKey(CaseAnalyze record);
    /**
     * 根据案例分析名称获取数据集合
     * @param caseName
     * @return
     */
    List<CaseAnalyze> selectByLikeCaseName(@Param("caseName") String caseName);
}