package co.company.papang.sitter.service;

import java.util.List;

import co.company.papang.vo.ChildVO;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.SitterVOChk;
import co.company.papang.vo.Sitter_comVO;
import co.company.papang.vo.Sitter_revChkVO;
import co.company.papang.vo.Sitter_revVO;

public interface SitterService {
	//시터 보드
	public List<SitterVOChk> getSitterList(SitterVOChk sitterVOChk);//전체조회
	public SitterVOChk getSitter(SitterVOChk sitterVOChk); //단건조회
	public List<ChildVO> getChildList(ChildVO childVO); //아이 전체조회
	
	//시터 서비스
	public List<Sitter_revChkVO> getReservationList(Sitter_revChkVO sitter_revChkVO); //예약 현황 조회하기
	public String selectReservationKey(); //예약 번호 구하기
	public int insertReservation(Sitter_revVO sitter_revVO);
	public int deleteReservation(Sitter_revChkVO sitter_revChkVO); //딜리트
	public int updateReservationStatus(Sitter_revChkVO Sitter_revChkVO); //예약 업데이트(결제여부)
	
	//시터 서비스 후기
	public Sitter_comVO getReview(Sitter_comVO sitter_comVO); //단건조회
	public int insertReview(Sitter_comVO sitter_comVO); //후기 인서트
	public int updateReview(Sitter_comVO sitter_comVO); //후기 업데이트
	public int deleteReview(Sitter_comVO sitter_comVO); //후기 딜리트
}
