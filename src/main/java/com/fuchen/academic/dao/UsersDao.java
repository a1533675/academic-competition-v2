package com.fuchen.academic.dao;

import com.fuchen.academic.domain.Users;

public interface UsersDao extends BaseDao<Users>{

	/**
	 * 用户验证
	 * @param users
	 * @return
	 */
	Users validate(Users users);
	
	/**
	 * 更新密码
	 * @param users
	 */
	void passwd(Users users);
	
}
