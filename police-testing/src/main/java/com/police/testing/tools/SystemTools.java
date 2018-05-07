package com.police.testing.tools;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

public class SystemTools {
	/**
	 * 判断time1是否比time2小，difftimes小的差数含等于，
	 * @param time1 第一个参数 yyyy-dd-MM hh:mm:ss
	 * @param time2 第二个参数 yyyy-dd-MM hh:mm:ss
	 * @param diffTimes 相差范围，可以为空
	 * @param timeUnit diffTimes的时间单位，d,h,m,s分别代表，天，小时，分钟，秒
	 * @return
	 */
	public static boolean compareTime(String time1, String time2, long diffTimes, String timeUnit){
		if(StringUtils.isNotBlank(time1) && StringUtils.isNotBlank(time2)){
			Date date1 = String2Date(time1, "yyyy-MM-dd hh:mm:ss");
			Date date2 = String2Date(time2, "yyyy-MM-dd hh:mm:ss");
			long l1 = date1.getTime();
			long l2 = date2.getTime();
			if(timeUnit.equals("h")){
				diffTimes = diffTimes * 1000 * 60 * 60;
			}else if(timeUnit.equals("m")){
				diffTimes = diffTimes * 1000 * 60;
			}else if(timeUnit.equals("s")){
				diffTimes = diffTimes * 1000;
			}else if(timeUnit.equals("d")){
				diffTimes = diffTimes * 1000 * 60 * 60 * 24;
			}
			long dl = l2 -l1;
			if(l2 > l1 && dl <= diffTimes){
				return true;
			}
		}
		return false;
	}
	/**
	 * 将字符串格式化成指定格式的时间
	 * @param str
	 * @param format
	 * @return
	 */
	public static Date String2Date(String str,String format){
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date date = null;
		try {
			date = sdf.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("日期解析错误");
		}
		return date;
	}
	/**
	 * 将字符串格式化成日期0000-00-00
	 * @param
	 * @return
	 */
	public static Date formatDate(String dateStr){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * 将字符串格式化时间
	 * @param timeStr
	 * @return
	 */
	public static Date formatTime(String timeStr){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = null;
		try {
			date = sdf.parse(timeStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * 格式化金额
	 * @param money
	 * @return
	 */
	public static BigDecimal formatMoney(String money){
		money = money.substring(1,money.length());
		money = money.replaceFirst(",", "");
		BigDecimal bigDecimal = new BigDecimal(money);
		return bigDecimal;
	}
	
	public static Date formatDateTime(String dateTime){
		String t[] = dateTime.split(" ");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			String apm = t[1].substring(0, 2);
			String time[] = t[1].substring(2, t[1].length()).split(":");
			String hh = time[0];
			String mm = time[1]; 
			if(apm.equals("下午")){
				if(hh.equals("1")){
					hh = "13";
				}else {
					hh = String.valueOf(13+Integer.parseInt(time[0]) - 1);
				}
			}
			dateTime = t[0]+" "+ hh +":"+ mm + ":" + "00";
			return sdf.parse(dateTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 将Date类型日期转换成String类型日期，格式为yyyy-MM-dd
	 * @param date
	 * @return
	 */
	public static String Date2String(Date date){
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		int day = c.get(Calendar.DAY_OF_MONTH);
//		System.out.println("格式化之后时间：" + year+ "-"+month+"-"+day);
		return year+ "-"+month+"-"+day;
	}
	/**
	 * 将Date类型日期转换成String类型日期，格式为yyyy-MM-dd HH:mm:ss
	 * @param date
	 * @return
	 */
	public static String Time2String(Date date){
		String dateStr = null;
		//format的格式可以任意
		DateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			dateStr = sdf2.format(date);
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("日期解析错误");
		}
		return dateStr;
	}
	
	/**
	 * 将Date类型日期转换成String类型日期
	 * @param date
	 * @return
	 */
	public static String Time2String(Date date, String format){
		String dateStr = "";
		//format的格式可以任意
		DateFormat sdf2 = new SimpleDateFormat(format);
		try {
			dateStr = sdf2.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dateStr;
	}
	
	/**
	 * 
	 * @param date
	 * @return
	 */
	public static String DatePlusTen(Date date){
//		Date end = SystemTools.formatDate(date);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DATE, 10);
		date = c.getTime();
		String end = Date2String(date);
		return end;
	}
	/**
	 * 格式化着陆页来源
	 * @param resource
	 * @return
	 */
	public static String resourceFormat(String resource){
		Map<String, String> re = new HashMap<String, String>();
		String[] r = resource.split("\\?");
		if(r.length > 1){
			String[] n = r[1].split("&");
			if(n.length > 1){
				for(int i =0; i<n.length; i++){
					String[] b = n[i].split("=");
					try {
						re.put(b[0], b[1]);
					} catch (ArrayIndexOutOfBoundsException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				JSONObject jsonObject = JSONObject.fromObject(re);
				System.out.println(jsonObject.toString());
				return jsonObject.toString();
			} 
		} 
		System.out.println("no resource");
		return "no resource";
	}
	/**
	 * 判断字符串是否为json格式
	 * @param json
	 * @return
	 */
	public static boolean isGoodJson(String json) {
		try {
			new JSONObject();
			JSONObject.fromObject(json);
		} catch (JSONException e) {
			return false;
		}
		return true;
	}
	/**
	 * 手机号验证
	 * 
	 * @param  str
	 * @return 验证通过返回true
	 */
	public static boolean isMobile(String str) {
		boolean b = false; 
		if(str != null){
			Pattern p = null;
			Matcher m = null;
			p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$"); // 验证手机号
			m = p.matcher(str);
			b = m.matches(); 
		}
		return b;
	}
	/**
	 * 电话号码验证
	 * 
	 * @param  str
	 * @return 验证通过返回true
	 */
	public static boolean isPhone(String str) { 
		Pattern p1 = null,p2 = null;
		Matcher m = null;
		boolean b = false;  
		p1 = Pattern.compile("^[0][1-9]{2,3}-[0-9]{5,10}$");  // 验证带区号的
		p2 = Pattern.compile("^[1-9]{1}[0-9]{5,8}$");         // 验证没有区号的
		if(str.length() >9)
		{	m = p1.matcher(str);
 		    b = m.matches();  
		}else{
			m = p2.matcher(str);
 			b = m.matches(); 
		}  
		return b;
	}
	
	public static String secondToString(Date date){
		Long time = System.currentTimeMillis();
//		System.out.println("系统时间（毫秒）：" + time.toString());
//		String dstr = Time2String(date);
//		String y = dstr.substring(0, 4);
//		String m = dstr.substring(5,7);
//		String d = dstr.substring(8, 10);
//		String hh = dstr.substring(11,13);
//		String mm = dstr.substring(14,16);
//		String ss = dstr.substring(17,19);
//		dstr = y+m+d+hh+mm+ss;
		return time.toString();
	}
	
	/**
	 * 将明文电话转成密文
	 * @param plaintextTel
	 * @return
	 */
	public static String cipherTelephone(String plaintextTel){
		Subject subject = SecurityUtils.getSubject();
		if(!subject.isPermitted("sys:viewTel")){
			boolean flag = isMobile(plaintextTel);
			if(flag){
				plaintextTel = plaintextTel.substring(0,plaintextTel.length()-(plaintextTel.substring(3)).length())
						+"****"+plaintextTel.substring(7);
			}
		}
		return plaintextTel;
	}
	/**
	 * double转百分数
	 * @param value
	 * @return
	 */
	public static String double2Percent(double value){
		DecimalFormat df = new DecimalFormat("0.00%");
		return df.format(value);
	}
	
	/**
	 * json转字符串
	 * @param jsonObject
	 * @param key
	 * @return
	 */
	public static String JSON2String(JSONObject jsonObject, String key){
		String result = "";
		try {
			result = jsonObject.getString(key);
		} catch (JSONException e) {
			System.out.println(key + "不存在");
		}
		return result;
	}
	/**
	 * 判断excel表单元格类型，并获取字段数据
	 * @param cell0
	 * @return
	 */
	public static String getCellValue(XSSFCell cell0) {
		String cellValue = "";
		switch (cell0.getCellType()) {
		case XSSFCell.CELL_TYPE_STRING:
			cellValue = cell0.getRichStringCellValue().getString().trim();
			break;
		case XSSFCell.CELL_TYPE_NUMERIC:
    	   if (HSSFDateUtil.isCellDateFormatted(cell0)) {    //判断是日期类型
               SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-M-dd");
               Date dt = HSSFDateUtil.getJavaDate(cell0.getNumericCellValue());//获取成DATE类型   
               cellValue = dateformat.format(dt); 
    	   }else{
    		   DecimalFormat df1 = new DecimalFormat("0");  
        	   cellValue = df1.format(cell0.getNumericCellValue());
    	   }
    	   break;
		case XSSFCell.CELL_TYPE_BOOLEAN:
			cellValue = String.valueOf(cell0.getBooleanCellValue()).trim();
			break;
		case XSSFCell.CELL_TYPE_FORMULA:
			cellValue = cell0.getCellFormula();
			break;
		default:
			cellValue = "";
		}
		return cellValue;
	}
	public static void main(String[] args){
//		String str = "13612345678";
//		String ss = str.substring(0,str.length()-(str.substring(3)).length())+"****"+str.substring(7);
//		System.out.println(ss);
//		UUID uuid = UUID.randomUUID();
//		System.out.println("uuid:" + uuid.toString());
		String time1 = "2017-01-01 00:00:00";
		String time2 = "2017-04-01 00:00:01";
//		System.out.println(time.substring(0,10));
//		String tel = "17010269265";
//		System.out.println(isMobile(tel));
//		String createDateString = "2017-12-12 00:00:00";
//		Date createDate = SystemTools.String2Date(createDateString, "yyyy-MM-dd HH:mm:ss");
//		String formatCreateDate = SystemTools.Time2String(new Date());
//		System.out.println("格式化之后：" + formatCreateDate);
		
		System.out.println(compareTime(time1, time2, 90, "d"));
	}

}
