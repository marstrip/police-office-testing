package com.police.testing.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.SysMenu;
import com.police.testing.pojo.Tree;
import com.police.testing.service.ISystemService;
import com.police.testing.service.IUserService;

@Controller
@RequestMapping("/")
public class IndexController {
	@Autowired
	private IUserService userService;
	@Autowired
	private ISystemService systemService;
	
	@RequestMapping("index")
	public String indexJsp(){
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value="getMenu", method = RequestMethod.POST)
	public List<Tree> getMeun(HttpServletRequest request){
		String path = request.getContextPath();
	 	String homePath = request.getScheme() + "://"
	 				+ request.getServerName() ;
	 	String basePath = homePath + path ;
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId =(String)session.getAttribute("currentUserId");
    	List<SysMenu> menuList = userService.getMenu(userId);
    	List<Tree> treeList = new ArrayList<Tree>();
    	for (SysMenu menu : menuList) {
			Tree node = new Tree();
			node.setId(menu.getId());
			node.setPid(menu.getParentid());
			node.setText(menu.getName());
			if(menu.getParentid()!=0){	// 有父节点
				node.setPid(menu.getParentid());
			}
			if(menu.getCountChildrens() > 0){	//有子节点
				node.setHref("#");
				List<Tree> childrens = new ArrayList<Tree>();
				List<SysMenu> sysMenus = systemService.getChildByParentId(menu.getId());
				for (SysMenu sysMenu : sysMenus) {
					Tree children = new Tree();
					children.setId(sysMenu.getId());
					children.setPid(sysMenu.getParentid());
					children.setText(sysMenu.getName());
					children.setHref(basePath + sysMenu.getUrl());
					childrens.add(children);
				}
				node.setChildren(childrens);
			}else {
				node.setHref(basePath + menu.getUrl());
			}
//			Map<String, Object> attr = new HashMap<String, Object>();
//			attr.put("url", menu.getUrl());
//			node.setAttributes(attr);
			treeList.add(node);
        }
    	return treeList;
	}
}
