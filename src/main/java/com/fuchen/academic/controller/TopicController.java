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
import com.fuchen.academic.dao.ReplyDao;
import com.fuchen.academic.dao.TopicDao;
import com.fuchen.academic.domain.Reply;
import com.fuchen.academic.domain.Topic;
import com.fuchen.academic.domain.Users;

@Controller
@RequestMapping(value="/topic")
public class TopicController {

	@Autowired
	private TopicDao topicDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	@RequestMapping(value="/queryByPage")
	public ModelAndView queryByPage(String page){
		ModelAndView mv = new ModelAndView("topic-list");
		Integer curPage = 1;
		if(StringUtil.isNotEmpty(page)){
			curPage = Integer.parseInt(page);
		}
		Map<String,Object> params = new HashMap<String,Object>();
		Integer total = topicDao.count(params);
		
		Pagination<Topic> pagination = new Pagination<Topic>(curPage, total);
		
		params.put("start", (curPage-1)*pagination.getPageSize());
		params.put("pageSize", pagination.getPageSize());
		
		List<Topic> pageList = topicDao.queryByPage(params);
		pagination.setItems(pageList);
		mv.addObject(Const.PAGINATION, pagination);
		return mv;
	}
	
	
	/**
	 * 跳转到新增页面
	 * @return
	 */
	@RequestMapping(value="/add",method={RequestMethod.GET})
	public String add(){
		return "topic-add";
	}
	
	/**
	 * 新增
	 * @param file
	 * @param competition
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/add",method={RequestMethod.POST})
	public ModelAndView add(@ModelAttribute Topic topic,HttpSession session){
		ModelAndView mv = new ModelAndView(Const.RESULT);
		Users users = (Users) session.getAttribute(Const.CURRENT_USER);
		topic.setId(StringUtil.getUUID());
		topic.setUsers(users);
		topicDao.add(topic);
		mv.addObject(Const.RESULT, "话题发布成功!");
		mv.addObject(Const.RETURN_URL, "queryByPage");
		return mv;
	}
	
	/**
	 * 根据ID查询详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/detail")
	public ModelAndView queryById(String id,String page){
		ModelAndView mv = new ModelAndView("topic-detail");
		if(StringUtil.isNotEmpty(id)){
			Topic topic = topicDao.queryById(id);
			mv.addObject(Const.RESULT, topic);
			
			Integer curPage = 1;
			if(StringUtil.isNotEmpty(page)){
				curPage = Integer.parseInt(page);
			}
			Map<String,Object> params = new HashMap<String,Object>();
			
			params.put("topicId", id);
			
			Integer total = replyDao.count(params);
			
			Map<String,String> queryParam = new HashMap<String,String>();
			queryParam.put("id", id);
			
			Pagination<Reply> pagination = new Pagination<Reply>(curPage, total,null,null,queryParam);
			
			params.put("start", (curPage-1)*pagination.getPageSize());
			params.put("pageSize", pagination.getPageSize());
			
			List<Reply> pageList = replyDao.queryByPage(params);
			pagination.setItems(pageList);
			mv.addObject("page", curPage);
			mv.addObject("pageSize", pagination.getPageSize());
			mv.addObject(Const.PAGINATION, pagination);
		}
		
		return mv;
	}
}
