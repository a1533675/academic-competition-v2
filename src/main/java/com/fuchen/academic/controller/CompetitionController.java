package com.fuchen.academic.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.fuchen.academic.dao.CompetitionDao;
import com.fuchen.academic.dao.MatchesDao;
import com.fuchen.academic.domain.Competition;
import com.fuchen.academic.domain.Matches;
import com.fuchen.academic.domain.Users;

@Controller
@RequestMapping("/competition")
public class CompetitionController {
	
	private static final Logger LOG = Logger.getLogger(CompetitionController.class);
	
	private static final String URL = ResourcesUtil.getResourcesURL();
	
	@Autowired
	private CompetitionDao competitionDao;
	
	@Autowired
	private MatchesDao matchesDao;
	
	/**
	 * 项目发布页面
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
		
		Users self = (Users) session.getAttribute(Const.CURRENT_USER);
		
		condition.put("publisherId", self.getNumber());
		
		Integer total = competitionDao.count(condition);
		
		Pagination<Competition> pagination = new Pagination<Competition>(curPage, total);
		
		condition.put("start", (curPage-1)*pagination.getPageSize());
		condition.put("pageSize", pagination.getPageSize());
		
		List<Competition> pageList = competitionDao.queryByPage(condition);
		pagination.setItems(pageList);
		
		ModelAndView mv = new ModelAndView("competition-self-list");
		mv.addObject(Const.PAGINATION, pagination);
		
		return mv;
	}
	
	/**
	 * 跳转到新增页面
	 * @return
	 */
	@RequestMapping(value="/add",method={RequestMethod.GET})
	public String add(){
		return "competition-add";
	}
	
	/**
	 * 新增
	 * @param file
	 * @param competition
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/add",method={RequestMethod.POST})
	public ModelAndView add(@RequestParam("attachment") MultipartFile file, @ModelAttribute Competition competition,HttpSession session){
		ModelAndView mv = new ModelAndView(Const.RESULT);
		File dir = new File(URL);
		if(!dir.exists()){
			dir.mkdirs();
		}
		Users curUser = (Users) session.getAttribute(Const.CURRENT_USER);
		competition.setId(StringUtil.getUUID());
		competition.setPublisherId(curUser);
		if(null != file && file.getSize() > 0){
			String originName = file.getOriginalFilename();
			String ext = originName.substring(originName.indexOf("."));
			String targetFileName = StringUtil.getUUID()+ext;
			try {
				file.transferTo(new File(URL + "/" + targetFileName));
				competition.setAttachmentUrl(targetFileName);
			} catch (Exception e) {
				LOG.error("文件上传异常",e);
			} 
		}
		
		competitionDao.add(competition);
		mv.addObject(Const.RESULT, "竞赛项目发布成功!");
		mv.addObject(Const.RETURN_URL, "querySelfByPage");
		return mv;
	}
	
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
		
		Integer total = competitionDao.count(null);
		
		Pagination<Competition> pagination = new Pagination<Competition>(curPage, total);
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("start", (curPage-1)*pagination.getPageSize());
		params.put("pageSize", pagination.getPageSize());
		
		List<Competition> pageList = competitionDao.queryByPage(params);
		pagination.setItems(pageList);
		
		ModelAndView mv = new ModelAndView("competition-list");
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
		ModelAndView mv = new ModelAndView("competition-detail");
		if(StringUtil.isNotEmpty(id)){
			Competition competition = competitionDao.queryById(id);
			mv.addObject(Const.RESULT, competition);
			
			//判断能否参赛
			boolean canJoin = false;
			//1 判断是否在参赛时间内
			Date now = new Date();
			if(competition.getStartTime().before(now) && competition.getEndTime().after(now)){
				canJoin = true;
			}
			//2 判断参赛资格
			if(canJoin){
				Users users = (Users) session.getAttribute(Const.CURRENT_USER);
				if(Const.USERS_PARTICIPANT.equals(users.getType())){
					Map<String,Object> params = new HashMap<String,Object>();
					params.put("competitionId", id);
					params.put("number", users.getNumber());
					Matches matches = matchesDao.queryByUC(params);
					if(null!= matches){
						canJoin =false;
					}
				}else{
					canJoin = false;
				}
			}
			
			mv.addObject("canJoin", canJoin);
		}
		return mv;
	}
	
	/**
	 * 附件下载
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/download")
	public ResponseEntity<byte[]> download(String filename) throws IOException{
		File file = new File(URL +"/" + filename);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentDispositionFormData("attachment", filename);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers,HttpStatus.CREATED);
	}
	
	/**
	 * 更新页面
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/update",method={RequestMethod.GET})
	public ModelAndView update(String id){
		ModelAndView mv = new ModelAndView("competition-update");
		if(StringUtil.isNotEmpty(id)){
			Competition competition = competitionDao.queryById(id);
			mv.addObject(Const.RESULT, competition);
		}
		return mv;
	}
	
	/**
	 * 更新操作
	 * @param competition
	 * @return
	 */
	@RequestMapping(value="/update",method={RequestMethod.POST})
	public ModelAndView update(@RequestParam("attachment") MultipartFile file,@ModelAttribute Competition competition){
		ModelAndView mv = new ModelAndView(Const.RESULT);
		if(null != file && file.getSize() > 0){
			String originName = file.getOriginalFilename();
			String ext = originName.substring(originName.indexOf("."));
			String targetFileName = StringUtil.getUUID()+ext;
			try {
				file.transferTo(new File(URL + "/" + targetFileName));
				competition.setAttachmentUrl(targetFileName);
			} catch (Exception e) {
				LOG.error("文件上传异常",e);
			} 
			
		}
		competitionDao.update(competition);
		mv.addObject(Const.RESULT, "竞赛项目更新成功!");
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
		ModelAndView mv = new ModelAndView(Const.RESULT);
		competitionDao.batchDelete(ids);
		mv.addObject(Const.RESULT, "竞赛项目批量删除成功!");
		mv.addObject(Const.RETURN_URL, "querySelfByPage");
		return mv;
	}
	
	
}
