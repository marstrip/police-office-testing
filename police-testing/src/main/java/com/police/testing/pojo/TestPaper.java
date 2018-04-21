package com.police.testing.pojo;

import java.util.Date;

import com.police.testing.tools.SystemTools;

public class TestPaper {
    private String testPaperId;

    private String testPaperName;

    private String testPaperType;
    
    private Date testDate;
    
    private Integer testTime;
    
    private String creatorId;

    private String creatorName;

    private Date createDate;

    private Date updateDate;

    private String enable;

    public String getTestPaperId() {
        return testPaperId;
    }

    public void setTestPaperId(String testPaperId) {
        this.testPaperId = testPaperId == null ? null : testPaperId.trim();
    }

    public String getTestPaperName() {
        return testPaperName;
    }

    public void setTestPaperName(String testPaperName) {
        this.testPaperName = testPaperName == null ? null : testPaperName.trim();
    }

    public String getTestPaperType() {
		return testPaperType;
	}

	public void setTestPaperType(String testPaperType) {
		this.testPaperType = testPaperType;
	}
	public Date getTestDate() {
		return testDate;
	}

	public void setTestDate(Date testDate) {
		this.testDate = testDate;
	}

	public Integer getTestTime() {
		return testTime;
	}

	public void setTestTime(Integer testTime) {
		this.testTime = testTime;
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

    public String getCreateDate() {
    	String str = SystemTools.Time2String(createDate, "yyyy-MM-dd HH:mm:ss");
        return str;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
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
}