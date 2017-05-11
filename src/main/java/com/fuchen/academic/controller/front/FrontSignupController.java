package com.fuchen.academic.controller.front;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.ysh.springmvc.base.util.StringUtil;

import com.fuchen.academic.constants.Const;
import com.fuchen.academic.dao.UsersDao;
import com.fuchen.academic.domain.Users;

@Controller
@RequestMapping("/front")
public class FrontSignupController {
	
	@Autowired
	private UsersDao usersDao;
	
	@RequestMapping(value="/signup",method={RequestMethod.GET})
	public String signup(){
		return "front/signup";
	}
	
	@RequestMapping(value="/signup",method={RequestMethod.POST})
	public String signup(@ModelAttribute Users users,HttpSession session){
		users.setNumber(StringUtil.getUUID());
		users.setPassword(StringUtil.getMd5(users.getPassword()));
		session.setAttribute(Const.CURRENT_USER, users);
		usersDao.add(users);
		return "redirect:/index.html";
	}
}
