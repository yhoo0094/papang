package co.company.papang.community.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.community.service.CommunityService;
import co.company.papang.impl.SmMapper;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;

@Controller
public class CommunityController {
	@Autowired CommunityService service;
	
	/*-------------------------- 커뮤니티 --------------------------*/
	@RequestMapping("/community/board") //커뮤니티 게시판 보기
	public ModelAndView communityBoard(CommunityVO communityVO) throws IOException{
		ModelAndView mav = new ModelAndView();
		mav.addObject("CommunityVOList", service.getCommunityList(communityVO));
		mav.setViewName("community/communityBoard");
		return mav; //jsp주소
	}
	
	@RequestMapping("/community/form") //커뮤니티 글쓰러 가기
	public String communityForm(Model model, HttpServletRequest request, HttpServletResponse response, CommunityVO communityVO, Community_comVO community_comVO) throws IOException{
		if(communityVO.getCom_no() != null) {
			//조회수 작업
			boolean existCookie = false;
			Cookie[] cookieList = request.getCookies();
			for(Cookie co : cookieList) {
				if(co.getValue().equals(communityVO.getCom_no())) {
					existCookie = true;
				}
			}
			//쿠키생성
			if(!existCookie) {
				//쿠키가 없는 경우
				System.out.println("쿠키생성");
				Cookie cookie = new Cookie("cookieCode", communityVO.getCom_no());
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
				service.hitPlus(communityVO);
			}
			//조회수 작업 끝
			
			model.addAttribute("communityVO",service.getCommunity(communityVO));
			model.addAttribute("community_comVOList",service.getCommunityComList(community_comVO));
		}
		return "community/communityForm"; //jsp주소
	}
	
	@RequestMapping("/community/formInsert") //커뮤니티 글 인서트
	public String communityFormInsert(CommunityVO communityVO, Errors errors ) throws IOException{
		communityVO.setMbr_id("tempt");
		service.communityFormInsert(communityVO);
		return "redirect:/community/board"; //jsp주소
	}
	
	/*-------------------------- 시터 --------------------------*/
	@RequestMapping("/sitter/menu") //url 예전 .do
	public String sitterMenu() throws IOException{
		return "layout/sitterMenu"; //jsp주소
	}
	
	@RequestMapping("/sitter/board") //url 예전 .do
	public String sitterBoard() throws IOException{
		return "sitter/sitterBoard"; //jsp주소
	}
	
	@RequestMapping("/sitter/form") //url 예전 .do
	public String sitterForm() throws IOException{
		return "sitter/sitterForm"; //jsp주소
	}
	
	@RequestMapping("/sitter/scheduleView") //url 예전 .do
	public String sitterScheduleView() throws IOException{
		return "sitter/sitterScheduleView"; //jsp주소
	}
	
	@RequestMapping("/sitter/reservationView") //url 예전 .do
	public String reservationView() throws IOException{
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

}
