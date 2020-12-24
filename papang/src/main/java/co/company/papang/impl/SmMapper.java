package co.company.papang.impl;

import java.util.List;

import co.company.papang.vo.CommunityVO;

public interface SmMapper {
	public int communityFormInsert(CommunityVO communityVO);
	public List<CommunityVO> getCommunityList(CommunityVO CommunityVO);
	public CommunityVO getCommunity(CommunityVO CommunityVO);
}

