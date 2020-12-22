package co.company.papang.impl;

import java.util.List;
import java.util.Map;

import co.company.papang.vo.NqVO;

public interface JyMapper {
	public int insertNq(NqVO nqVO);
	public List<NqVO> getListNq(NqVO nqVO);
	public NqVO getNq(NqVO nqVO);
	
}

