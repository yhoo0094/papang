package co.company.papang.community.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;

import co.company.papang.impl.SmMapper;
import co.company.papang.vo.CommunityVO;

@Controller
public class CommunityController {
	@Autowired SmMapper dao;
	
	/*-------------------------- 커뮤니티 --------------------------*/
	@RequestMapping("/communityBoard") //url 예전 .do
	public String communityBoard(HttpServletResponse response) throws IOException{
		return "community/communityBoard"; //jsp주소
	}
	
	@RequestMapping("/communityForm") //커뮤니티 글쓰러 가기
	public String communityForm(Model model, CommunityVO communityVO) throws IOException{
		return "community/communityForm"; //jsp주소
	}
	
	@RequestMapping("/communityFormInsert") //커뮤니티 글 인서트
	public String communityFormInsert(CommunityVO communityVO, Errors errors ) throws IOException{
		communityVO.setMbr_id("tempt");
		dao.communityFormInsert(communityVO);
		return "community/communityBoard"; //jsp주소
	}
	
	/*-------------------------- 시터 --------------------------*/
	@RequestMapping("/sitterMenu") //url 예전 .do
	public String sitterMenu(HttpServletResponse response) throws IOException{
		return "layout/sitterMenu"; //jsp주소
	}
	
	@RequestMapping("/sitterBoard") //url 예전 .do
	public String test(HttpServletResponse response) throws IOException{
		return "sitter/sitterBoard"; //jsp주소
	}
	
	@RequestMapping("/sitterForm") //url 예전 .do
	public String sitterForm(HttpServletResponse response) throws IOException{
		return "sitter/sitterForm"; //jsp주소
	}
	
	@RequestMapping("/sitterScheduleView") //url 예전 .do
	public String sitterScheduleView(HttpServletResponse response) throws IOException{
		return "sitter/sitterScheduleView"; //jsp주소
	}
	
	@RequestMapping("/reservationView") //url 예전 .do
	public String reservationView(HttpServletResponse response) throws IOException{
		return "sitter/reservationView"; //jsp주소
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
