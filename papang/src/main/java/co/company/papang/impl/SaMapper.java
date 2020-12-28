package co.company.papang.impl;

import java.util.List;

import co.company.papang.vo.ChildVO;
import co.company.papang.vo.PreventionVO;

public interface SaMapper {

	public int insertPreven(PreventionVO preventionVO);
	
	//내자녀 조회
	public List<ChildVO> selectChild(ChildVO childVO);
	
}

