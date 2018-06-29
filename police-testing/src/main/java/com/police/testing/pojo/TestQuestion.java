package com.police.testing.pojo;

import java.util.Date;

import com.police.testing.tools.SystemTools;

public class TestQuestion {
    private String testQuestionsId;

    private String correctAnswer;

    private String testQuestionType;

    private String uploadFileId;
    
    private String creatorId;

    private String creatorName;

    private Date createDate;

    private Date updateDate;

    private String enable;

    private Integer number;
    
    private Integer answerCount;
    
    private Integer failCount;
    
    public String getTestQuestionsId() {
		return testQuestionsId;
	}

	public void setTestQuestionsId(String testQuestionsId) {
		this.testQuestionsId = testQuestionsId;
	}

	public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer == null ? null : correctAnswer.trim();
    }

    public String getTestQuestionType() {
        return testQuestionType;
    }

    public void setTestQuestionType(String testQuestionType) {
        this.testQuestionType = testQuestionType == null ? null : testQuestionType.trim();
    }
    
	public String getUploadFileId() {
		return uploadFileId;
	}

	public void setUploadFileId(String uploadFileId) {
		this.uploadFileId = uploadFileId;
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

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getAnswerCount() {
		return answerCount;
	}

	public void setAnswerCount(Integer answerCount) {
		this.answerCount = answerCount;
	}

	public Integer getFailCount() {
		return failCount;
	}

	public void setFailCount(Integer failCount) {
		this.failCount = failCount;
	}
}