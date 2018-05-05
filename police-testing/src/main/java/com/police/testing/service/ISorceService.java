package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.TestingLog;

/**
*@author created by answer
*@date 2018年5月5日-下午10:27:48
*
**/
public interface ISorceService {
	
	public List<TestingLog> getSorcesByUserId(Integer offset, Integer limit);
	
	public long getCount();
}

