package com.police.testing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.police.testing.pojo.TestingLog;
import com.police.testing.service.ISorceService;
import com.police.testing.tools.GetEncode;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
*@author created by answer
*@date 2018年5月5日-下午6:28:38
*
**/
@Controller
@RequestMapping("/score/")
public class ScoreController {
	@Autowired
	private ISorceService sorceService;
	/**
	 * 根据每个人查询成绩
	 * @param request
	 * @return
	 */
	@RequestMapping("searchScore")
	@ResponseBody
	public JSONObject searchScore(HttpServletRequest request){
		JSONObject result = new JSONObject();
		//第几条记录开始
		Integer offset = Integer.valueOf(GetEncode.transcode(request.getParameter("offset")));
		Integer limit = Integer.valueOf(GetEncode.transcode(request.getParameter("limit")));
		List<TestingLog> testingLogs = sorceService.getSorcesByUserId(offset, limit);
		long total = sorceService.getCount();
		JSONArray array = JSONArray.fromObject(testingLogs);
		result.put("status", 1);
		result.put("total", total);
		result.put("rows", array);
		return result;
	}
}

