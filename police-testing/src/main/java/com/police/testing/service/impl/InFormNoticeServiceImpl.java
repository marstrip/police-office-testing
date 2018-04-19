package com.police.testing.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.police.testing.dao.InformNoticeMapper;
import com.police.testing.pojo.InformNotice;
import com.police.testing.service.IIFormNoticeService;

/**
*@author created by answer
*@date 2018年4月19日-上午9:36:39
*
**/
@Component("informNoticeService")
public class InFormNoticeServiceImpl implements IIFormNoticeService{
	@Autowired
	private InformNoticeMapper informNoticeMapper;
	@Override
	public Integer saveData(String informName, String informContent) {
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String userId = (String) session.getAttribute("currentUserId");
		String userName = (String) session.getAttribute("currentUserName");
		String informId = "IN" + UUID.randomUUID().toString().replace("-", "");
		InformNotice informNotice = new InformNotice();
		informNotice.setInformId(informId);
		informNotice.setInformName(informName);
		informNotice.setInformContent(informContent);
		Date d = new Date();
		informNotice.setCreateDate(d);
		informNotice.setUpdateDate(d);
		informNotice.setCreatorId(userId);
		informNotice.setCreatorName(userName);
		informNotice.setEnable("1");
		return informNoticeMapper.insert(informNotice);
	}

	@Override
	public Integer updateData(String informId, String informName, String informContent) {
		InformNotice informNotice = informNoticeMapper.selectByPrimaryKey(informId);
		informNotice.setInformName(informName);
		informNotice.setInformContent(informContent);
		informNotice.setUpdateDate(new Date());
		return informNoticeMapper.updateByPrimaryKeyWithBLOBs(informNotice);
	}

	@Override
	public Integer deleteData(String informId) {
		return informNoticeMapper.updateEnable(informId);
	}

	@Override
	public List<InformNotice> getList(String informName, Integer offset, Integer limit) {
		return informNoticeMapper.selectByLikeInformName(informName, offset, limit);
	}

	@Override
	public InformNotice getContentById(String informId) {
		InformNotice informNotice = informNoticeMapper.selectByPrimaryKey(informId);
		return informNotice;
	}

	@Override
	public long getCount(String informName) {
		List<InformNotice> informNotices = informNoticeMapper.selectByLikeInformName(informName, null, null);
		return informNotices.size();
	}
}

