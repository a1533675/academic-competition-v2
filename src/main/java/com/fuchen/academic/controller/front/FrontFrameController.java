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
import com.fuchen.academic.dao.CompetitionDao;
import com.fuchen.academic.domain.Competition;

/**
 * 前台的框架跳转控制器
 */
@Controller
public class FrontFrameController {

	@Autowired
	private CompetitionDao competitionDao;
	
	@RequestMapping("/index.html")
	public ModelAndView indexHtml(String page){
		Integer curPage = 1;
		if(StringUtil.isNotEmpty(page)){
			curPage = Integer.parseInt(page);
		}
		
		Integer total = competitionDao.count(null);
		
		Pagination<Competition> pagination = new Pagination<Competition>(curPage, total);
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("start", (curPage-1)*pagination.getPageSize());
		params.put("pageSize", pagination.getPageSize());
		
		List<Competition> pageList = competitionDao.queryByPage(params);
		pagination.setItems(pageList);
		
		ModelAndView mv = new ModelAndView("front/index");
		mv.addObject(Const.PAGINATION, pagination);
		
		return mv;
	}
	
}
