package com.police.testing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.SysMenuMapper;
import com.police.testing.pojo.SysMenu;
import com.police.testing.service.ISystemService;

@Component("systemService")
public class SystemServiceImpl implements ISystemService{
	@Autowired
	private SysMenuMapper sysMenuMapper;
	@Override
	public List<SysMenu> getChildByParentId(Integer parentId) {
		List<SysMenu> sysMenus = sysMenuMapper.selectByParentId(parentId);
		return sysMenus;
	}

}
