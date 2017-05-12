package com.fuchen.academic.controller.background;

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
@RequestMapping("/manager/users")
public class BgUsersController {
	
	@Autowired
	private UsersDao usersDao;
	
	/**
	 * 查看个人信息
	 * @return
	 */
	@RequestMapping("/info")
	public String info(){
		return "background/info";
	}
	
	/**
	 * 更改个人信息
	 * @param users 用户信息
	 * @param session 用户Session
	 * @return
	 */
	@RequestMapping("/update")
	public ModelAndView update(@ModelAttribute Users users,HttpSession session){
		ModelAndView mv = new ModelAndView(Const.BG_RESULT);
		//更新用户信息
		usersDao.update(users);
		Users cur = (Users) session.getAttribute(Const.CURRENT_USER);
		//将保存在Session中的用户信息同步更新
		cur.setEmail(users.getEmail());
		cur.setTel(users.getTel());
		//设置结果页导航栏
		mv.addObject(Const.NAVS,new String[]{"个人中心","个人信息"});
		//提示结果
		mv.addObject(Const.RESULT, "修改个人信息成功!");
		//设置返回页
		mv.addObject("returnUrl", session.getServletContext().getAttribute("webRoot")+"/manager/users/info");
		return mv;
	}
	
	/**
	 * 个人密码修改页跳转
	 * @return
	 */
	@RequestMapping(value="/password",method={RequestMethod.GET})
	public String password(){
		return "background/password";
	}
	
	/**
	 * 修改个人密码
	 * @param oldpswd
	 * @param newpswd
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/password",method={RequestMethod.POST})
	public ModelAndView password(String oldpswd,String newpswd,HttpSession session){
		ModelAndView mv = new ModelAndView(Const.BG_RESULT); 
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
		//设置结果页导航栏
		mv.addObject(Const.NAVS,new String[]{"个人中心","密码修改"});
		//设置返回页
		mv.addObject("returnUrl", session.getServletContext().getAttribute("webRoot")+"/manager/users/password");
		return mv;
	}
	
	/**
	 * 参与者列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/participant")
	public ModelAndView participant(String page){
		ModelAndView mv = new ModelAndView("background/user-participant-list");
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
	
}
