package com.police.testing.pojo;

public class TestQuestionWithBLOBs extends TestQuestion {
    private String testQuestionsName;

    private String testQuestionSelects;
    
    private Integer number;
    
    public String getTestQuestionsName() {
        return testQuestionsName;
    }

    public void setTestQuestionsName(String testQuestionsName) {
        this.testQuestionsName = testQuestionsName == null ? null : testQuestionsName.trim();
    }

    public String getTestQuestionSelects() {
        return testQuestionSelects;
    }

    public void setTestQuestionSelects(String testQuestionSelects) {
        this.testQuestionSelects = testQuestionSelects == null ? null : testQuestionSelects.trim();
    }

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}
    
}