package com.fuchen.academic.controller.front;

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
@RequestMapping("/front/users")
public class FrontUsersController {
	
	@Autowired
	private UsersDao usersDao;
	
	@RequestMapping("/info")
	public String info(HttpSession session){
		if(null == session.getAttribute(Const.CURRENT_USER)){
			return  "front/login";
		}
		
		return "front/info";
	}
	
	@RequestMapping("/update")
	public ModelAndView update(@ModelAttribute Users users,HttpSession session){
		ModelAndView mv = new ModelAndView("front/result");
		usersDao.update(users);
		Users cur = (Users) session.getAttribute(Const.CURRENT_USER);
		cur.setEmail(users.getEmail());
		cur.setTel(users.getTel());
		mv.addObject(Const.RESULT, "修改个人信息成功!");
		mv.addObject("returnUrl", session.getServletContext().getAttribute("webRoot")+"/front/users/info");
		return mv;
	}
	
	@RequestMapping(value="/password",method={RequestMethod.GET})
	public String password(HttpSession session){
		if(null == session.getAttribute(Const.CURRENT_USER)){
			return  "front/login";
		}
		
		return "front/password";
	}
	
	@RequestMapping(value="/password",method={RequestMethod.POST})
	public ModelAndView password(String oldpswd,String newpswd,HttpSession session){
		ModelAndView mv = new ModelAndView("front/result"); 
		//验证旧密码
		Users cur = (Users) session.getAttribute(Const.CURRENT_USER);
		cur.setPassword(StringUtil.getMd5(oldpswd));
		if(null != usersDao.validate(cur)){
			cur.setPassword(StringUtil.getMd5(newpswd));
			usersDao.passwd(cur);
			mv.addObject(Const.RESULT, "更新密码成功!");
		}
		//更改密码
		else{
			mv.addObject(Const.RESULT, "旧密码输入错误!");
		}
		mv.addObject("returnUrl", session.getServletContext().getAttribute("webRoot")+"/front/users/password");
		return mv;
	}
	
}
