package co.company.papang.prevention.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.impl.SaMapper;
import co.company.papang.prevention.service.VaccinationService;
import co.company.papang.vo.ChildVO;
import co.company.papang.vo.PreventionVO;

@Service
public class VaccinationServiceImpl implements VaccinationService {
	@Autowired SaMapper dao;

	@Override
	public int insertPreven(PreventionVO preventionVO) {
		return dao.insertPreven(preventionVO);

	}

	@Override
	public List<ChildVO> selectChild(ChildVO childVO) {
		// TODO Auto-generated method stub
		return dao.selectChild(childVO);
	}

	
	
	

}
