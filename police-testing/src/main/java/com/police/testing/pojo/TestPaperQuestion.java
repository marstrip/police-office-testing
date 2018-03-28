package com.police.testing.pojo;

public class TestPaperQuestion {
    private Integer autoId;

    private String testPaperId;

    private String testPaperName;

    private String testQuestionsId;

    private Integer testQuestionsNumber;

    private Integer answerCount;

    private Integer correctAnswerCount;

    public Integer getAutoId() {
        return autoId;
    }

    public void setAutoId(Integer autoId) {
        this.autoId = autoId;
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
        this.testPaperName = testPaperName == null ? null : testPaperName.trim();
    }


    public String getTestQuestionsId() {
		return testQuestionsId;
	}

	public void setTestQuestionsId(String testQuestionsId) {
		this.testQuestionsId = testQuestionsId;
	}

	public Integer getTestQuestionsNumber() {
        return testQuestionsNumber;
    }

    public void setTestQuestionsNumber(Integer testQuestionsNumber) {
        this.testQuestionsNumber = testQuestionsNumber;
    }

    public Integer getAnswerCount() {
        return answerCount;
    }

    public void setAnswerCount(Integer answerCount) {
        this.answerCount = answerCount;
    }

    public Integer getCorrectAnswerCount() {
        return correctAnswerCount;
    }

    public void setCorrectAnswerCount(Integer correctAnswerCount) {
        this.correctAnswerCount = correctAnswerCount;
    }
}