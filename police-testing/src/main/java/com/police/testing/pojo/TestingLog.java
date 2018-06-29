package com.police.testing.pojo;

import java.util.Date;

import com.police.testing.tools.SystemTools;

public class TestingLog {
    private Integer autoId;

    private String userId;

    private String userName;

    private String departmentName;

    private String departmentId;

    private String testingType;

    private String testPaperId;
    
    private String testPaperName;

    private Date createDate;

    private Integer score;

    private String ip;
    
    public Integer getAutoId() {
        return autoId;
    }

    public void setAutoId(Integer autoId) {
        this.autoId = autoId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName == null ? null : departmentName.trim();
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId == null ? null : departmentId.trim();
    }

    public String getTestingType() {
        return testingType;
    }

    public void setTestingType(String testingType) {
        this.testingType = testingType == null ? null : testingType.trim();
    }

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
		this.testPaperName = testPaperName;
	}

	public String getCreateDate() {
    	String str = SystemTools.Time2String(createDate, "yyyy-MM-dd HH:mm:ss");
        return str;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
}