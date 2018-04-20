package com.police.testing.service;

import java.util.List;

import com.police.testing.pojo.StaticDataLogin;

/**
*@author created by answer
*@date 2018年4月21日-上午12:42:55
*
**/
public interface IStaticDataService {

	public List<StaticDataLogin> staticDataLogin(String beginDate, String endDate);
}

