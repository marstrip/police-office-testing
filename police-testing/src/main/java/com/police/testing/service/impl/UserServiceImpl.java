package com.police.testing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.police.testing.dao.RolePermissionMapper;
import com.police.testing.dao.UserMapper;
import com.police.testing.dao.UserRoleMapper;
import com.police.testing.pojo.PageHelper;
import com.police.testing.pojo.Role;
import com.police.testing.pojo.SysMenu;
import com.police.testing.pojo.User;
import com.police.testing.pojo.UserRoleKey;
import com.police.testing.service.IUserService;
@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private RolePermissionMapper rolePermissionMapper;
	
	public User getUserById(int userId) {
		return this.userMapper.selectByPrimaryKey(userId);
	}

	public User findByLoginName(String loginName) {
		return this.userMapper.findByLoginName(loginName, "1");
	}

	public List<SysMenu> getMenu(String userId) {
		return this.userMapper.getMenuByUserId(userId);
	}

	public User getUserByAccessToken(String accessToken) {
		return this.userMapper.selectByAccessToken(accessToken);
	}

	@Transactional
	public Integer insert(User user) {
		return userMapper.insert(user);
	}

	@Transactional
	public void update(User user) {
		userMapper.updateByPrimaryKey(user);
	}

	@Override
	public List<String> getRoleByLoginName(String loginName) {
		List<String> roles = userRoleMapper.selectRoleByLoginName(loginName);
		return roles;
	}

	@Override
	public List<String> getPermissionByRoleName(String roleName) {
		List<String> permissions = rolePermissionMapper.selectByRoleName(roleName);
		return permissions;
	}

	@Override
	public List<User> getUserList(PageHelper page, String userName) {
		List<User> users = userMapper.selectUserList(page, userName);
		return users;
	}
	
	public List<User> getUserList(String userName){
		List<User> users = userMapper.selectUserByUserName(userName);
		return users;
	}
	@Override
	public Long getCountUser() {
		Long count = userMapper.getCountUser();
		return count;
	}

	@Override
	public Integer saveUserRole(UserRoleKey userRole) {
		return userRoleMapper.insert(userRole);
	}

	@Override
	public List<Role> getRoleByUserMail(String userMail) {
		return userRoleMapper.selectByLoginName(userMail);
	}

	@Override
	@Transactional
	public Integer deleteUserByUserId(String userId) {
		//更新用户状态
		Integer flagUser = userMapper.updateUserByUserId(userId, "0");
		//删除用户角色
		Integer flagRole = userRoleMapper.deleteByUserId(userId);
		return flagUser + flagRole;
	}

	@Override
	@Transactional
	public Integer activateUserByUserId(String userId, String userName) {
		//更新用户状态
		Integer flagUser = userMapper.activateUserByUserId(userName, userId, "1");
		return flagUser;
	}

	@Override
	public List<User> getDepartmentByCompanyName(String companyName) {
		return userMapper.selectDistByCompanyName(companyName);
	}

	@Override
	public List<User> getUserByDepartmentId(String departmentId) {
		List<User> users = userMapper.selectUserByDepartmentId(departmentId);
		return users;
	}

}
