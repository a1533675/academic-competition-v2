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
import com.fuchen.academic.dao.AwardsNoticeDao;
import com.fuchen.academic.domain.AwardsNotice;

@Controller
@RequestMapping("/front/awards")
public class FrontAwardsNoticeController {
	
	@Autowired
	private AwardsNoticeDao awardsNoticeDao;
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
		
		Integer total = awardsNoticeDao.count(null);
		
		Pagination<AwardsNotice> pagination = new Pagination<AwardsNotice>(curPage, total);
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("start", (curPage-1)*pagination.getPageSize());
		params.put("pageSize", pagination.getPageSize());
		
		List<AwardsNotice> pageList = awardsNoticeDao.queryByPage(params);
		pagination.setItems(pageList);
		
		ModelAndView mv = new ModelAndView("awards-list");
		mv.addObject(Const.PAGINATION, pagination);
		
		return mv;
	}
	
}
