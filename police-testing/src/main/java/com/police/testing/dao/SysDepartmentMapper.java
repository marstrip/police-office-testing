package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.SysDepartment;

public interface SysDepartmentMapper {
    int deleteByPrimaryKey(Integer autoId);

    int insert(SysDepartment record);

    int insertSelective(SysDepartment record);

    SysDepartment selectByPrimaryKey(Integer autoId);

    int updateByPrimaryKeySelective(SysDepartment record);

    int updateByPrimaryKey(SysDepartment record);
    
    public List<SysDepartment> selectByOrganId(String organizationId);
    
    List<SysDepartment> selectByDepartmentName(@Param("departmentName") String departmentName);
    
    Integer deleteByOrganizationId(@Param("organizationId") String organizationId);
}