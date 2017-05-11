package com.fuchen.academic.dao;

import java.util.List;
import java.util.Map;

import com.fuchen.academic.domain.Matches;

public interface MatchesDao extends BaseDao<Matches> {
	
	public Matches queryByUC(Map<String,Object> params);
	
	public List<Matches> queryByCompetition(Map<String,Object> params);
}
