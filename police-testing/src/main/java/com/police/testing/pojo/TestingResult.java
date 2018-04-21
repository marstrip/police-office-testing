package com.police.testing.pojo;
/**
*@author created by answer
*@date 2018年4月21日-下午11:35:35
*
**/
public class TestingResult {
	
	private String testQuestionsId;
	
	private String rightAnswer;
	
	private Integer correctFlag;

	public String getTestQuestionsId() {
		return testQuestionsId;
	}

	public void setTestQuestionsId(String testQuestionsId) {
		this.testQuestionsId = testQuestionsId;
	}

	public String getRightAnswer() {
		return rightAnswer;
	}

	public void setRightAnswer(String rightAnswer) {
		this.rightAnswer = rightAnswer;
	}

	public Integer getCorrectFlag() {
		return correctFlag;
	}

	public void setCorrectFlag(Integer correctFlag) {
		this.correctFlag = correctFlag;
	}
	
}

