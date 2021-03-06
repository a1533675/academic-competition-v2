package com.fuchen.academic.controller.background;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.ysh.springmvc.base.util.LogUtil;

import com.fuchen.academic.constants.Const;
import com.fuchen.academic.dao.MatchesDao;
import com.fuchen.academic.domain.Matches;

/**
 * 比赛评分
 * @author
 *
 */
@Controller
@RequestMapping("/manager/matches")
public class BgMatchesController {

	@Autowired
	private MatchesDao matchesDao;
	
	@RequestMapping(value="/list")
	public ModelAndView list(String id){
		ModelAndView mv= new ModelAndView("background/matches-list");//a9b36133ed0c4d78aa33071440699d77
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("competitionId", id);
		List<Matches> items = matchesDao.queryByCompetition(condition);
		mv.addObject(Const.LIST, items);
		return mv;
	}
	
	@RequestMapping(value="/score",method={RequestMethod.GET})
	public ModelAndView score(String id){
		ModelAndView mv = new ModelAndView("background/matches-score");
		Matches matches = matchesDao.queryById(id);
		LogUtil.getLogger(this).error(matches);
		mv.addObject(Const.RESULT, matches);
		return mv;
		
	}
	
	@RequestMapping(value="/score",method={RequestMethod.POST})
	public String score(@ModelAttribute Matches matches){
//		ModelAndView mv = new ModelAndView(Const.BG_RESULT);
		matchesDao.update(matches);
//		mv.addObject(Const.NAVS,new String[]{"评分管理","项目评分"});
//		mv.addObject(Const.RESULT, "评分成功!");
//		mv.addObject(Const.RETURN_URL, "list?id="+matches.getCompetition().getId());
		return "redirect:list?id="+matches.getCompetition().getId();
		
	}
	
}
