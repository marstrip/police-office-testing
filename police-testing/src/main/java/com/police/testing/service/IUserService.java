package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.SysMenu;
import com.police.testing.pojo.SysUser;
import com.police.testing.pojo.User;

public interface IUserService {
	
//	 public User getUserById(int userId);  
	 
	 public SysUser findByLoginName(String loginName);
	 
	 public List<SysMenu> getMenu (String userId);
	 
//	 public User getUserByAccessToken(String accessToken);
	 /**
	  * 初始化用户
	  */
//	 public Integer insert(User user);
	 /**
	  * 更新数据
	  * @param user
	  */
//	 public void update(User user);
	 /**
	  * 根据登录名获取用户角色
	  * @param loginName
	  * @return
	  */
	 public List<String> getRoleByLoginName(String loginName);
	 /**
	  * 根据登录名获取用户权限
	  * @param loginName
	  * @return
	  */
	 public List<String> getPermissionByRoleName(String loginName);
	 /**
	  * 获取活动状态的用户及用户角色
	  * @return
	  */
//	 public List<User> getUserList(PageHelper page, String userName);
//	 /**
//	  * 根据用户姓名查询数据
//	  * @param userName
//	  * @return
//	  */
//	 public List<User> getUserList(String userName);
//	 /**
//	  * 获取全部用户个数
//	  * @return
//	  */
//	 public Long getCountUser();
//	 /**
//	  * 保存用户角色关系
//	  * @param userRole
//	  * @return
//	  */
//	 public Integer saveUserRole(UserRoleKey userRole);
//	 /**
//	  * 根据用户名获取角色
//	  * @param userMail
//	  * @return
//	  */
//	 public List<Role> getRoleByUserMail(String userMail);
//	 /**
//	  * 根据用户姓名删除用户
//	  * @param userName
//	  * @return
//	  */
//	 public Integer deleteUserByUserId(String userId);
//	 /**
//	  * 激活用户
//	  * @param userId
//	  * @return
//	  */
//	 public Integer activateUserByUserId(String userId, String userName);
//	 
//	 /**
//	  * 获取部门名称集合，并去重
//	  * @param companyName
//	  * @return
//	  */
//	 public List<User> getDepartmentByCompanyName(String companyName);
//	 
//	 /**
//	  * 获取部门名称集合，并去重
//	  * @param companyName
//	  * @return
//	  */
//	 public List<User> getUserByDepartmentId(String departmentId);

	public Integer deleteData(String userId, String enable);

	public List<User> getList(String userName, Integer offset, Integer limit);

	public long getCount(String userName);

	public Integer updateDataRole(String userId, String role);
	
	public boolean updatePassword(String oldPassword, String newPassword);
}
