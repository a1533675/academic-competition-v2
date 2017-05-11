package com.fuchen.academic.controller.front;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.ysh.springmvc.base.util.StringUtil;
import org.ysh.springmvc.base.vo.Pagination;

import com.fuchen.academic.constants.Const;
import com.fuchen.academic.dao.NoticeDao;
import com.fuchen.academic.domain.Notice;

/**
 * 前台公告Controller
 * @author yshin1992
 *
 */
@Controller
@RequestMapping("/front/notice")
public class FrontNoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	/**
	 * 分页查询
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/queryByPage")
	public ModelAndView queryByPage(String page){
		Integer curPage = 1;
		if(StringUtil.isNotEmpty(page)){
			curPage = Integer.parseInt(page);
		}
		
		Integer total = noticeDao.count(null);
		
		Pagination<Notice> pagination = new Pagination<Notice>(curPage, total);
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("start", (curPage-1)*pagination.getPageSize());
		params.put("pageSize", pagination.getPageSize());
		
		List<Notice> pageList = noticeDao.queryByPage(params);
		pagination.setItems(pageList);
		
		ModelAndView mv = new ModelAndView("front/notice-list");
		mv.addObject(Const.PAGINATION, pagination);
		
		return mv;
	}
	
	/**
	 * 根据ID查询详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/detail")
	public ModelAndView queryById(String id){
		ModelAndView mv = new ModelAndView("front/notice-detail");
		if(StringUtil.isNotEmpty(id)){
			Notice notice = noticeDao.queryById(id);
			mv.addObject(Const.RESULT, notice);
		}
		return mv;
	}
	
}
