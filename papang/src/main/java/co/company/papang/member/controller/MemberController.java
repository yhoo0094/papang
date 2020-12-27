package co.company.papang.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.impl.EsMapper;
import co.company.papang.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired EsMapper dao;
	
	// 회원가입 폼 버전1.. 일단 여기에 기능 몰빵해둠~~ 몰겠어 디자인적으로.. ㅎㅎ
	@RequestMapping("/member") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/joinForm"); //jsp주소
	}
	// 회원가입 폼 2
	@RequestMapping("/joinForm") //url 예전 .do
	public ModelAndView test2(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/joinFormDiv"); //jsp주소
	}
	// 회원가입 폼 3
	@RequestMapping("/joinBoot") //url 예전 .do
	public ModelAndView test3(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/joinFormBoot"); //jsp주소
	}
	// 회원가입 처리
	@PostMapping("/join")
	public String join(HttpServletRequest request, MemberVO member) throws IOException {
		dao.insertUser(member);
		return "main/main";
	}
	
	// 로그인 폼
	@RequestMapping("/loginForm") //url 예전 .do
	public ModelAndView test4(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/loginForm"); //jsp주소
	}
	// 로그인처리
	@PostMapping("/login") // post 요청은 로그인 처리
	public String login(HttpSession session, MemberVO vo) {
		// 세션에 담기
		session.setAttribute("mbr_id", vo.getMbr_id());
		session.setAttribute("mbr_author", vo.getMbr_author());
		return "main/main"; // 메인으로 이동
	}
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 세션 무효화
		session.invalidate(); // 로그아웃처리
		return "main/main";
	}
	
	// 아이디찾기로 이동
	@RequestMapping("/member/findIdForm") //url 예전 .do
	public ModelAndView test5(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/findId"); //jsp주소
	}
	// 비번찾기로 이동
	@RequestMapping("/member/findPwForm") //url 예전 .do
	public ModelAndView test6(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/findPw"); //jsp주소
	}
}
