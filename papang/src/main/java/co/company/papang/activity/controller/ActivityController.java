package co.company.papang.activity.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.activity.service.ActivityService;
import co.company.papang.vo.Act_comVO;
import co.company.papang.vo.PlayVO;

@Controller
public class ActivityController {
	@Autowired ActivityService service;
	
	@RequestMapping("activity/cookList") 
	public ModelAndView cookList(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/cookList"); 
	}
	
	@RequestMapping("activity/cookForm")
	public ModelAndView cookForm(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/cookForm"); 
	}
	
	@RequestMapping("activity/cookView") 
	public ModelAndView cookView(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/cookView"); 
	}
	
	@RequestMapping("activity/test") 
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/test"); 
	}
	
	
	//놀이
	//1. 놀이 리스트 전체 조회/ 놀이 리스트 검색
	@RequestMapping("activity/playList") 
	public ModelAndView playList(HttpServletResponse response,PlayVO playVO) throws IOException{
		ModelAndView mav = new ModelAndView();
		mav.addObject("playlist",service.getPlayList(playVO));
		mav.setViewName("activity/playList");
		return mav; 
	}
	
	
	//놀이 단건 조회
	@RequestMapping("activity/playView") 
	public ModelAndView playView(HttpServletResponse response,PlayVO playVO,Act_comVO act_comVO) throws IOException{
		ModelAndView mav = new ModelAndView();
		mav.addObject(service.getPlay(playVO));
		act_comVO.setPc_no(playVO.getPlay_no());
		mav.addObject("actcommList", service.getActComm(act_comVO));
		mav.addObject("acrate",service.getStar(act_comVO));
		mav.setViewName("activity/playView");
		return mav;
	}
	
	//놀이 리스트 글 등록폼 가기
	@RequestMapping("activity/playForm") 
	public ModelAndView playForm(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/playForm"); 
	}

	
	@RequestMapping("activity/playtest") 
	public ModelAndView playtest(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/test");
	}

	
}
