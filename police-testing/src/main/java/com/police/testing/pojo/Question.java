package com.police.testing.pojo;

public class Question {
	private Integer questionNumber;//题号
	private String question;//题干
	private String selects = "";//所有选项集合
	private String answerSelect;//正确答案选项
	public Integer getQuestionNumber() {
		return questionNumber;
	}
	public void setQuestionNumber(Integer questionNumber) {
		this.questionNumber = questionNumber;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getSelects() {
		return selects;
	}
	public void setSelects(String selects) {
		this.selects = selects;
	}
	public String getAnswerSelect() {
		return answerSelect;
	}
	public void setAnswerSelect(String answerSelect) {
		this.answerSelect = answerSelect;
	}
	
	
}
