package co.company.papang.member.service;

import co.company.papang.vo.AdminVO;
import co.company.papang.vo.MemberVO;

public interface LoginService {
	public MemberVO login(MemberVO member); // 로그인
	public AdminVO adminLogin(AdminVO admin); // 관리자로그인
	public int kakaoCheck(String kid); // 카톡아이디 체크
}
