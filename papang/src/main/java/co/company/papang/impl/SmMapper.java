package co.company.papang.impl;

import java.util.List;

import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;

public interface SmMapper {
	//커뮤니티 게시판
	public int communityFormInsert(CommunityVO communityVO);
	public List<CommunityVO> getCommunityList(CommunityVO CommunityVO);
	public CommunityVO getCommunity(CommunityVO CommunityVO);
	
	//커뮤니티 댓글
	public List<Community_comVO> getCommunityComList(Community_comVO community_comVO);
	public int communityCommentInsert(Community_comVO community_comVO);
}

