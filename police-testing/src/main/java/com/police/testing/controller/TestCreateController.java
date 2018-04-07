package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.police.testing.pojo.UploadFileLog;
import com.police.testing.service.IUploadLogService;

@Controller
@RequestMapping("/testCreate/")
public class TestCreateController {
	@Autowired
	private IUploadLogService uploadLogService;
	
	/**
	 * 跳转组题页面
	 * @param request
	 * @return
	 */
	@RequestMapping("jsp")
	public String jsp(HttpServletRequest request){
		List<UploadFileLog> list = uploadLogService.getList(null, null);
		request.setAttribute("list", list);
		return "background_system/test_creation/create";
	}
}
