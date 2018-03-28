package com.police.testing.pojo;

import java.util.Date;

public class TestQuestion {
    private String testQuestionsId;

    private String correctAnswer;

    private String testQuestionType;

    private String creatorId;

    private String creatorName;

    private Date createDate;

    private Date updateDate;

    private String enable;

    private Integer number;
    
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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
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
}