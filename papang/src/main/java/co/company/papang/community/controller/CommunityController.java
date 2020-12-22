package co.company.papang.community.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommunityController {
	/*-------------------------- 커뮤니티 --------------------------*/
	@RequestMapping("/communityBoard") //url 예전 .do
	public ModelAndView communityBoard(HttpServletResponse response) throws IOException{
		return new ModelAndView("community/communityBoard"); //jsp주소
	}
	
	@RequestMapping("/communityForm") //url 예전 .do
	public ModelAndView communityForm(HttpServletResponse response) throws IOException{
		return new ModelAndView("community/communityForm"); //jsp주소
	}
	
	/*-------------------------- 시터 --------------------------*/
	@RequestMapping("/sitterMenu") //url 예전 .do
	public ModelAndView sitterMenu(HttpServletResponse response) throws IOException{
		return new ModelAndView("layout/sitterMenu"); //jsp주소
	}
	
	@RequestMapping("/sitterBoard") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("sitter/sitterBoard"); //jsp주소
	}
	
	@RequestMapping("/sitterForm") //url 예전 .do
	public ModelAndView sitterForm(HttpServletResponse response) throws IOException{
		return new ModelAndView("sitter/sitterForm"); //jsp주소
	}
	
	/*-------------------------- 기타 --------------------------*/
	@RequestMapping(value="/normalBoard")
	public String normalBoard() {
		return "normal/normalBoard";
	}
	
	@RequestMapping(value="/normalBoard2")
	public String normalBoard2() {
		return "normal/normalBoard2";
	}
	
	@RequestMapping(value="/calender")
	public String calender() {
		return "normal/calender";
	}
	
	@RequestMapping(value="/test")
	public String test() {
		return "normal/test";
	}	
}
