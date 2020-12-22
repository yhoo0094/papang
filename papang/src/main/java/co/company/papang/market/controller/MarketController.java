package co.company.papang.market.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MarketController {
	// 판매상품 전체 리스트
	@RequestMapping("market/market") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/itemList_base"); //jsp주소
	}
	// 판매상품 전체 리스트
	@RequestMapping("market/marketTest") //url 예전 .do
	public ModelAndView markettest(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/itemList"); //jsp주소
	}
	// 판매상품 상세
	@RequestMapping("market/itemDetail") //url 예전 .do
	public ModelAndView test2(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/itemDetail"); //jsp주소
	}
	// 판매상품 등록
	@RequestMapping("market/itemInsert") //url 예전 .do
	public ModelAndView test9(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/itemInsert"); //jsp주소
	}
	// 판매상품 등록 폼
	@RequestMapping("market/itemInsertForm") //url 예전 .do
	public ModelAndView test5(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/itemInsertForm"); //jsp주소
	}
	// 판매상품 수정 폼
	@RequestMapping("market/itemUpdateForm") //url 예전 .do
	public ModelAndView test6(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/itemUpdateForm"); //jsp주소
	}
	// 중고게시판 리스트
	@RequestMapping("used/used") //url 예전 .do
	public ModelAndView test3(HttpServletResponse response) throws IOException{
		return new ModelAndView("usedItem/usedBoard"); //jsp주소
	}
	// 중고게시판 상세
	@RequestMapping("used/usedDetail") //url 예전 .do
	public ModelAndView test4(HttpServletResponse response) throws IOException{
		return new ModelAndView("usedItem/usedDetail"); //jsp주소
	}
	// 중고게시판 등록
	@RequestMapping("used/usedInsert") //url 예전 .do
	public ModelAndView test10(HttpServletResponse response) throws IOException{
		return new ModelAndView("usedItem/usedInsert"); //jsp주소
	}
	// 중고게시판 등록 폼
	@RequestMapping("used/usedInsertForm") //url 예전 .do
	public ModelAndView test7(HttpServletResponse response) throws IOException{
		return new ModelAndView("usedItem/usedInsertForm"); //jsp주소
	}
	// 중고게시판 수정 폼
	@RequestMapping("used/usedUpdateForm") //url 예전 .do
	public ModelAndView test8(HttpServletResponse response) throws IOException{
		return new ModelAndView("usedItem/usedUpdateForm"); //jsp주소
	}
}
