package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.UploadFileLog;
import com.police.testing.service.IUploadLogService;

import net.sf.json.JSONObject;

/**
*@author created by answer
*@date 2018年4月19日-下午4:05:08
*
**/
@Controller
@RequestMapping("/uploadLog/")
public class UploadLogController {
	@Autowired
	private IUploadLogService uploadLogService;
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("getList")
	@ResponseBody
	public JSONObject getList(HttpServletRequest request){
		List<UploadFileLog> list = uploadLogService.getList(null, null);
		JSONObject result = new JSONObject();
		return result;
	}
}

