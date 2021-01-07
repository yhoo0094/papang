package co.company.papang.impl;



import java.util.List;

import co.company.papang.vo.ChildVO;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.Od_detailVO;
import co.company.papang.vo.Order_infoVO;
import co.company.papang.vo.Pro_OdVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.ReportVO;
import co.company.papang.vo.SitterVO;



public interface YrMapper {


	//내정보관리 회원수정	
	public MemberVO getMemberVO(MemberVO member); //수정 전 조회
	public void updateMemberVO(MemberVO member); //회원정보 수정
	public void notjoinMemberVO(MemberVO member);  //회원탈퇴              
	public List<ChildVO> babyinfoChildVO(ChildVO childVO); //아기정보좋;
	public List<ChildVO> babyinfodeleteChildVO(ChildVO childVO); //아기정보삭제;
	public void babyinfoinsertChildVO(ChildVO childVO);  //아기정보추가
	
	
	
	//장터부터 하겠습니다.
	public List<Order_infoVO> market_buyinfoOrder_infoVO(Order_infoVO order_infoVO);//구매조회1
	//public List<Od_detailVO> market_buyinfoOrder_info2VO(Od_detailVO od_detailVO); //구매조회2
	public List<Pro_OdVO> market_buyinfoOrder_info2VO(Pro_OdVO pro_OdVO); //구매조회3 상품;
	//게시물부터한다
	public List<CommunityVO> myboard_questionCommunityVO(CommunityVO community); //질문보기
	public List<Community_comVO> myboard_answerCommunity_comVO(Community_comVO community_comVO); //질문보기
	public List<ReportVO> myboard_policeReportVO(ReportVO reportVO); //신고현황보기
	
	

	//시터정보부터 한다
	public SitterVO sitter_infoSitterVO(SitterVO sitter); //시터 정보조회
	public void updateSitterVO(SitterVO sitter); //시터정보수정
	
	
}

