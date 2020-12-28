package co.company.papang.prevention.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.company.papang.vo.ChildVO;
import co.company.papang.vo.PreventionVO;

public interface VaccinationService  {

	public int insertPreven(PreventionVO preventionVO);
	
	//내자녀 조회
	public List<ChildVO> selectChild(ChildVO childVO);
}
