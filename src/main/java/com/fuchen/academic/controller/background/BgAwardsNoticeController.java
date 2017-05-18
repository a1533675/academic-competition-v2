package com.fuchen.academic.controller.background;

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
import org.ysh.springmvc.base.vo.Pagination;

import com.fuchen.academic.constants.Const;
import com.fuchen.academic.dao.AwardsNoticeDao;
import com.fuchen.academic.dao.CompetitionDao;
import com.fuchen.academic.domain.AwardsNotice;
import com.fuchen.academic.domain.Competition;
import com.fuchen.academic.domain.Users;

@Controller
@RequestMapping(value="/manager/awards")
public class BgAwardsNoticeController {
	private static final Logger LOG = Logger.getLogger(BgAwardsNoticeController.class);
	
	private static final String URL = ResourcesUtil.getResourcesURL();
	@Autowired
	private AwardsNoticeDao awardsNoticeDao;
	
	@Autowired
	private CompetitionDao competitionDao;
	
	@RequestMapping(value="/add",method={RequestMethod.GET})
	public ModelAndView add(String competitionId){
		ModelAndView mv = new ModelAndView("background/awards-add");
		if(StringUtil.isNotEmpty(competitionId)){
			Competition competition = competitionDao.queryById(competitionId);
			mv.addObject(Const.RESULT, competition);
		}
		return mv;
	}
	
	@RequestMapping(value="/add",method={RequestMethod.POST})
	public ModelAndView add(@RequestParam("attachment") MultipartFile file, @ModelAttribute AwardsNotice awardsNotice,HttpSession session){
		ModelAndView mv = new ModelAndView(Const.BG_RESULT);
		File dir = new File(URL);
		if(!dir.exists()){
			dir.mkdirs();
		}
		Users curUser = (Users) session.getAttribute(Const.CURRENT_USER);
		awardsNotice.setId(StringUtil.getUUID());
		awardsNotice.setPublisher(curUser);
		if(null != file && file.getSize() > 0){
			String originName = file.getOriginalFilename();
			String ext = originName.substring(originName.indexOf("."));
			String targetFileName = StringUtil.getUUID()+ext;
			try {
				file.transferTo(new File(URL + "/" + targetFileName));
				awardsNotice.setAttachmentUrl(targetFileName);
			} catch (Exception e) {
				LOG.error("文件上传异常",e);
			} 
		}
		
		awardsNoticeDao.add(awardsNotice);
		mv.addObject(Const.NAVS,new String[]{"通知公告","获奖通知"});
		mv.addObject(Const.RESULT, "获奖通知发布成功!");
		mv.addObject(Const.RETURN_URL, "querySelfByPage");
		return mv;
	}
	
	/**
	 * @param page
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/querySelfByPage",method={RequestMethod.GET})
	public ModelAndView querySelf(String page,HttpSession session){
		Integer curPage = 1;
		if(StringUtil.isNotEmpty(page)){
			curPage = Integer.parseInt(page);
		}
		
		Map<String,Object> condition = new HashMap<String,Object>();
		
		Integer total = awardsNoticeDao.count(condition);
		
		Pagination<AwardsNotice> pagination = new Pagination<AwardsNotice>(curPage, total);
		
		condition.put("start", (curPage-1)*pagination.getPageSize());
		condition.put("pageSize", pagination.getPageSize());
		
		List<AwardsNotice> pageList = awardsNoticeDao.queryByPage(condition);
		pagination.setItems(pageList);
		
		ModelAndView mv = new ModelAndView("background/awards-self-list");
		mv.addObject(Const.PAGINATION, pagination);
		
		return mv;
	}
	
	
	/**
	 * 根据ID查询详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/detail")
	public ModelAndView queryById(String id,HttpSession session){
		ModelAndView mv = new ModelAndView("background/awards-detail");
		if(StringUtil.isNotEmpty(id)){
			AwardsNotice awards = awardsNoticeDao.queryById(id);
			mv.addObject(Const.RESULT, awards);
		}
		return mv;
	}
	
	/**
	 * 根据ID查询详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/update",method={RequestMethod.GET})
	public ModelAndView update(String id,HttpSession session){
		ModelAndView mv = new ModelAndView("background/awards-update");
		if(StringUtil.isNotEmpty(id)){
			AwardsNotice awards = awardsNoticeDao.queryById(id);
			mv.addObject(Const.RESULT, awards);
		}
		return mv;
	}
	
	/**
	 * 更新操作
	 * @param awardsNotice
	 * @return
	 */
	@RequestMapping(value="/update",method={RequestMethod.POST})
	public ModelAndView update(@RequestParam("attachment") MultipartFile file,@ModelAttribute AwardsNotice awardsNotice){
		ModelAndView mv = new ModelAndView(Const.BG_RESULT);
		if(null != file && file.getSize() > 0){
			String originName = file.getOriginalFilename();
			String ext = originName.substring(originName.indexOf("."));
			String targetFileName = StringUtil.getUUID()+ext;
			try {
				file.transferTo(new File(URL + "/" + targetFileName));
				awardsNotice.setAttachmentUrl(targetFileName);
			} catch (Exception e) {
				LOG.error("文件上传异常",e);
			} 
			
		}
		awardsNoticeDao.update(awardsNotice);
		mv.addObject(Const.NAVS,new String[]{"通知公告","获奖通知"});
		mv.addObject(Const.RESULT, "获奖通知更新成功!");
		mv.addObject(Const.RETURN_URL, "querySelfByPage");
		return mv;
	}
	
	
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/delete")
	public ModelAndView delete(@RequestParam(value="ids[]") String[] ids){
		ModelAndView mv = new ModelAndView(Const.BG_RESULT);
		awardsNoticeDao.batchDelete(ids);
		mv.addObject(Const.NAVS,new String[]{"通知公告","获奖通知"});
		mv.addObject(Const.RESULT, "获奖通知批量删除成功!");
		mv.addObject(Const.RETURN_URL, "querySelfByPage");
		return mv;
	}
}
