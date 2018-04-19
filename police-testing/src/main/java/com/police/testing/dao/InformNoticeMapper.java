package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.police.testing.pojo.InformNotice;

public interface InformNoticeMapper {
    int deleteByPrimaryKey(String informId);

    int insert(InformNotice record);

    int insertSelective(InformNotice record);

    InformNotice selectByPrimaryKey(String informId);

    int updateByPrimaryKeySelective(InformNotice record);

    int updateByPrimaryKeyWithBLOBs(InformNotice record);

    int updateByPrimaryKey(InformNotice record);
    
    /**
     * 根据名称获取数据集合
     * @param caseName
     * @return
     */
    List<InformNotice> selectByLikeInformName(@Param("informName") String informName);
}