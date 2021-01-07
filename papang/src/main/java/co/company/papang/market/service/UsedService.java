package co.company.papang.market.service;

import java.util.List;

import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.UsedVO;

public interface UsedService {

	// 중고장터
	public List<UsedVO> getUsedList(UsedVO used);//전체조회
	public UsedVO getUsed(UsedVO used);
	public int insertUsed(UsedVO used);
	public int hitPlus(UsedVO used); //조회수
	
}

