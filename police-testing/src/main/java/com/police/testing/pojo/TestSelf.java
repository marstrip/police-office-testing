package com.police.testing.pojo;

import java.util.Date;

import com.police.testing.tools.SystemTools;

public class TestSelf {
    private String testSelfId;

    private String testSelfLevel;
    
    private String testSelfName;
    
    private String testSelfType;

    private Date createDate;

    private String creatorId;

    private String creatorName;

    private Date updateDate;

    private String enable;

    private String testSelfContent;

    public String getTestSelfId() {
        return testSelfId;
    }

    public void setTestSelfId(String testSelfId) {
        this.testSelfId = testSelfId == null ? null : testSelfId.trim();
    }

    public String getTestSelfName() {
		return testSelfName;
	}

	public void setTestSelfName(String testSelfName) {
		this.testSelfName = testSelfName;
	}

	public String getTestSelfLevel() {
        return testSelfLevel;
    }

    public void setTestSelfLevel(String testSelfLevel) {
        this.testSelfLevel = testSelfLevel == null ? null : testSelfLevel.trim();
    }

    public String getTestSelfType() {
        return testSelfType;
    }

    public void setTestSelfType(String testSelfType) {
        this.testSelfType = testSelfType == null ? null : testSelfType.trim();
    }

    public String getCreateDate() {
    	String str = SystemTools.Time2String(createDate, "yyyy-MM-dd HH:mm:ss");
        return str;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(String creatorId) {
        this.creatorId = creatorId == null ? null : creatorId.trim();
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName == null ? null : creatorName.trim();
    }

    public String getUpdateDate() {
    	String str = SystemTools.Time2String(updateDate, "yyyy-MM-dd HH:mm:ss");
        return str;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable == null ? null : enable.trim();
    }

    public String getTestSelfContent() {
        return testSelfContent;
    }

    public void setTestSelfContent(String testSelfContent) {
        this.testSelfContent = testSelfContent == null ? null : testSelfContent.trim();
    }
}