package com.police.testing.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.CharacterRun;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.police.testing.dao.TestPaperMapper;
import com.police.testing.dao.TestPaperQuestionMapper;
import com.police.testing.dao.TestQuestionMapper;
import com.police.testing.pojo.TestPaper;
import com.police.testing.pojo.TestPaperQuestion;
import com.police.testing.pojo.TestQuestionWithBLOBs;
import com.police.testing.service.ITestPaperService;

import net.sf.json.JSONObject;

@Component("testPaperService")
public class TestPaperServiceImpl implements ITestPaperService {
	@Autowired
	private TestPaperMapper testPaperMapper;
	@Autowired
	private TestQuestionMapper testQuestionMapper;
	@Autowired
	private TestPaperQuestionMapper testPaperQuestionMapper;

	/**
	 * 回车符ASCII码
	 */
	private static final short ENTER_ASCII = 13;

	/**
	 * 空格符ASCII码
	 */
	private static final short SPACE_ASCII = 32;

	/**
	 * 水平制表符ASCII码
	 */
	private static final short TABULATION_ASCII = 9;

	@Override
	public JSONObject saveFileData(MultipartFile file, String fileName) {
		try {
			InputStream in = file.getInputStream();
			HWPFDocument doc = new HWPFDocument(in);
			// 取得文档中字符的总数
			int length = doc.characterLength();
			String htmlText = "<html><head><title>" + doc.getSummaryInformation().getTitle() + "</title></head><body>";
			String tempString = "";
			for (int i = 0; i < length - 1; i++) {
				// 整篇文章的字符通过一个个字符的来判断,range为得到文档的范围
				Range range = new Range(i, i + 1, doc);
				CharacterRun cr = range.getCharacterRun(0);

				Range range2 = new Range(i + 1, i + 2, doc);
				// 第二个字符
				CharacterRun cr2 = range2.getCharacterRun(0);
				char c = cr.text().charAt(0);
				if (c == 160) {
					continue;
				}
				// 判断是否为空格符
				if (c == SPACE_ASCII){
					tempString += "&nbsp;";
				}else if (c == TABULATION_ASCII){// 判断是否为水平制表符
					tempString += "&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				
				// 比较前后2个字符是否具有相同的格式
				boolean flag = compareCharStyle(cr, cr2);
				if (flag && c != ENTER_ASCII && c != 11) {
					tempString += cr.text();
				} else {
					String fontStyle = "<span style='font-family:" + cr.getFontName() + ";font-size:"
							+ cr.getFontSize() / 2 + "pt;color:" + getHexColor(cr.getIco24()) + ";";

					if (cr.isBold()) {
						fontStyle += "font-weight:bold;";
					}
					if (cr.isItalic()) {
						fontStyle += "font-style:italic;";
					}
					if (c == 11) {
						htmlText += fontStyle + "'>" + tempString;
						htmlText += "</span>";
						tempString = "";
					} else {
						htmlText += fontStyle + "'>" + tempString + cr.text();
						htmlText += "</span>";
						tempString = "";
					}
				}
				// 判断是否为回车符
				if (c == ENTER_ASCII) {
					htmlText += "<br/>";
				}
				if (c == 11) {
					htmlText += "<br/>";
				}
			}
			htmlText += tempString + "</body></html>";
			//获取用户信息
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			String userId =(String)session.getAttribute("currentUser");
			//保存试卷信息
			TestPaper testPaper = new TestPaper();
			String testPaperId = UUID.randomUUID().toString();
			testPaper.setTestPaperId(testPaperId);
			testPaper.setTestPaperName(fileName);
			testPaper.setCreateDate(new Date());
			testPaper.setCreatorId(userId);
			testPaper.setEnable("1");
			testPaperMapper.insert(testPaper);
			// word试卷数据模型化
			analysisHtmlString(htmlText,testPaperId,fileName,userId);
			System.out.println("------------WordToHtml模型化成功----------------");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 分析html成试题，并存入题库
	 * 
	 * @param s
	 */
	private void analysisHtmlString(String htmlText, String testPaperId, String testPaperName, String creatorId) {
		String q[] = htmlText.split("<br/>");
		LinkedList<String> list = new LinkedList<String>();
		// 清除空字符
		for (int i = 0; i < q.length; i++) {
			if (StringUtils.isNotBlank(q[i].toString().replaceAll("</?[^>]+>", "").trim())) {
				list.add(q[i].toString().trim());
			}
		}
		String[] result = {};
		String ws[] = list.toArray(result);
		List<TestQuestionWithBLOBs> questions = new ArrayList<>();
		/*********** 试卷基础数据赋值 *********************/
		for (int i = 0; i < ws.length; i++) {
			String rowWord = ws[i].toString().replaceAll("</?[^>]+>", "").trim();// 去除html
			String lastSelects = null;
			String questionType = null;
			TestQuestionWithBLOBs lastQuestion = null;
			if (questions.size() > 0) {
				lastQuestion = questions.get(questions.size() - 1);
				lastSelects = lastQuestion.getTestQuestionSelects();
				questionType = lastQuestion.getTestQuestionType();
			}
			String firstWord = rowWord.substring(0, 1);
			// 每行前两个字符为数据+顿号则为题干
			Map<String, Object> numberFlag = isDigit2(rowWord);
			// 如果前两个字符为大写字母与.则为选项
			boolean selectFlag = answerFlag(firstWord, rowWord.substring(1, 2));
			if ((boolean)numberFlag.get("status")) {
				if (StringUtils.isNotBlank(lastSelects) || questions.size() == 0
						|| (StringUtils.isNotBlank(questionType) && questionType.equals("2"))) {
					TestQuestionWithBLOBs question = new TestQuestionWithBLOBs();
					question.setTestQuestionsName(rowWord);
					question.setNumber(Integer.valueOf(numberFlag.get("number").toString()));
					questions.add(question);
				}
			}else if (selectFlag) {
				if (questions.size() > 0) {
					TestQuestionWithBLOBs question = questions.get(questions.size() - 1);
					if (rowWord.length() > 1) {
						String select = question.getTestQuestionSelects();
						if (StringUtils.isNotBlank(select)) {
							select += ";";
						}else {
							select = "";
						}
						select += rowWord;
						question.setTestQuestionSelects(select);
						question.setTestQuestionType("1");
					}
				}
			}else if (rowWord.contains("【正确答案:】")) {// 判断某一行是否为正确答案
					String answer = null;
					if (rowWord.length() > rowWord.indexOf("】")) {
						answer = rowWord.substring(rowWord.indexOf("】") + 1, rowWord.length());
						if (questions.size() > 0) {
							TestQuestionWithBLOBs question = questions.get(questions.size() - 1);
							if (StringUtils.isBlank(question.getTestQuestionSelects())) {
								question.setTestQuestionType("2");
							}
							question.setCorrectAnswer(answer);
						}
					}
			}else if(rowWord.equals("&nbsp;")){//如果为空格符则下一行
				continue;
			}else {
				//当题干为多行时，用于拼接题干使用
				if (lastQuestion != null && StringUtils.isBlank(lastSelects) 
						&& StringUtils.isNotBlank(lastQuestion.getTestQuestionsName()) 
						&& StringUtils.isBlank(lastQuestion.getCorrectAnswer())) {
					String question = lastQuestion.getTestQuestionsName() + rowWord;
					lastQuestion.setTestQuestionsName(question);
				}
			}
		}
		Date createDate = new Date();
		for (int i=0; i < questions.size(); i++) {
			TestQuestionWithBLOBs question = questions.get(i);
			String testQuestionsId = UUID.randomUUID().toString().replaceAll("-", "");
			question.setTestQuestionsId(testQuestionsId);
			question.setCreatorId(creatorId);
			question.setCreateDate(createDate);
			question.setEnable("1");
			System.out.println("question:" + question.getTestQuestionsName());
			testQuestionMapper.insert(question);
			TestPaperQuestion testPaperQuestion = new TestPaperQuestion();
			testPaperQuestion.setAnswerCount(0);
			testPaperQuestion.setCorrectAnswerCount(0);
			testPaperQuestion.setTestPaperId(testPaperId);
			testPaperQuestion.setTestPaperName(testPaperName);
			testPaperQuestion.setTestQuestionsId(testQuestionsId);
			testPaperQuestion.setTestQuestionsNumber(i+1);
			testPaperQuestionMapper.insert(testPaperQuestion);
		}
	}

	// 判断一个字符串是否都为数字
	private Map<String, Object> isDigit2(String strNum) {
		Map<String, Object> result = new HashMap<>();
		result.put("status", false);
		Pattern pattern = Pattern.compile("[0-9]{1,}");
		for(int i=0;i<strNum.length();i++){
			String number = strNum.substring(i, i+1);
			Matcher matcher = pattern.matcher((CharSequence) number);
			if(matcher.matches()){
				continue;
			}else if(number.equals("、")){
				result.put("status", true);
				result.put("number", strNum.substring(0, i));
				return result;
			}else {
				 return result;
			}
		}
		
		return result;
	}

	private boolean answerFlag(String word, String secondWord) {
		Pattern pattern = Pattern.compile("[A-Z]");
		Matcher matcher = pattern.matcher(word);
		if(!matcher.matches() || !secondWord.equals("．")){
			return false;
		}
		return true;
	}

	private boolean compareCharStyle(CharacterRun cr1, CharacterRun cr2) {
		boolean flag = false;
		if (cr1.isBold() == cr2.isBold() && cr1.isItalic() == cr2.isItalic()
				&& cr1.getFontName().equals(cr2.getFontName()) && cr1.getFontSize() == cr2.getFontSize()
				&& cr1.getColor() == cr2.getColor()) {
			flag = true;
		}
		return flag;
	}

	private String getHexColor(int color) {
		color = color == -1 ? 0 : color;
		int rgb = rgb(color);
		return "#" + rgbToSix(Integer.toHexString(rgb));
	}

	public int rgb(int c) {
		return (red(c) << 16) | (green(c) << 8) | blue(c);
	}

	private String rgbToSix(String rgb) {
		int length = 6 - rgb.length();
		String str = "";
		while (length > 0) {
			str += "0";
			length--;
		}
		return str + rgb;
	}

	/*** 字体颜色模块start ********/
	private int red(int c) {
		return c & 0XFF;
	}

	private int green(int c) {
		return (c >> 8) & 0XFF;
	}

	private int blue(int c) {
		return (c >> 16) & 0XFF;
	}

}
