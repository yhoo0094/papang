package co.company.papang.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.vo.MemberVO;

@Controller
public class MemberController {
	// 회원가입 폼 버전1
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
	public String join(HttpServletRequest request, MemberVO member) {
		return "";
	}
	
	// 로그인 폼
	@RequestMapping("/loginForm") //url 예전 .do
	public ModelAndView test4(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/loginForm"); //jsp주소
	}
	// 로그인처리
	@PostMapping("/login") // post 요청은 로그인 처리
	public String login(HttpSession session) {
		// 세션에 담기
		session.setAttribute("mbr_id", "${mbr_id}"); // 젠장 몰겠다
		return "/"; // 메인으로 이동
	}
	
	// 아이디찾기로 이동
	@RequestMapping("/member/findId") //url 예전 .do
	public ModelAndView test5(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/findId"); //jsp주소
	}
	// 비번찾기로 이동
	@RequestMapping("/member/findPw") //url 예전 .do
	public ModelAndView test6(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/findPw"); //jsp주소
	}
}
