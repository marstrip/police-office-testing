package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.SysMenu;

public interface ISystemService {
	/**
	  * 获取子节点
	  * @param parentId
	  * @return
	  */
	 public List<SysMenu> getChildByParentId(Integer parentId);

	public boolean ifAdminRole(String loginId);
}
