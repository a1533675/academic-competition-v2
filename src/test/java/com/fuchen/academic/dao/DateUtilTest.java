package com.fuchen.academic.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

import junit.framework.TestCase;

public class DateUtilTest extends TestCase{

	public void testBetween(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		
		Date oneDayAgo = new Date(117,4,31);//时间基于1900
		
		System.out.println(sdf.format(oneDayAgo));
		
		System.out.println(now.after(oneDayAgo));
	
	}
	
}
