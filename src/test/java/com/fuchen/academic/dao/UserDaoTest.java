package com.fuchen.academic.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.ysh.springmvc.base.util.StringUtil;

import com.fuchen.academic.constants.Const;
import com.fuchen.academic.domain.Users;

import junit.framework.TestCase;

public class UserDaoTest extends TestCase {

	public void testUserAdd(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/applicationContext-test.xml");
		UsersDao usersDao = ctx.getBean("usersDao",UsersDao.class);
		
		Users user = new Users();
		user.setName("王国聘");
		user.setEmail("2596891215@qq.com");
		user.setNumber(StringUtil.getUUID());
		user.setTel("18362950415");
		user.setType(Const.USERS_SCHOOL_LEADER);
		user.setReviewlv(3);
		user.setPassword(StringUtil.getMd5("123456"));
		usersDao.add(user);
	}
	
}
