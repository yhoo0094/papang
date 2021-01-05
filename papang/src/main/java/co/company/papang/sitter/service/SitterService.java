package co.company.papang.sitter.service;

import java.util.List;

import co.company.papang.vo.ChildVO;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.SitterVOChk;

public interface SitterService {
	//시터 보드
	public List<SitterVOChk> getSitterList(SitterVOChk sitterVOChk);//전체조회
	public SitterVOChk getSitter(SitterVOChk sitterVOChk); //단건조회
	public List<ChildVO> getChildList(ChildVO childVO); //아이 전체조회
}
