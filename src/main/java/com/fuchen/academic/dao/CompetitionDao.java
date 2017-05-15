package com.fuchen.academic.dao;

import java.util.List;
import java.util.Map;

import com.fuchen.academic.domain.Competition;

public interface CompetitionDao extends BaseDao<Competition>{

	public List<Competition> queryCanJoinList(Map<String,Object> param);
	
}
