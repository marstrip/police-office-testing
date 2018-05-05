package com.police.testing.service.impl;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.police.testing.dao.RolePermissionMapper;
import com.police.testing.dao.SysUserMapper;
import com.police.testing.dao.UserRoleMapper;
import com.police.testing.pojo.SysMenu;
import com.police.testing.pojo.SysUser;
import com.police.testing.pojo.TestPaper;
import com.police.testing.pojo.User;
import com.police.testing.pojo.UserRole;
import com.police.testing.pojo.UserRoleKey;
import com.police.testing.service.IUserService;
@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired
	private SysUserMapper sysUserMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private RolePermissionMapper rolePermissionMapper;
//	
//	public User getUserById(int userId) {
//		return this.userMapper.selectByPrimaryKey(userId);
//	}
//
//	public User findByLoginName(String loginName) {
//		return this.userMapper.findByLoginName(loginName, "1");
//	}
//
	public List<SysMenu> getMenu(String userId) {
		return this.sysUserMapper.getMenuByUserId(userId);
	}
//
//	public User getUserByAccessToken(String accessToken) {
//		return this.userMapper.selectByAccessToken(accessToken);
//	}
//
//	@Transactional
//	public Integer insert(User user) {
//		return userMapper.insert(user);
//	}
//
//	@Transactional
//	public void update(User user) {
//		userMapper.updateByPrimaryKey(user);
//	}
//
//	@Override
//	public List<String> getRoleByLoginName(String loginName) {
//		List<String> roles = userRoleMapper.selectRoleByLoginName(loginName);
//		return roles;
//	}
//
//	@Override
//	public List<String> getPermissionByRoleName(String roleName) {
//		List<String> permissions = rolePermissionMapper.selectByRoleName(roleName);
//		return permissions;
//	}
//
//	@Override
//	public List<User> getUserList(PageHelper page, String userName) {
//		List<User> users = userMapper.selectUserList(page, userName);
//		return users;
//	}
//	
//	public List<User> getUserList(String userName){
//		List<User> users = userMapper.selectUserByUserName(userName);
//		return users;
//	}
//	@Override
//	public Long getCountUser() {
//		Long count = userMapper.getCountUser();
//		return count;
//	}
//
//	@Override
//	public Integer saveUserRole(UserRoleKey userRole) {
//		return userRoleMapper.insert(userRole);
//	}
//
//	@Override
//	public List<Role> getRoleByUserMail(String userMail) {
//		return userRoleMapper.selectByLoginName(userMail);
//	}
//
//	@Override
//	@Transactional
//	public Integer deleteUserByUserId(String userId) {
//		//更新用户状态
//		Integer flagUser = userMapper.updateUserByUserId(userId, "0");
//		//删除用户角色
//		Integer flagRole = userRoleMapper.deleteByUserId(userId);
//		return flagUser + flagRole;
//	}
//
//	@Override
//	@Transactional
//	public Integer activateUserByUserId(String userId, String userName) {
//		//更新用户状态
//		Integer flagUser = userMapper.activateUserByUserId(userName, userId, "1");
//		return flagUser;
//	}
//
//	@Override
//	public List<User> getDepartmentByCompanyName(String companyName) {
//		return userMapper.selectDistByCompanyName(companyName);
//	}
//
//	@Override
//	public List<User> getUserByDepartmentId(String departmentId) {
//		List<User> users = userMapper.selectUserByDepartmentId(departmentId);
//		return users;
//	}
	@Override
	public SysUser findByLoginName(String loginName) {
		SysUser sysUser = sysUserMapper.findByLoginName(loginName, "1");
		return sysUser;
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
	public Integer deleteData(String userId, String enable) {
		return sysUserMapper.updateEnable(userId, enable);
	}
	@Override
	public List<User> getList(String userName, Integer offset, Integer limit) {
		List<User> users = sysUserMapper.selectByLikeUserName(userName, offset, limit);
		return users;
	}
	@Override
	public long getCount(String userName) {
		List<User> users = sysUserMapper.selectByLikeUserName(userName, null, null);
		return users.size();
	}
	@Override
	public Integer updateDataRole(String userId, String role) {
		List<UserRoleKey> roleKeys = userRoleMapper.selectByUserId(userId);
		if(roleKeys.size() > 0){
			String roleName = roleKeys.get(0).getRoleName();
			if(!roleName.equals("admin")){
				UserRole userRoleKey = new UserRole();
				userRoleKey.setRoleName("admin");
				userRoleKey.setUserId(userId);
				userRoleKey.setRoleId("1");
				return userRoleMapper.insert(userRoleKey);
			}
		}else {
			UserRole userRoleKey = new UserRole();
			userRoleKey.setRoleName("admin");
			userRoleKey.setUserId(userId);
			userRoleKey.setRoleId("1");
			return userRoleMapper.insert(userRoleKey);
		}
		return 0;
	}
	
	@Override
	public boolean updatePassword(String oldPassword, String newPassword) {
		//用户信息
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		SysUser user = sysUserMapper.findByLoginName(userId, "1");
		if(user != null){
			String passsword = user.getPassword();
			if(passsword.equals(oldPassword)){
				//更新密码
				user.setPassword(newPassword);
				int flag = sysUserMapper.updateByPrimaryKey(user);
				if(flag > 0){
					return true;
				}
			}
		}
		return false;
	}
}
