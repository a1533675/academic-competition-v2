package com.fuchen.academic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.ysh.springmvc.base.util.StringUtil;
import org.ysh.springmvc.base.vo.Pagination;

import com.fuchen.academic.constants.Const;
import com.fuchen.academic.dao.UsersDao;
import com.fuchen.academic.domain.Users;

@Controller
@RequestMapping("/users")
public class UsersController {
	
	@Autowired
	private UsersDao usersDao;
	
	@RequestMapping("/info")
	public String info(){
		return "info";
	}
	
	@RequestMapping("/update")
	public ModelAndView update(@ModelAttribute Users users,HttpSession session){
		ModelAndView mv = new ModelAndView("result");
		usersDao.update(users);
		Users cur = (Users) session.getAttribute(Const.CURRENT_USER);
		cur.setEmail(users.getEmail());
		cur.setTel(users.getTel());
		mv.addObject(Const.RESULT, "修改个人信息成功!");
		mv.addObject("returnUrl", session.getServletContext().getAttribute("webRoot")+"/users/info");
		return mv;
	}
	
	@RequestMapping(value="/password",method={RequestMethod.GET})
	public String password(){
		return "password";
	}
	
	@RequestMapping(value="/password",method={RequestMethod.POST})
	public ModelAndView password(String oldpswd,String newpswd,HttpSession session){
		ModelAndView mv = new ModelAndView(Const.RESULT); 
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
		mv.addObject("returnUrl", session.getServletContext().getAttribute("webRoot")+"/users/password");
		return mv;
	}
	
	/**
	 * 参与者列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/participant")
	public ModelAndView participant(String page){
		ModelAndView mv = new ModelAndView("user-participant-list");
		Integer curPage = 1;
		if(StringUtil.isNotEmpty(page)){
			curPage = Integer.parseInt(page);
		}
		
		Map<String,Object> params = new HashMap<String,Object>();
		
		params.put("type", Const.USERS_PARTICIPANT);
		
		Integer total = usersDao.count(params);
		
		Pagination<Users> pagination = new Pagination<Users>(curPage, total);
		
		params.put("start", (curPage-1)*pagination.getPageSize());
		params.put("pageSize", pagination.getPageSize());
		
		List<Users> pageList = usersDao.queryByPage(params);
		pagination.setItems(pageList);
		mv.addObject(Const.PAGINATION, pagination);
		
		return mv;
	}
	
	/**
	 * 发布者列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/publisher")
	public ModelAndView publisher(String page){
		ModelAndView mv = new ModelAndView("user-publisher-list");
		Integer curPage = 1;
		if(StringUtil.isNotEmpty(page)){
			curPage = Integer.parseInt(page);
		}
		
		Map<String,Object> params = new HashMap<String,Object>();
		
		params.put("type", Const.USERS_PUBLISHER);
		
		Integer total = usersDao.count(params);
		
		Pagination<Users> pagination = new Pagination<Users>(curPage, total);
		
		params.put("start", (curPage-1)*pagination.getPageSize());
		params.put("pageSize", pagination.getPageSize());
		
		List<Users> pageList = usersDao.queryByPage(params);
		pagination.setItems(pageList);
		mv.addObject(Const.PAGINATION, pagination);
		
		return mv;
	}
}
