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

	@Override//아이 전제 조회
	public List<ChildVO> selectChild(ChildVO childVO) {
		return dao.selectChild(childVO);
	}

	@Override//예방접종 일지등록
	public int insertPrevent(PreventionVO preventionVO) {
		return dao.insertPrevent(preventionVO);
	}

	@Override
	public List<PreventionVO> getPreventList(PreventionVO preventionVO) {
		return dao.getPreventList(preventionVO);
	}


	

	
	
	

}
