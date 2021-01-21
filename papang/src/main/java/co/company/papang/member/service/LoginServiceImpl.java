package co.company.papang.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.impl.EsMapper;
import co.company.papang.vo.AdminVO;
import co.company.papang.vo.MemberVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired EsMapper dao;

	@Override
	public int kakaoCheck(String kid) {
		return dao.kakaoCheck(kid);
	}

	@Override
	public MemberVO login(MemberVO member) {
		return dao.login(member);
	}

	@Override
	public AdminVO adminLogin(AdminVO admin) {
		return dao.adminLogin(admin);
	}


}
