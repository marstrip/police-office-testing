package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.PageHelper;
import com.police.testing.pojo.SysLoginLog;

public interface SysLoginLogMapper {
    int deleteByPrimaryKey(Integer autoId);

    int insert(SysLoginLog record);

    int insertSelective(SysLoginLog record);

    SysLoginLog selectByPrimaryKey(Integer autoId);

    int updateByPrimaryKeySelective(SysLoginLog record);

    int updateByPrimaryKey(SysLoginLog record);
    /**
     * 获取登录数据个数
     * @return
     */
    Long selectLoginCount();
    /**
     * 根据页码获取页面列表数据
     * @return
     */
    List<SysLoginLog> selectLoginList(@Param("page")PageHelper page);
}