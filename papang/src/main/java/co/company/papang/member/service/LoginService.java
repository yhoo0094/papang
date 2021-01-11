package co.company.papang.member.service;

import co.company.papang.vo.AdminVO;
import co.company.papang.vo.MemberVO;

public interface LoginService {
	public String loginCheck(MemberVO member); // 로그인 체크
	//public int loginChk(MemberVO member); // 유효아이디 체크
	public String adminLoginCheck(AdminVO admin); // 관리자로그인 체크
	public int kakaoCheck(String kid); // 카톡아이디 체크
}
