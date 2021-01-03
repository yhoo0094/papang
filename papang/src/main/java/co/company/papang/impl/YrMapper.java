package co.company.papang.impl;



import java.util.List;

import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.SitterVO;



public interface YrMapper {


	//내정보관리 회원수정	
	public MemberVO getMemberVO(MemberVO member); //수정 전 조회
	public void updateMemberVO(MemberVO member); //회원정보 수정
	public void notjoinMemberVO(MemberVO member);  //회원탈퇴                                          
	
	
	
	//게시물부터한다
	
	public List<CommunityVO> myboard_questionCommunityVO(CommunityVO community); //질문보기
	public List<Community_comVO> myboard_answerCommunity_comVO(Community_comVO community_comVO); //질문보기

	//시터정보부터 한다
	public SitterVO sitter_infoSitterVO(SitterVO sitter); //시터 정보조회
	public void updateSitterVO(SitterVO sitter); //시터정보수정
	
	
}

