package co.company.papang.impl;

import java.util.List;

import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;

public interface SmMapper {
	//커뮤니티 게시판
	public List<CommunityVO> getCommunityList(CommunityVO CommunityVO); //전체조회
	public CommunityVO getCommunity(CommunityVO CommunityVO); //단건조회
	public int communityFormInsert(CommunityVO communityVO); //인서트
	public int communityFormUpdate(CommunityVO communityVO); //업데이트
	public int communityFormDelete(CommunityVO communityVO); //삭제
	public int hitPlus(CommunityVO CommunityVO); //조회수
	
	//커뮤니티 댓글
	public List<Community_comVO> getCommunityComList(Community_comVO community_comVO);
	public int communityCommentInsert(Community_comVO community_comVO);
}

