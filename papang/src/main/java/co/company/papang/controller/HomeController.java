package co.company.papang.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.admin.service.AdminService;
import co.company.papang.impl.SaMapper;
import co.company.papang.vo.BannerVO;
import co.company.papang.vo.ProductVO;

@Controller
public class HomeController {
	@Autowired
	AdminService service;
	@Autowired
	SaMapper mainService; //상품select 용 mapper
	
	@RequestMapping(value="/")
	public ModelAndView test(HttpServletResponse response, BannerVO bannervo,HttpSession session, ProductVO productVO) throws IOException{
		ModelAndView mav = new ModelAndView();
		
		bannervo.setBan_pic_status("표시");
		mav.addObject("bannerlist",service.getbannerlist(bannervo));
		mav.addObject("products",mainService.productList(productVO));
		
		session.setAttribute("bannerlist",service.getbannerlist(bannervo));
		
		mav.setViewName("main/main");
		return mav;
	}
	
}
