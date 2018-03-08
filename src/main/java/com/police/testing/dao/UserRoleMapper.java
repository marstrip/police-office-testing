package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.Role;
import com.police.testing.pojo.UserRoleKey;

public interface UserRoleMapper {
    int deleteByPrimaryKey(UserRoleKey key);

    int insert(UserRoleKey record);

    int insertSelective(UserRoleKey record);
    /**
     * 根据登录名获取用户角色
     * @param loginName
     * @return
     */
    List<String> selectRoleByLoginName(@Param("loginName")String loginName);
    /**
     * 根据登录名获取角色
     * @param loginName
     * @return
     */
    List<Role> selectByLoginName(@Param("loginName") String loginName);
    /**
     * 修改用户对应的角色
     */
    int updateUserRole(@Param("userId")String userId,@Param("roleName")String roleName);
    /**
     * 删除用户角色关联
     * @param userId
     * @return
     */
    Integer deleteByUserId(@Param("userId")String userId);
}