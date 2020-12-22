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
	@RequestMapping("marketList/itemBoard") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("marketList/itemBoard"); //jsp주소
	}
	// 판매상품 전체 리스트
	@RequestMapping("marketList/itemList") //url 예전 .do
	public ModelAndView markettest(HttpServletResponse response) throws IOException{
		return new ModelAndView("marketList/itemList"); //jsp주소
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
	@RequestMapping("marketList/usedBoard") //url 예전 .do
	public ModelAndView test3(HttpServletResponse response) throws IOException{
		return new ModelAndView("marketList/usedBoard"); //jsp주소
	}
	// 중고게시판 상세
	@RequestMapping("market/usedDetail") //url 예전 .do
	public ModelAndView test4(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/usedDetail"); //jsp주소
	}
	// 중고게시판 등록
	@RequestMapping("market/usedInsert") //url 예전 .do
	public ModelAndView test10(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/usedInsert"); //jsp주소
	}
	// 중고게시판 등록 폼
	@RequestMapping("market/usedInsertForm") //url 예전 .do
	public ModelAndView test7(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/usedInsertForm"); //jsp주소
	}
	// 중고게시판 수정 폼
	@RequestMapping("market/usedUpdateForm") //url 예전 .do
	public ModelAndView test8(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/usedUpdateForm"); //jsp주소
	}
	// 장바구니
	@RequestMapping("marketList/cart") //url 예전 .do
	public ModelAndView test11(HttpServletResponse response) throws IOException{
		return new ModelAndView("marketList/cart"); //jsp주소
	}
}
