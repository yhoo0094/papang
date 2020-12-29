package co.company.papang.impl;



import java.util.List;

import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.MemberVO;



public interface YrMapper {


	//내정보관리 회원수정	
	public MemberVO getMemberVO(MemberVO member); //수정 전 조회
	public void updateMemberVO(MemberVO member); //회웑어보 수정
	public void notjoinMemberVO(MemberVO member);  //회원탈퇴                                          //회원탈퇴
	
	
	
	//게시물부터한다
	
	public List<CommunityVO> myboard_questionCommunityVO(CommunityVO community); //질문보기
}

