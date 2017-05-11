package com.fuchen.academic.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao<T> {

	/**
	 * 新增
	 */
	void add(T t);
	
	/**
	 * 删除
	 */
	void deleteById(String id);
	
	/**
	 * 批量删除
	 * @param ids
	 */
	void batchDelete(String[] ids);
	
	/**
	 * 修改
	 */
	void update(T t);
	
	/**
	 *	查询
	 */
	List<T> queryAll();
	
	/**
	 * 分页查询
	 * @param page
	 * @return
	 */
	List<T> queryByPage(Map<String,Object> params);
	
	/**
	 * 总数
	 * @return
	 */
	Integer count(Map<String,Object> params);
	
	/**
	 * 根据ID查询
	 * @param id
	 * @return
	 */
	T queryById(String id);
}
