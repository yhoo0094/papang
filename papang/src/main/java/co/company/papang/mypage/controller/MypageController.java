package co.company.papang.mypage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {

	@RequestMapping("mypage/myhome") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/myhome"); //jsp주소
	}
	
	@RequestMapping("mypage/notjoin") //url 예전 .do
	public ModelAndView test2(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/notjoin"); //jsp주소
	}
	
	@RequestMapping("mypage/babyinfo") //url 예전 .do
	public ModelAndView test3(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/babyinfo"); //jsp주소
	}
	
}
