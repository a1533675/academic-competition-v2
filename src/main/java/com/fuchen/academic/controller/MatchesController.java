package com.fuchen.academic.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.ysh.springmvc.base.util.ResourcesUtil;
import org.ysh.springmvc.base.util.StringUtil;

import com.fuchen.academic.constants.Const;
import com.fuchen.academic.dao.CompetitionDao;
import com.fuchen.academic.dao.MatchesDao;
import com.fuchen.academic.domain.Competition;
import com.fuchen.academic.domain.Matches;
import com.fuchen.academic.domain.Users;

@Controller
@RequestMapping(value="/matches")
public class MatchesController {
	private static final Logger LOG = Logger.getLogger(CompetitionController.class);
	private static final String URL = ResourcesUtil.getResourcesURL();
	
	@Autowired
	private MatchesDao matchesDao;
	
	@Autowired
	private CompetitionDao competitionDao;
	
	/**
	 * 跳转到竞赛结果提交页面
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/add",method={RequestMethod.GET})
	public ModelAndView add(String id,HttpSession session){
		ModelAndView mv= new ModelAndView("matches-add");
		Competition competition = competitionDao.queryById(id);
		mv.addObject(Const.RESULT, competition);
		return mv;
	}
	
	/**
	 * 提交竞赛结果
	 * @param file
	 * @param matches
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/add",method={RequestMethod.POST})
	public ModelAndView add(@RequestParam("attachment") MultipartFile file,@ModelAttribute Matches matches,HttpSession session){
		ModelAndView mv= new ModelAndView(Const.RESULT);
		Users curUser = (Users) session.getAttribute(Const.CURRENT_USER);
		matches.setParticipant(curUser);
		matches.setId(StringUtil.getUUID());
		if(null != file && file.getSize() > 0){
			String originName = file.getOriginalFilename();
			String ext = originName.substring(originName.indexOf("."));
			String targetFileName = StringUtil.getUUID()+ext;
			try {
				file.transferTo(new File(URL + "/" + targetFileName));
				matches.setAttachmentUrl(targetFileName);
			} catch (Exception e) {
				LOG.error("文件上传异常",e);
			} 
		}
		matchesDao.add(matches);
		mv.addObject(Const.RESULT, "竞赛结果提交成功!");
		mv.addObject(Const.RETURN_URL, session.getServletContext().getContextPath() + "/competition/queryByPage");
		return mv;
	}
	
	@RequestMapping(value="/list")
	public ModelAndView list(String id){
		ModelAndView mv= new ModelAndView("matches-list");
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("competitionId", id);
		List<Matches> items = matchesDao.queryByCompetition(condition);
		mv.addObject(Const.LIST, items);
		return mv;
	}
	
}
