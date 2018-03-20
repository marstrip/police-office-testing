package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.RolePermission;

public interface RolePermissionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(RolePermission record);

    int insertSelective(RolePermission record);

    RolePermission selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RolePermission record);

    int updateByPrimaryKey(RolePermission record);
    /**
     * 根据角色名称获取权限集合
     * @param roleName
     * @return
     */
    List<String> selectByRoleName(@Param("roleName")String roleName);
    /**
     * 根据角色名称删除现有权限
     * @param roleName
     * @return
     */
    Integer deleteByRoleName(@Param("roleName")String roleName);
    /**
     * 判断此角色是否赋予此权限
     * @param roleName
     * @param permission
     * @return
     */
    List<RolePermission> selectByRoleNameAndPermission(@Param("roleName")String roleName, @Param("permission") String permission);
}