package com.fuchen.academic.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.ysh.springmvc.base.util.StringUtil;

import com.fuchen.academic.constants.Const;
import com.fuchen.academic.dao.UsersDao;
import com.fuchen.academic.domain.Users;

@Controller
public class SignController {
	
	@Autowired
	private UsersDao usersDao;
	
	@RequestMapping(value="/signup",method={RequestMethod.GET})
	public String signup(){
		return "signup";
	}
	
	@RequestMapping(value="/signup",method={RequestMethod.POST})
	public ModelAndView signup(@ModelAttribute Users users,HttpSession session){
		ModelAndView mv = new ModelAndView("index");
		users.setNumber(StringUtil.getUUID());
		users.setPassword(StringUtil.getMd5(users.getPassword()));
		session.setAttribute(Const.CURRENT_USER, users);
		usersDao.add(users);
		return mv;
	}
}
