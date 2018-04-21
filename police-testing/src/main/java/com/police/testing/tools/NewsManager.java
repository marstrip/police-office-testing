package com.police.testing.tools;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.police.testing.pojo.StaticDataLogin;

public class NewsManager {

    /**
     * @param args
     */
    public static void main(String[] args) {

        List newss=getNewsList();
        
        for(int i=0;i<newss.size();i++)
        {
            StaticDataLogin news=(StaticDataLogin)newss.get(i);
            System.out.println("departmentName:" + news.getDepartmentName());
            System.out.println("hits:"+news.getLoginCount());
            
        }

    }
    
    
    @SuppressWarnings("unchecked")
	public static List getNewsList()
    {
        
        List list=new ArrayList();
        
        StaticDataLogin news1=new StaticDataLogin();
        news1.setDepartmentName("北美项目部");
        news1.setLoginCount(1);
        list.add(news1);
        
        StaticDataLogin news2=new StaticDataLogin();
        news2.setDepartmentName("英联邦");
        news2.setLoginCount(6);
        list.add(news2);
        
        StaticDataLogin news3=new StaticDataLogin();
        news3.setDepartmentName("英语学习");
        news3.setLoginCount(5);
        list.add(news3);
        
        
        // 按点击数倒序
        Collections.sort(list, new Comparator<StaticDataLogin>() {
            public int compare(StaticDataLogin arg0, StaticDataLogin arg1) {
                int hits0 = arg0.getLoginCount();
                int hits1 = arg1.getLoginCount();
                if (hits1 > hits0) {
                    return 1;
                } else if (hits1 == hits0) {
                    return 0;
                } else {
                    return -1;
                }
            }
        });
        
        return list;
    }

}
