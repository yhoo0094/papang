package co.company.papang.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	@Autowired MemberRegService reg_service;
	@Autowired LoginService log_service;

	// 회원가입 폼 버전1.. 일단 여기에 기능 몰빵해둠~~ 몰겠어 디자인적으로.. ㅎㅎ
	@RequestMapping("/member/joinForm") // url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException {
		return new ModelAndView("member/joinForm"); // jsp주소
	}

	// 회원가입 폼 2
	@RequestMapping("/member/DivForm") // url 예전 .do
	public ModelAndView test2(HttpServletResponse response) throws IOException {
		return new ModelAndView("member/joinFormDiv"); // jsp주소
	}

	// 회원가입 폼 3
	@RequestMapping("/member/BootForm") // url 예전 .do
	public ModelAndView test3(HttpServletResponse response) throws IOException {
		return new ModelAndView("member/joinFormBoot"); // jsp주소
	}

	// 아이디중복체크
	@RequestMapping(value = "/ajax/idchk", method = RequestMethod.GET) // url 예전 .do
	@ResponseBody
	public int idChk(@RequestParam("mbr_id") String mbr_id) throws IOException {
		return reg_service.mbrIdCheck(mbr_id); // jsp주소
	}

	// 닉 중복체크
	@RequestMapping(value = "/ajax/nkchk", method = RequestMethod.GET) // url 예전 .do
	@ResponseBody
	public int nkChk(@RequestParam("mbr_nick") String mbr_nick) throws IOException {
		return reg_service.mbrNkCheck(mbr_nick); // jsp주소
	}

	// 회원가입 처리
	@PostMapping("/member/join")
	public String join(HttpServletRequest request, MemberVO member) throws IOException {
		reg_service.insertUser(member);
		return "main/main";
	}

	// 로그인 폼
	@RequestMapping("/member/loginForm") // url 예전 .do
	public ModelAndView test4(HttpServletResponse response) throws IOException {
		return new ModelAndView("member/loginForm"); // jsp주소
	}

//	// 로그인처리
//	@PostMapping("/member/login") // post 요청은 로그인 처리
//	public String login(HttpSession session, MemberVO vo) {
//		String rs = "";
//		// 기존 세션값 삭제
//		if (session.getAttribute("login") != null) {
//			session.removeAttribute("login");
//		}
//		// 로그인 성공시 반환하는 객체
//		MemberVO mvo = log_service.getMember(MemberVO);
//		
//		if (mvo != null) {
//			session.setAttribute("login", mvo);
//			 rs = "main/main"; // 메인으로 이동
//		} else { // 로그인실패
//			
//			rs = "redirect:/member/login";
//		}
//		return rs;
//	}
	// 로그인처리
	@PostMapping("/member/login") // post 요청은 로그인 처리
	public String login(@ModelAttribute("member") MemberVO member, HttpSession session, Model model,
			HttpServletResponse response) {
		String rs = "";
		String chkPw = log_service.loginCheck(member);
		response.setContentType("text/html; charset=UTF-8");
		if (chkPw.equals(member.getMbr_pw())) {
			session.setAttribute("user", member); // 회원가입 한 회원의 정보들은 user 라는 이름으로 세션에 담는다
			try {
				
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인되었습니다');</script>");
				out.println("<script>location.href='/papang/';</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			rs = "/";
		} else {
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인 실패');</script>");
				out.println("<script>location.href='/papang/member/loginForm';</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			rs = "/member/loginForm";
		}
		return null;//"redirect:"+rs;
	}

	// 로그아웃
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		// 세션 무효화
		session.invalidate(); // 로그아웃처리
		//return "main/main";
		return "redirect:/";
	}

	// 아이디찾기로 이동
	@RequestMapping("/member/findIdForm") // url 예전 .do
	public ModelAndView test5(HttpServletResponse response) throws IOException {
		return new ModelAndView("member/findId"); // jsp주소
	}

	// 비번찾기로 이동
	@RequestMapping("/member/findPwForm") // url 예전 .do
	public ModelAndView test6(HttpServletResponse response) throws IOException {
		return new ModelAndView("member/findPw"); // jsp주소
	}
	
// 소셜로그인
	@RequestMapping("/loginCallback")
	public String callback() {
		return "";
	}
}
