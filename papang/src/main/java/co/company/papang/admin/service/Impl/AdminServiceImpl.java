package co.company.papang.admin.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.admin.service.AdminService;
import co.company.papang.impl.JyMapper;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.NqVO;
import co.company.papang.vo.SitterVO;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	JyMapper jyMapper;
	
	@Override
	public int insertNq(NqVO nqVO) {
		// TODO Auto-generated method stub
		return jyMapper.insertNq(nqVO);
	}

	@Override
	public List<NqVO> getListNq(NqVO nqVO) {
		// TODO Auto-generated method stub
		return jyMapper.getListNq(nqVO);
	}

	@Override
	public NqVO getNq(NqVO nqVO) {
		// TODO Auto-generated method stub
		return jyMapper.getNq(nqVO);
	}

	@Override
	public int updateNq(NqVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.updateNq(vo);
	}

	@Override
	public int deleteNq(NqVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.deleteNq(vo);
	}

	@Override
	public List<MemberVO> getListMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.getListMember(vo);
	}

	@Override
	public int updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.updateMember(vo);
	}

	@Override
	public int insertSitter(SitterVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}


	
}
