package com.fuchen.academic.controller.background;

import java.io.File;
import java.io.IOException;
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
import com.fuchen.academic.controller.NoticeController;
import com.fuchen.academic.dao.NoticeDao;
import com.fuchen.academic.domain.Notice;

@Controller
@RequestMapping("/manager/notice")
public class BgNoticeController {

private static final Logger LOG = Logger.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeDao noticeDao;
	
	private static final String URL = ResourcesUtil.getResourcesURL();
	
	/**
	 * 系统公告页面
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
		
		Integer total = noticeDao.count(condition);
		
		Pagination<Notice> pagination = new Pagination<Notice>(curPage, total);
		
		condition.put("start", (curPage-1)*pagination.getPageSize());
		condition.put("pageSize", pagination.getPageSize());
		
		List<Notice> pageList = noticeDao.queryByPage(condition);
		pagination.setItems(pageList);
		
		ModelAndView mv = new ModelAndView("background/notice-self-list");
		mv.addObject(Const.PAGINATION, pagination);
		
		return mv;
	}
	
	/**
	 * 跳转到新增页面
	 * @return
	 */
	@RequestMapping(value="/add",method={RequestMethod.GET})
	public String add(){
		return "background/notice-add";
	}
	
	/**
	 * 新增
	 * @param file
	 * @param competition
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/add",method={RequestMethod.POST})
	public ModelAndView add(@RequestParam("attachment") MultipartFile file, @ModelAttribute Notice notice){
		ModelAndView mv = new ModelAndView(Const.BG_RESULT);
		File dir = new File(URL);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		notice.setId(StringUtil.getUUID());
		if(null != file && file.getSize() > 0){
			String originName = file.getOriginalFilename();
			String ext = originName.substring(originName.indexOf("."));
			String targetFileName = StringUtil.getUUID()+ext;
			try {
				file.transferTo(new File(URL + "/" + targetFileName));
				notice.setAttachmentUrl(targetFileName);
			} catch (Exception e) {
				LOG.error("系统公告发布异常",e);
				mv.addObject(Const.RESULT, "系统公告发布异常!");
			} 
		}
		
		noticeDao.add(notice);
		mv.addObject(Const.NAVS,new String[]{"通知公告","系统公告"});
		mv.addObject(Const.RESULT, "系统公告发布成功!");
		mv.addObject(Const.RETURN_URL, "querySelfByPage");
		return mv;
	}
	
	/**
	 * 根据ID查询详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/detail")
	public ModelAndView queryById(String id){
		ModelAndView mv = new ModelAndView("background/notice-detail");
		if(StringUtil.isNotEmpty(id)){
			Notice notice = noticeDao.queryById(id);
			mv.addObject(Const.RESULT, notice);
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
		ModelAndView mv = new ModelAndView("background/notice-update");
		if(StringUtil.isNotEmpty(id)){
			Notice notice = noticeDao.queryById(id);
			mv.addObject(Const.RESULT, notice);
		}
		return mv;
	}
	
	/**
	 * 更新操作
	 * @param competition
	 * @return
	 */
	@RequestMapping(value="/update",method={RequestMethod.POST})
	public ModelAndView update(@ModelAttribute Notice notice){
		ModelAndView mv = new ModelAndView(Const.BG_RESULT);
		noticeDao.update(notice);
		mv.addObject(Const.NAVS,new String[]{"通知公告","系统公告"});
		mv.addObject(Const.RESULT, "系统公告更新成功!");
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
		noticeDao.batchDelete(ids);
		mv.addObject(Const.NAVS,new String[]{"通知公告","系统公告"});
		mv.addObject(Const.RESULT, "系统公告批量删除成功!");
		mv.addObject(Const.RETURN_URL, "querySelfByPage");
		return mv;
	}
}
