package com.fuchen.academic.controller.front;

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
import com.fuchen.academic.dao.CompetitionDao;
import com.fuchen.academic.dao.UsersDao;
import com.fuchen.academic.domain.Competition;
import com.fuchen.academic.domain.Users;

@RequestMapping("/front")
@Controller
public class FrontLoginController {
	
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private CompetitionDao competitionDao;
	/**
	 * 登录页
	 * @return
	 */
	@RequestMapping(value = "/login",method={RequestMethod.GET})
	public String login(){
		return "front/login";
	}
	
	/**
	 * 登录处理
	 * @param users
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login",method={RequestMethod.POST})
	public ModelAndView login(@ModelAttribute Users users,HttpSession session){
		ModelAndView mv = new ModelAndView();
		users.setPassword(StringUtil.getMd5(users.getPassword()));
		Users validate = usersDao.validate(users);
		if(null != validate){
			session.setAttribute(Const.CURRENT_USER, validate);
			Integer curPage = 1;
			Integer total = competitionDao.count(null);
			
			Pagination<Competition> pagination = new Pagination<Competition>(curPage, total);
			
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("start", (curPage-1)*pagination.getPageSize());
			params.put("pageSize", pagination.getPageSize());
			params.put("checkStep", Const.CHECK_STEP_THIRD);
			List<Competition> pageList = competitionDao.queryByPage(params);
			pagination.setItems(pageList);
			
			mv.addObject(Const.PAGINATION, pagination);
			mv.setViewName("front/index");
		}else{
			mv.addObject("error", "用户名和密码错误!");
			mv.setViewName("front/login");
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
		return "redirect:/index.html";
	}
}
