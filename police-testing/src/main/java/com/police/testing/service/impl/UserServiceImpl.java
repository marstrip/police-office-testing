package com.police.testing.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.police.testing.dao.RolePermissionMapper;
import com.police.testing.dao.SysUserMapper;
import com.police.testing.dao.UserRoleMapper;
import com.police.testing.pojo.SysMenu;
import com.police.testing.pojo.SysUser;
import com.police.testing.pojo.User;
import com.police.testing.pojo.UserRole;
import com.police.testing.pojo.UserRoleKey;
import com.police.testing.service.IUserService;
import com.police.testing.tools.SystemTools;

import net.sf.json.JSONObject;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired
	private SysUserMapper sysUserMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private RolePermissionMapper rolePermissionMapper;
	
	public List<SysMenu> getMenu(String userId) {
		return this.sysUserMapper.getMenuByUserId(userId);
	}
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
	
	
	@Override
	public JSONObject uploadUser(MultipartFile file, String fileName) {
		JSONObject result = new JSONObject();
		InputStream input;
		String failMessage = null;
		Integer successCount = 0;
		Integer failCount = 0;
		try {
			input = file.getInputStream();
			XSSFWorkbook workBook = new XSSFWorkbook(input);
			XSSFSheet sheet = workBook.getSheetAt(0);
			//校验Excel表是否正确 ，获取第一行标题数据
			XSSFRow rowTitle = sheet.getRow(0);
			if (rowTitle == null) {
				result.put("status", 1);
				result.put("message", "Excel表表头为空");
				return result;
			}else {
				XSSFCell cell1 = rowTitle.getCell(0);
				String policeNumber = SystemTools.getCellValue(cell1);
				XSSFCell cell2 = rowTitle.getCell(1);
				String userName = SystemTools.getCellValue(cell2);
				XSSFCell cell3 = rowTitle.getCell(2);
				String departmentName = SystemTools.getCellValue(cell3);
				if(!policeNumber.equals("警号") || !userName.equals("姓名") || !departmentName.equals("派出所")){
					result.put("status", 1);
					result.put("message", "Excel表表头不正确，请查证！");
					return result;
				}
			}
			// 用户信息
			if (sheet != null) {
				for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
					XSSFRow row = sheet.getRow(i);
					if (row == null) {
						continue;
					}
					XSSFCell cell1 = row.getCell(0);
					String policeNumber = SystemTools.getCellValue(cell1);
					if(StringUtils.isBlank(policeNumber)){
						if(failMessage == null){
							failMessage = "excel表第" + String.valueOf(i+1) +"警号为空！";
						}else {
							failMessage = failMessage + ";</br>excel表第" + String.valueOf(i+1) +"警号为空！";
						}
						failCount ++;
						continue;
					}
					//判断是否存在
					SysUser user = sysUserMapper.findByLoginName(policeNumber, "1");
					if(user != null){
						if(failMessage == null){
							failMessage = "excel表第" + String.valueOf(i+1) + "警号已存在！";
						}else {
							failMessage = failMessage + ";</br>excel表第" + String.valueOf(i+1) +"警号已存在！";
						}
						failCount ++;
						continue;
					}
					XSSFCell cell2 = row.getCell(1);
					String userName = SystemTools.getCellValue(cell2);
					if(StringUtils.isBlank(userName)){
						if(failMessage == null){
							failMessage = "excel表第" + String.valueOf(i+1) +"姓名为空！";
						}else {
							failMessage = failMessage + ";</br>excel表第" + String.valueOf(i+1) +"姓名为空！";
						}
						failCount ++;
						continue;
					}
					XSSFCell cell3 = row.getCell(2);
					String departmentName = SystemTools.getCellValue(cell3);
					if(StringUtils.isBlank(departmentName)){
						if(failMessage == null){
							failMessage = "excel表第" + String.valueOf(i+1) + "派出所为空！";
						}else {
							failMessage = failMessage + ";</br>excel表第" + String.valueOf(i+1) + "派出所为空！";
						}
						failCount ++;
						continue;
					}
					SysUser sysUser = new SysUser();
					sysUser.setDepartmentName(departmentName);
					sysUser.setUserId(policeNumber);
					sysUser.setUserName(userName);
					sysUser.setUserStatus("1");
					sysUser.setLoginName(policeNumber);
					sysUser.setPassword("111111");
					sysUserMapper.insertSelective(sysUser);
					successCount ++ ;
				}
				result.put("status", 1);
				if(failMessage == null){
					result.put("message", "上传完成");
				}else {
					result.put("message", "上传完成，新增用户：" + successCount.toString() + "个;新增失败：" + failCount.toString() + "个;</br>" + failMessage);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			result.put("status", -1);
			result.put("message", "请联系管理员，错误信息：" + e.getMessage());
		}
		return result;
	}
}
