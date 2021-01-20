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
	public String loginCheck(MemberVO member) {
		return dao.loginCheck(member);
	}
//	@Override
//	public int loginChk(MemberVO member) {
//		return dao.loginChk(member);
//	}

	@Override
	public AdminVO adminLoginCheck(AdminVO admin) {
		return dao.adminLoginCheck(admin);
	}

	@Override
	public int kakaoCheck(String kid) {
		return dao.kakaoCheck(kid);
	}


}
