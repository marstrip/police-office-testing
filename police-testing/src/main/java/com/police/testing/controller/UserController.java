package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.police.testing.pojo.User;
import com.police.testing.service.IUserService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
*@author created by answer
*@date 2018年4月22日-上午1:45:55
*
**/
@Controller
@RequestMapping("/user/")
public class UserController {
	@Autowired
	private IUserService userService;
	
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		return "background_system/user/user_list";
	}
	/**
	 * 提交案例分析
	 * @param request
	 * @return
	 *//*
	@RequestMapping("saveData")
	@ResponseBody
	public JSONObject saveData(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String inFormName = GetEncode.transcode(request.getParameter("informName"));
		String inFormContent = GetEncode.transcode(request.getParameter("informContent"));
		Integer flag = informNoticeService.saveData(inFormName, inFormContent);
		if(flag == 1){
			result.put("status", flag);
			result.put("message", "保存成功");
		}else {
			result.put("status", flag);
			result.put("message", "保存失败");
		}
		return result;
	}*/
	/**
	 * 修改密码
	 * @param request
	 * @return
	 */
	@RequestMapping("updatePassword")
	public JSONObject updatePassword(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String oldPassword = GetEncode.transcode(request.getParameter("oldPassword"));
		String newPassword = GetEncode.transcode(request.getParameter("newPassword"));
		if(StringUtils.isBlank(newPassword) || StringUtils.isBlank(oldPassword)){
			result.put("status", 2);
			result.put("message", "新密码或原密码不能为空");
			return result;
		}
		if(newPassword.equals(oldPassword)){
			result.put("status", 3);
			result.put("message", "新密码不能与原密码相同");
			return result;
		}
		boolean flag = userService.updatePassword(oldPassword, newPassword);
		if(flag){
			result.put("status", 1);
			result.put("message", "更新成功，请重新登录！");
		}else {
			result.put("status", -1);
			result.put("message", "原密码错误，请重新输入！");
		}
		return result;
	}
	/**
	 * 设置管理员
	 * @param request
	 * @return
	 */
	@RequestMapping("setRole")
	@ResponseBody
	public JSONObject setRole(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String userId = GetEncode.transcode(request.getParameter("userId"));
		String role = GetEncode.transcode(request.getParameter("role"));
		Integer flag = userService.updateDataRole(userId, role);
		if(flag == 1){
			result.put("status", flag);
			result.put("message", "成功");
		}else {
			result.put("status", flag);
			result.put("message", "当前是管理员");
		}
		return result;
	}
	
	/**
	 * 删除
	 * @param request
	 * @return
	 */
	@RequestMapping("deleteData")
	@ResponseBody
	public JSONObject deleteData(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String userId = GetEncode.transcode(request.getParameter("userId"));
		String userStatus = GetEncode.transcode(request.getParameter("userStatus"));
		if(userStatus.equals("1")){
			userStatus = "0";
		}else if(userStatus.equals("0")){
			userStatus = "1";
		}
		Integer flag = userService.deleteData(userId, userStatus);
		if(flag == 1){
			result.put("status", flag);
			result.put("message", "删除成功");
		}else {
			result.put("status", flag);
			result.put("message", "删除失败");
		}
		return result;
	}
	
	/**
	 * 获取数据列表
	 * @param request
	 * @return
	 */
	@RequestMapping("getList")
	@ResponseBody
	public JSONObject getList(HttpServletRequest request){
		JSONObject result = new JSONObject();
		//第几条记录开始
		Integer offset = Integer.valueOf(GetEncode.transcode(request.getParameter("offset")));
		Integer limit = Integer.valueOf(GetEncode.transcode(request.getParameter("limit")));
		String userName = GetEncode.transcode(request.getParameter("search"));
		List<User> list = userService.getList(userName, offset, limit);
		long total = userService.getCount(userName);
		JSONArray array = JSONArray.fromObject(list);
		Integer pageNumber = offset/limit + 1;
		result.put("page", pageNumber);
		result.put("total", total);
		result.put("rows", array);
		return result;
	}
	/**
	 * 预览单个数据
	 * @param request
	 * @return
	 *//*
	@RequestMapping("view")
	@ResponseBody
	public JSONObject view(HttpServletRequest request){
		JSONObject result = new JSONObject();
		String userId = GetEncode.transcode(request.getParameter("informId"));
		User user = userService.getContentById(informId);
		result.put("status", 1);
		result.put("message", "成功");
		result.put("info", informNotice);
		return result;
	}*/
}

