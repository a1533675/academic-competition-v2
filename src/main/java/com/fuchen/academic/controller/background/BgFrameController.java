package com.fuchen.academic.controller.background;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台框架控制器
 * @author yshin1992
 *
 */
@Controller
@RequestMapping("/manager")
public class BgFrameController {
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		return "background/index";
	}
	
	/**
	 * 框架头部
	 * @return
	 */
	@RequestMapping("/head")
	public String head(){
		return "background/head";
	}
	
	/**
	 * 框架尾部
	 * @return
	 */
	@RequestMapping("/tail")
	public String tail(){
		return "background/tail";
	}
	
	/**
	 * 框架菜单
	 * @return
	 */
	@RequestMapping("/menu")
	public String menu(){
		return "background/menu";
	}
	
	/**
	 * 框架主页
	 * @return
	 */
	@RequestMapping("/main")
	public String main(){
		return "background/main";
	}
}
