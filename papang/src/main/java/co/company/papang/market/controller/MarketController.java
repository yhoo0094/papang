package co.company.papang.market.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MarketController {
	// 판매상품 전체 리스트
	@RequestMapping("/market") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/itemList_base"); //jsp주소
	}
	// 판매상품 상세
	@RequestMapping("/itemDetail") //url 예전 .do
	public ModelAndView test2(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/itemDetail"); //jsp주소
	}
	// 중고게시판 리스트
	@RequestMapping("/used") //url 예전 .do
	public ModelAndView test3(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/usedBord"); //jsp주소
	}
	// 중고게시판 상세
	@RequestMapping("/usedDetail") //url 예전 .do
	public ModelAndView test4(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/usedDetail"); //jsp주소
	}
}
