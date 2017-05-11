package com.fuchen.academic.controller.front;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.ysh.springmvc.base.util.StringUtil;

import com.fuchen.academic.constants.Const;
import com.fuchen.academic.dao.CompetitionDao;
import com.fuchen.academic.domain.Competition;

/**
 * 竞赛项目控制器
 * @author yshin1992
 *
 */
@Controller
@RequestMapping("/front/competition")
public class FrontCompetitionController {

	@Autowired
	private CompetitionDao competitionDao;
	
	/**
	 * 根据ID查询详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/detail")
	public ModelAndView queryById(String id,HttpSession session){
		ModelAndView mv = new ModelAndView("front/competition-detail");
		if(StringUtil.isNotEmpty(id)){
			Competition competition = competitionDao.queryById(id);
			mv.addObject(Const.RESULT, competition);
		}
		return mv;
	}
	
	
	
}
