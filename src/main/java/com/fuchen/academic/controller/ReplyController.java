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
import com.fuchen.academic.dao.ReplyDao;
import com.fuchen.academic.domain.Reply;
import com.fuchen.academic.domain.Users;

@Controller
@RequestMapping(value="/reply")
public class ReplyController {

	@Autowired
	private ReplyDao replyDao;
	
	/**
	 * 新增
	 * @param file
	 * @param competition
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/add",method={RequestMethod.POST})
	public ModelAndView add(@ModelAttribute Reply reply,HttpSession session){
		ModelAndView mv = new ModelAndView(Const.RESULT);
		Users users = (Users) session.getAttribute(Const.CURRENT_USER);
		reply.setId(StringUtil.getUUID());
		reply.setUsers(users);
		replyDao.add(reply);
		mv.addObject(Const.RESULT, "回复发表成功!");
		mv.addObject(Const.RETURN_URL, session.getServletContext().getContextPath() + "/topic/detail?id="+reply.getTopic().getId());
		return mv;
	}
}
