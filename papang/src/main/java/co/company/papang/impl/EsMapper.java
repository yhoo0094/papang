package co.company.papang.impl;

import java.util.List;

import co.company.papang.vo.ProductVO;
import co.company.papang.vo.UsedVO;

public interface EsMapper {
	
	// 판매상품
	
	public ProductVO getItem(ProductVO product);
	
	// 중고장터
	public List<UsedVO> getUsedList(UsedVO used);//전체조회
	public UsedVO getUsed(UsedVO used);
	public int insertUsed(UsedVO used);
	
}

