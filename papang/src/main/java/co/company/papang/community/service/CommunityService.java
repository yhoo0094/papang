package co.company.papang.community.service;

import java.util.List;

import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.NqVO;
import co.company.papang.vo.SitterVOChk;

public interface CommunityService {
	//커뮤니티 게시판
	public List<CommunityVO> getCommunityList(CommunityVO communityVO); //전체조회
	public CommunityVO getCommunity(CommunityVO communityVO); //단건조회
	public int communityFormInsert(CommunityVO communityVO); //인서트
	public int communityFormUpdate(CommunityVO communityVO); //업데이트
	public int communityFormDelete(CommunityVO communityVO); //삭제
	public int hitPlus(CommunityVO communityVO); //조회수
	
	//공지사항
	public List<NqVO> getNoticeList(); //전체조회
	public NqVO getNotice(NqVO nqVO); //단건조회
	public int noticeHitPlus(NqVO nqVO); //조회수 증가
	
	//커뮤니티 댓글
	public List<Community_comVO> getCommunityComList(Community_comVO community_comVO);//전체조회
	public int communityCommentInsert(Community_comVO community_comVO);//인서트
	public int commentDelete(Community_comVO community_comVO);//딜리트
	
	//시터 보드
	public List<SitterVOChk> getSitterList(SitterVOChk sitterVOChk);//전체조회
}
