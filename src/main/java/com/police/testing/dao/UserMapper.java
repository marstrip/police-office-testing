package com.police.testing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.police.testing.pojo.PageHelper;
import com.police.testing.pojo.SysMenu;
import com.police.testing.pojo.User;


public interface UserMapper {
    int deleteByPrimaryKey(Integer autoId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer autoId);
    
    User selectByAccessToken(String accessToken);
    
    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User findByLoginName(@Param("loginName")String loginName, @Param("userStatus")String userStatus);
    
    List<SysMenu> getMenuByUserId (String userId);
    
    List<User> getUserByDepartmentId(@Param("page")PageHelper page,@Param("departmentId") String departmentId);
    /**
     * 获取全部用户
     * @param userStatus
     * @return
     */
    List<User> selectUserList(@Param("page")PageHelper page, @Param("userName")String userName);
    /**
     * 根据用户姓名查询数据
     * @param userName
     * @return
     */
    List<User> selectUserByUserName(@Param("userName") String userName);
    /**
     * 获取全部用户个数
     * @return
     */
    Long getCountUser();
    
    List<User> selectByUserId(@Param("userId") String userId);
    /**
     * 更新用户状态
     * @param userId
     * @return
     */
    Integer updateUserByUserId(@Param("userId") String userId, @Param("userStatus") String userStatus);
    /**
     * 激活账号
     * @param userName
     * @param userId
     * @param userStatus
     * @return
     */
    Integer activateUserByUserId(@Param("userName")String userName,
    		@Param("userId") String userId, @Param("userStatus") String userStatus);
    
    /**
     * 根据部门Id获取模板Id
     * @param departmentId
     * @param formId
     * @return
     */
    List<User> selectByDepartmentIdAndFormId(@Param("departmentId") String departmentId, @Param("formId") String formId);
    /**
     * 按照机构删除所有用户
     * @param organizationId
     * @return
     */
    Integer deleteByOrganizationId(@Param("organizationId") String organizationId);
    
    /**
     * 去重获取部门组织结构
     * @param companyName
     * @return
     */
    List<User> selectDistByCompanyName(@Param("companyName") String companyName);
    
    /**
     * 去重获取部门组织结构
     * @param companyName
     * @return
     */
    List<User> selectUserByDepartmentId(@Param("departmentId") String departmentId);
}