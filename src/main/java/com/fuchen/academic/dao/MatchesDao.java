package com.fuchen.academic.dao;

import java.util.List;
import java.util.Map;

import com.fuchen.academic.domain.Matches;

public interface MatchesDao extends BaseDao<Matches> {
	
	public Matches queryByUC(Map<String,Object> params);
	
	public List<Matches> queryByCompetition(Map<String,Object> params);
	
	/**
	 * 查询出用户已经报名但尚未开始的比赛
	 * @param params
	 * @return
	 */
	public List<Matches> queryByUserEnroll(Map<String,Object> params);
	
	/**
	 * 查询出正在进行中的比赛
	 * @param params
	 * @return
	 */
	public List<Matches> queryByUserJoin(Map<String,Object> params);
	
	/**
	 * 查询出用户报名且已经结束的比赛
	 * @param params
	 * @return
	 */
	public List<Matches> queryByUserHistory(Map<String,Object> params);
}
