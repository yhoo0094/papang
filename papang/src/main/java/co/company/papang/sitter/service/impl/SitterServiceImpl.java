package co.company.papang.sitter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.community.service.CommunityService;
import co.company.papang.impl.SmMapper;
import co.company.papang.sitter.service.SitterService;
import co.company.papang.vo.ChildVO;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.SitterVOChk;

@Service
public class SitterServiceImpl implements SitterService {
	@Autowired SmMapper dao;

	@Override
	public List<SitterVOChk> getSitterList(SitterVOChk sitterVOChk) {
		return dao.getSitterList(sitterVOChk);
	}

	@Override
	public SitterVOChk getSitter(SitterVOChk sitterVOChk) {
		return dao.getSitter(sitterVOChk);
	}

	@Override
	public List<ChildVO> getChildList(ChildVO childVO) {
		return dao.getChildList(childVO);
	}
	
}
