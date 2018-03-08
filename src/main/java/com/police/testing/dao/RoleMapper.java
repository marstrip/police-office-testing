package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.PageHelper;
import com.police.testing.pojo.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer autoId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer autoId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    /**
     * 根据角色状态获取数据
     * @param roleStatus
     * @return
     */
    List<Role> selectByStatus(@Param("roleStatus") String roleStatus);
    /**
     * 根据分页获取角色列表数据
     * @param roleStatus
     * @param page
     * @return
     */
    List<Role> selectByPage(@Param("roleStatus")String roleStatus,@Param("page")PageHelper page);
    /**
     * 根据角色名称获取角色
     * @param roleName
     * @return
     */
    List<Role> selectByRoleName(@Param("roleName")String roleName);
}