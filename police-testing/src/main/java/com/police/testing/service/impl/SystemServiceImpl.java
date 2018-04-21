package com.police.testing.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.SysMenuMapper;
import com.police.testing.dao.UserRoleMapper;
import com.police.testing.pojo.SysMenu;
import com.police.testing.pojo.UserRole;
import com.police.testing.pojo.UserRoleKey;
import com.police.testing.service.ISystemService;

@Component("systemService")
public class SystemServiceImpl implements ISystemService{
	@Autowired
	private SysMenuMapper sysMenuMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Override
	public List<SysMenu> getChildByParentId(Integer parentId) {
		List<SysMenu> sysMenus = sysMenuMapper.selectByParentId(parentId);
		return sysMenus;
	}
	@Override
	public boolean ifAdminRole(String userId) {
		List<UserRoleKey> roles = userRoleMapper.selectByUserId(userId);
		if(roles.size() > 0){
			String roleName = roles.get(0).getRoleName();
			if(StringUtils.isNotBlank(roleName) && roleName.equals("admin")){
				return true;
			}
		}
		return false;
	}

}
