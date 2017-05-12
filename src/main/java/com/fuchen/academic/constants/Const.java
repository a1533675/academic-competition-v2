package com.fuchen.academic.constants;

public interface Const {

	String USERS_PARTICIPANT = "参赛者";
	
	String USERS_PUBLISHER = "发布者";
	
	String USERS_ADMINISTRATOR = "管理员";
	
	String USERS_SCHOOL_LEADER = "校领导";
	
	String CURRENT_USER = "curUser";
	
	String BG_RESULT = "background/result";
	
	String FRONT_RESULT = "front/result";
	
	String RESULT = "result";
	
	/**
	 * 导航
	 */
	String NAVS = "navs";
	
	String PAGINATION = "pagination";
	
	String LIST = "list";
	
	String RETURN_URL = "returnUrl";
	
	/**
	 * 审核步骤
	 */
	//开始
	Integer CHECK_STEP_INIT = 0;
	//一级
	Integer CHECK_STEP_FIRST = 1;
	//二级
	Integer CHECK_STEP_SECOND = 2;
	//三级
	Integer CHECK_STEP_THIRD = 3;
	//拒绝
	Integer CHECK_STEP_REJECT = -1;
	
	
}
