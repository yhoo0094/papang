package co.company.papang.impl;

import java.util.List;

import co.company.papang.vo.ChildVO;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.NqVO;
import co.company.papang.vo.SitterVOChk;
import co.company.papang.vo.Sitter_comVO;
import co.company.papang.vo.Sitter_revChkVO;
import co.company.papang.vo.Sitter_revVO;

public interface SmMapper {
	//커뮤니티 게시판
	public List<CommunityVO> getCommunityList(CommunityVO CommunityVO); //전체조회
	public List<NqVO> getNoticeList(); //공지사항 전체조회
	public CommunityVO getCommunity(CommunityVO CommunityVO); //단건조회
	public int communityFormInsert(CommunityVO communityVO); //인서트
	public int communityFormUpdate(CommunityVO communityVO); //업데이트
	public int communityFormDelete(CommunityVO communityVO); //삭제
	public int hitPlus(CommunityVO CommunityVO); //조회수
	
	//커뮤니티 댓글
	public List<Community_comVO> getCommunityComList(Community_comVO community_comVO);//전체조회
	public int communityCommentInsert(Community_comVO community_comVO);//인서트
	
	//시터 보드
	public List<SitterVOChk> getSitterList(SitterVOChk sitterVOChk);//전체조회
	public SitterVOChk getSitter(SitterVOChk sitterVOChk); //단건조회
	public List<ChildVO> getChildList(ChildVO childVO); //아이 전체조회
	
	//시터 서비스
	public List<Sitter_revChkVO> getReservationList(Sitter_revChkVO sitter_revChkVO); //예약 현황 조회하기
	public String selectReservationKey(); //예약 번호 구하기
	public int insertReservation(Sitter_revVO sitter_revVO); //예약 인서트
	public int deleteReservation(Sitter_revChkVO sitter_revChkVO); //딜리트
	public int updateReservationStatus(Sitter_revChkVO sitter_revChkVO); //예약 업데이트(결제여부)
	
	//시터 서비스 후기
	public int insertReview(Sitter_comVO sitter_comVO); //후기 인서트
}

