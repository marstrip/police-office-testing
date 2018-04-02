package com.police.testing.tools;


import java.io.UnsupportedEncodingException;
/**
 * 编码解码工具类
 * @author wugang
 *
 */
public class GetEncode {
	
	public static String transcode(String str, String sourceCharset, String targetCharset){
		if (str  ==  null)  
			return  null;  
        String  retStr  =  str;  
        byte b[];  
        try{  
             b = str.getBytes(sourceCharset); 
             for(int i=0; i < b.length; i++){
                byte  b1  =  b[i];  
                if(b1 == 63)  
                    break;
                else if(b1 > 0)  
                    continue;
                else if(b1 < 0){
                    retStr = new String(b, targetCharset);  
                    break;  
                }  
             } 
             
             b = retStr.getBytes();
        }catch(UnsupportedEncodingException e){  
            e.printStackTrace();   
        } 
        return  retStr;
	}
	
	/**
	 * 将字符串先按ISO8859-1解码，再按UTF-8编码
	 * @param str
	 * @return
	 */
	public static String transcode(String str){
		if(str == null || "".equals(str.trim()))
			return "";
		return transcode(str,"ISO8859-1", "UTF-8");
	}

}
