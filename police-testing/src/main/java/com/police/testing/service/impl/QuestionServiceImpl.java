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
import com.police.testing.dao.TestQuestionMapper;
import com.police.testing.dao.UploadFileLogMapper;
import com.police.testing.pojo.TestQuestionWithBLOBs;
import com.police.testing.pojo.UploadFileLog;
import com.police.testing.service.IQuestionService;

import net.sf.json.JSONObject;

@Component("questionService")
public class QuestionServiceImpl implements IQuestionService{
	@Autowired
	private TestQuestionMapper testQuestionMapper;
	@Autowired
	private UploadFileLogMapper uploadFileLogMapper;
	
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
	public JSONObject saveQuestionByWord(MultipartFile file, String fileName) {
		JSONObject result = new JSONObject();
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
			// word试卷数据模型化
			List<TestQuestionWithBLOBs> questions = analysisHtmlString(htmlText, fileName);
			//----------------------------------------分析试题分类个数----------------------------------------------
			//选择题个数
			Integer selectCount = 0;
			//判断题个数
			Integer judgeCount = 0;
			//保存失败
			Integer failCount = 0;
			//错误信息
			String failMessage = "";
			//反馈信息
			String message = null;
			for (int i=0; i < questions.size(); i++) {
				TestQuestionWithBLOBs question = questions.get(i);
				String questionType = question.getTestQuestionType();
				if(questionType.equals("1")){
					selectCount ++;
				}else if(questionType.equals("2")){
					judgeCount ++;
				}else {
					failCount ++;
					failMessage = failMessage + question.getTestQuestionsName() + "</br>";
					continue;
				}
			}
			if(failCount == 0){
				message = "上传成功！";
			}else {
				message = "上传完成，错误信息：" + failMessage;
			}
			result.put("selectCount", selectCount);
			result.put("judgeCount", judgeCount);
			result.put("sum", selectCount + judgeCount);
			result.put("message", message);
			//保存上传日志
			Date createDate = new Date();
			//获取用户信息
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			String userId =(String)session.getAttribute("currentUser");
			String userName = (String)session.getAttribute("currentUserName");
			String uploadFileId = UUID.randomUUID().toString().replaceAll("-", "");
			UploadFileLog uploadFileLog = new UploadFileLog();
			uploadFileLog.setUploadFileId(uploadFileId);
			uploadFileLog.setCreateDate(createDate);
			uploadFileLog.setCreatorId(userId);
			uploadFileLog.setCreatorName(userName);
			uploadFileLog.setFileName(fileName);
			uploadFileLog.setRemark(message);
			uploadFileLogMapper.insert(uploadFileLog);
			//保存试题
			for (int i=0; i < questions.size(); i++) {
				TestQuestionWithBLOBs question = questions.get(i);
				question.setUploadFileId(uploadFileId);
				String testQuestionsId = UUID.randomUUID().toString().replaceAll("-", "");
				question.setTestQuestionsId(testQuestionsId);
				question.setCreatorId(userId);
				question.setCreateDate(createDate);
				question.setEnable("1");
				System.out.println("题干：" + question.getTestQuestionsName());
				System.out.println("选项：" + question.getTestQuestionSelects());
				System.out.println("答案：" + question.getCorrectAnswer());
				testQuestionMapper.insert(question);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 分析html成试题，并存入题库
	 * 
	 * @param s
	 */
	private List<TestQuestionWithBLOBs> analysisHtmlString(String htmlText, String testPaperName) {
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
			// 每行前两个字符为数字+顿号则为题干
			Map<String, Object> numberFlag = isDigit2(rowWord);
			// 如果前两个字符为大写字母.则为选项
			boolean selectFlag = answerFlag(firstWord, rowWord.substring(1, 2));
			if ((boolean)numberFlag.get("status")) {//此行为题干
				if (StringUtils.isNotBlank(lastSelects) || questions.size() == 0
						|| (StringUtils.isNotBlank(questionType) && questionType.equals("2"))) {
					TestQuestionWithBLOBs question = new TestQuestionWithBLOBs();
					//word提高编号最后一个索引
					Integer numLastIndex = (Integer) numberFlag.get("numLastIndex");
					//获取去除变好的题干
					String questionName = rowWord.substring(numLastIndex + 1, rowWord.length());
					//判断题干是否存在
					question.setTestQuestionsName(questionName);
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
		return questions;
	}

	// 判断一个字符串是否都为数字
	private Map<String, Object> isDigit2(String strNum) {
		Map<String, Object> result = new HashMap<>();
		result.put("status", false);
		Pattern pattern = Pattern.compile("[0-9]{1,}");
		for(int i=0; i<strNum.length(); i++){
			//截取数字
			String number = strNum.substring(i, i+1);
			Matcher matcher = pattern.matcher((CharSequence) number);
			if(matcher.matches()){
				continue;
			}else if(number.equals("、")){
				result.put("status", true);
				result.put("number", strNum.substring(0, i));
				result.put("numLastIndex", i);
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
		if(!matcher.matches() ||( !secondWord.equals("．") && !secondWord.equals("."))){
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
