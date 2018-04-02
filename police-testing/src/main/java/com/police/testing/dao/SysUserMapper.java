package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.SysMenu;
import com.police.testing.pojo.SysUser;

public interface SysUserMapper {
    int deleteByPrimaryKey(Integer autoId);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Integer autoId);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);
    /**
     * 根据登录名称获取用户信息
     * @param loginName
     * @return
     */
    SysUser findByLoginName(@Param("loginName")String loginName, @Param("userStatus")String userStatus);
    /**
     * 根据userId获取菜单
     * @param userId
     * @return
     */
    List<SysMenu> getMenuByUserId (String userId);
}