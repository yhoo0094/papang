package co.company.papang.market.service;

import java.util.List;

import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.UsedVO;

public interface UsedService {

	// 중고장터
	public List<UsedVO> getUsedList(UsedVO used);//전체조회
	public List<UsedVO> onSaleUsedList(UsedVO used);//판매중 조회
	public UsedVO getUsed(UsedVO used); // 단건조회
	public int insertUsed(UsedVO used); // 등록
	public int updateUsed(UsedVO used); // 수정
	public int deleteUsed(UsedVO used); // 삭제
	public int hitPlus(UsedVO used); //조회수
	
}

