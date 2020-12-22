package co.company.papang.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	// 회원가입 버전1
	@RequestMapping("/member") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/joinForm"); //jsp주소
	}
	// 회원가입 2
	@RequestMapping("/joinForm") //url 예전 .do
	public ModelAndView test2(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/joinFormDiv"); //jsp주소
	}
	// 회원가입 3
	@RequestMapping("/joinBoot") //url 예전 .do
	public ModelAndView test3(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/joinFormBoot"); //jsp주소
	}
	// 로그인
	@RequestMapping("/loginForm") //url 예전 .do
	public ModelAndView test4(HttpServletResponse response) throws IOException{
		return new ModelAndView("member/loginForm"); //jsp주소
	}
}
