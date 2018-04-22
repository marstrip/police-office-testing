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
    /**
     * 根据时间段获取所有去重上传部门集合
     * @param beginDate
     * @param endDate
     * @param limit 
     * @param offset 
     * @return
     */
    List<String> selectDistDepartmentName(@Param("beginDate") String beginDate, @Param("endDate") String endDate, @Param("offset") Integer offset,@Param("limit") Integer limit);
    /**
     * 根据部门和登录时间获取登录记录集合
     * @param departmentName
     * @param beginDate
     * @param endDate
     * @return
     */
    List<SysLoginLog> selectByDepartmentName(@Param("departmentName") String departmentName,@Param("beginDate") String beginDate, @Param("endDate") String endDate);
}