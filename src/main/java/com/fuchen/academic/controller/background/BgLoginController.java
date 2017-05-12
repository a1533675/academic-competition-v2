package com.fuchen.academic.controller.background;

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

/**
 * 后台登录
 * @author yshin1992
 *
 */
@Controller
@RequestMapping("/manager")
public class BgLoginController {
	
	@Autowired
	private UsersDao usersDao;
	
	/**
	 * 登录页
	 * @return
	 */
	@RequestMapping(value = "/login",method={RequestMethod.GET})
	public String login(){
		return "background/login";
	}
	
	/**
	 * 处理登录流程
	 * @param users 用户信息
	 * @param session 会话Session
	 * @return
	 */
	@RequestMapping(value = "/login",method={RequestMethod.POST})
	public ModelAndView login(@ModelAttribute Users users,HttpSession session){
		ModelAndView mv = new ModelAndView();
		//使用MD5算法加密表单传递过来的密码
		users.setPassword(StringUtil.getMd5(users.getPassword()));
		//验证用户是否存在
		Users validate = usersDao.validate(users);
		//对于参赛者用户不允许登录到后台
		if(null != validate && !Const.USERS_PARTICIPANT.equals(validate.getType())){
			session.setAttribute(Const.CURRENT_USER, validate);
			mv.setViewName("background/index");
		}else{
			mv.addObject("error", "用户名和密码错误!");
			mv.setViewName("background/login");
		}
		return mv;
	}
	
	/**
	 * 登录退出
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/loginout",method={RequestMethod.GET})
	public String loginout(HttpSession session){
		//销毁会话信息
		session.invalidate();
		return "redirect:/manager/login";
	}
}
