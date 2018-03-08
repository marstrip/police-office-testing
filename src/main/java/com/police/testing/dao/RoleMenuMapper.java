package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.RoleMenu;

public interface RoleMenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleMenu record);

    int insertSelective(RoleMenu record);

    RoleMenu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleMenu record);

    int updateByPrimaryKey(RoleMenu record);
    /**
     * 根据角色名称获取菜单集合
     * @param roleName
     * @return
     */
    List<RoleMenu> selectByRoleName(@Param("roleName")String roleName);
    /**
     * 根据角色名称和菜单id查找
     * @param roleName
     * @param menuId
     * @return
     */
    List<RoleMenu> selectByRoleNameAndMenuId(@Param("roleName")String roleName,@Param("menuId")Integer menuId);
    /**
     * 根据用户角色名称删除菜单
     * @param roleName
     * @return
     */
    Integer deleteByRoleName(@Param("roleName")String roleName);
}