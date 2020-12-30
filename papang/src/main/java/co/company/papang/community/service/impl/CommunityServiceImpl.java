package co.company.papang.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.community.service.CommunityService;
import co.company.papang.impl.SmMapper;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired SmMapper dao;

	@Override
	public int communityFormInsert(CommunityVO communityVO) {
		return dao.communityFormInsert(communityVO);
	}

	@Override
	public List<CommunityVO> getCommunityList(CommunityVO CommunityVO) {
		return dao.getCommunityList(CommunityVO);
	}

	@Override
	public CommunityVO getCommunity(CommunityVO CommunityVO) {
		return dao.getCommunity(CommunityVO);
	}

	@Override
	public List<Community_comVO> getCommunityComList(Community_comVO community_comVO) {
		return dao.getCommunityComList(community_comVO);
	}

	@Override
	public int communityCommentInsert(Community_comVO community_comVO) {
		return dao.communityCommentInsert(community_comVO);
	}
	
	
}
