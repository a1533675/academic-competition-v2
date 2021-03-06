package com.fuchen.academic.controller.front;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.ysh.springmvc.base.util.StringUtil;
import org.ysh.springmvc.base.vo.ResponseMsg;

import com.fuchen.academic.constants.Const;
import com.fuchen.academic.dao.CompetitionDao;
import com.fuchen.academic.dao.MatchesDao;
import com.fuchen.academic.domain.Competition;
import com.fuchen.academic.domain.Matches;
import com.fuchen.academic.domain.Users;

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
	@Autowired
	private MatchesDao matchesDao;
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
	
	@RequestMapping(value="/queryByPage")
	public ModelAndView joinlist(String page,HttpSession session){
		if(null == session.getAttribute(Const.CURRENT_USER)){
			return  new ModelAndView("front/login");
		}
		
		ModelAndView mv = new ModelAndView("front/competition-list");
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("checkStep", Const.CHECK_STEP_THIRD);
		mv.addObject("canList",competitionDao.queryCanJoinList(params));
		mv.addObject("historyList",competitionDao.queryHistoryList(params));
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/join")
	public ResponseMsg join(String id,HttpSession session){
		ResponseMsg msg = new ResponseMsg();
		Users curUser = (Users) session.getAttribute(Const.CURRENT_USER);
		
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("competitionId", id);
		param.put("number", curUser.getNumber());
		
		//查看竞赛项目是否重复报名
		Matches queryByUC = matchesDao.queryByUC(param);
		if(null != queryByUC && StringUtil.isNotEmpty(queryByUC.getId())){
			msg.setCode(-1);
			msg.setMsg("竞赛不能重复报名!");
			return msg;
		}
		
		Competition c = competitionDao.queryById(id);
		//比较项目竞赛时间
		//这个时间段是不是已经有其他比赛
		Date _startTime = c.getStartTime();
		Date _endTime = c.getEndTime();
		List<Matches> matchesList = matchesDao.queryByUserEnroll(param);
		if(null != matchesList && matchesList.size() > 0){
			for(Matches m:matchesList){
				Date start = m.getCompetition().getStartTime();
				Date end = m.getCompetition().getEndTime();
				//比赛时间有重合
				if((_startTime.after(start)&&_startTime.after(end)) || (_endTime.after(start)&&_endTime.after(end))){
					msg.setCode(-1);
					msg.setMsg("当前竞赛的报名时间和您已报名的【"+m.getCompetition().getTitle()+"】时间发生冲突!");
					return msg;
				}
			}
		}
		
		Matches matches = new Matches();
		matches.setParticipant(curUser);
		matches.setId(StringUtil.getUUID());
		Competition competition = new Competition();
		competition.setId(id);
		matches.setCompetition(competition);
		matchesDao.add(matches);
		msg.setMsg("竞赛项目报名成功!");
		return msg;
	}
	
	
	
}
