package co.company.papang.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.impl.EsMapper;
import co.company.papang.member.service.LoginService;
import co.company.papang.member.service.MemberRegService;
import co.company.papang.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired EsMapper dao;
	 // 나중에 서비스 나누면,,
	@Autowired MemberRegService reg_service;
	@Autowired LoginService login_service;
	
	// 회원가입 폼 버전1.. 일단 여기에 기능 몰빵해둠~~ 몰겠어 디자인적으로.. ㅎㅎ
	@RequestMapping("/member/joinForm") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/joinForm"); //jsp주소
	}
	// 회원가입 폼 2
	@RequestMapping("/member/DivForm") //url 예전 .do
	public ModelAndView test2(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/joinFormDiv"); //jsp주소
	}
	// 회원가입 폼 3
	@RequestMapping("/member/BootForm") //url 예전 .do
	public ModelAndView test3(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/joinFormBoot"); //jsp주소
	}
	// 아이디중복체크
	@RequestMapping(value = "/ajax/idchk", method = RequestMethod.GET) //url 예전 .do
	@ResponseBody
	public int idChk(@RequestParam("mbr_id") String mbr_id) throws IOException{
		return reg_service.mbrIdCheck(mbr_id); //jsp주소
	}
	// 닉 중복체크
	@RequestMapping(value = "/ajax/nkchk", method = RequestMethod.GET) //url 예전 .do
	@ResponseBody
	public int nkChk(@RequestParam("mbr_nick") String mbr_nick) throws IOException{
		return reg_service.mbrNkCheck(mbr_nick); //jsp주소
	}
	// 회원가입 처리
	@PostMapping("/member/join")
	public String join(HttpServletRequest request, MemberVO member) throws IOException {
		reg_service.insertUser(member);
		return "main/main";
	}
	
	// 로그인 폼
	@RequestMapping("/member/loginForm") //url 예전 .do
	public ModelAndView test4(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/loginForm"); //jsp주소
	}
	// 로그인처리
	@PostMapping("/ajax/login") // post 요청은 로그인 처리
	@ResponseBody
	public int login(HttpSession session, MemberVO mvo, HttpServletRequest request, HttpServletResponse response, Model model) {
		// 아이디 기억하기 값 가져오기
		String remember = request.getParameter("remember");
		
//		// 비밀번호 암호화
//		String mbr_pw = vo.getMbr_pw();
//		vo.setMbr_pw(UserSha256.encrypt(mbr_pw));
//		
//		// 암호화 확인
//		System.out.println("mbr_pw: " + vo.getMbr_pw());
		
		// 로그인
		int result = login_service.memberLogin_service(mvo, session, remember, response);
		// response : 쿠키에 값 저장하는 용
		
//		// 세션에 담기
//		session.setAttribute("mbr_id", vo.getMbr_id());
//		session.setAttribute("mbr_author", vo.getMbr_author());
//		return "main/main"; // 메인으로 이동
		return result;
	}

	// 로그아웃
	@GetMapping("/member/logout")
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
