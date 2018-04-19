package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.police.testing.pojo.UploadFileLog;
import com.police.testing.service.IUploadLogService;
import com.police.testing.tools.GetEncode;

import net.sf.json.JSONArray;
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
		StringBuffer url = request.getRequestURL();
		String method = request.getMethod();
		System.out.println("url: " + url.toString());
		System.out.println("method:" + method);
		//第几条记录开始
		Integer offset = Integer.valueOf(GetEncode.transcode(request.getParameter("offset")));
		Integer limit = Integer.valueOf(GetEncode.transcode(request.getParameter("limit")));
		String fileName = GetEncode.transcode(request.getParameter("search"));
		String beginDate = GetEncode.transcode(request.getParameter("beginDate"));
		String endDate = GetEncode.transcode(request.getParameter("endDate"));
		List<UploadFileLog> list = uploadLogService.getList(beginDate, endDate, fileName, offset, limit);
		long total = uploadLogService.getCount(beginDate, endDate, fileName);
		JSONObject result = new JSONObject();
		JSONArray array = JSONArray.fromObject(list);
		Integer pageNumber = offset/limit + 1;
		result.put("page", pageNumber);
		result.put("total", total);
		result.put("rows", array);
		return result;
	}
}

