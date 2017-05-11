package com.fuchen.academic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fuchen.academic.constants.Const;
import com.fuchen.academic.dao.NoticeDao;
import com.fuchen.academic.dao.TopicDao;
import com.fuchen.academic.domain.Notice;
import com.fuchen.academic.domain.Topic;
import com.fuchen.academic.domain.Users;

@Controller
public class FrameController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private TopicDao topicDao;
	
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	
	@RequestMapping("/head")
	public String head(){
		return "head";
	}
	
	@RequestMapping("/tail")
	public String tail(){
		return "tail";
	}
	
	@RequestMapping("/menu")
	public String menu(HttpSession session){
		Users users = (Users) session.getAttribute(Const.CURRENT_USER);
		if(null == users){
			return "menu1";
		}
		
		if(Const.USERS_PARTICIPANT.equals(users.getType())){
			return "menu1";
		}else if(Const.USERS_PUBLISHER.equals(users.getType())){
			return "menu2";
		}else if(Const.USERS_ADMINISTRATOR.equals(users.getType())){
			return "menu3";
		}
		return "menu1";
	}
	
	@RequestMapping("/main")
	public ModelAndView main(){
		ModelAndView mv = new ModelAndView("main");
		
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("start", 0);
		condition.put("pageSize", 5);
		
		List<Notice> noticeList = noticeDao.queryByPage(condition);
		mv.addObject("noticeList", noticeList);
		
		List<Topic> topicList = topicDao.queryByPage(condition);
		mv.addObject("topicList", topicList);
		return mv;
	}
	
	@RequestMapping("/left")
	public String left(){
		return "blank";
	}
	
	@RequestMapping("/right")
	public String right(){
		return "blank";
	}
}
