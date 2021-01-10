package co.company.papang.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.community.service.CommunityService;
import co.company.papang.impl.SmMapper;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.NqVO;
import co.company.papang.vo.SitterVOChk;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired SmMapper dao;

	@Override
	public int communityFormInsert(CommunityVO communityVO) {
		return dao.communityFormInsert(communityVO);
	}

	@Override
	public List<CommunityVO> getCommunityList(CommunityVO communityVO) {
		return dao.getCommunityList(communityVO);
	}

	@Override
	public CommunityVO getCommunity(CommunityVO communityVO) {
		return dao.getCommunity(communityVO);
	}

	@Override
	public List<Community_comVO> getCommunityComList(Community_comVO community_comVO) {
		return dao.getCommunityComList(community_comVO);
	}

	@Override
	public int communityCommentInsert(Community_comVO community_comVO) {
		return dao.communityCommentInsert(community_comVO);
	}

	@Override
	public int hitPlus(CommunityVO communityVO) {
		return dao.hitPlus(communityVO);
	}

	@Override
	public int communityFormUpdate(CommunityVO communityVO) {
		return dao.communityFormUpdate(communityVO);
	}

	@Override
	public int communityFormDelete(CommunityVO communityVO) {
		return dao.communityFormDelete(communityVO);
	}

	@Override
	public List<SitterVOChk> getSitterList(SitterVOChk sitterVOChk) {
		return dao.getSitterList(sitterVOChk);
	}

	@Override
	public List<NqVO> getNoticeList() {
		return dao.getNoticeList();
	}
	
	
}
