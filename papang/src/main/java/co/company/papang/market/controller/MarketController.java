package co.company.papang.market.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.impl.EsMapper;
import co.company.papang.market.service.MarketService;
import co.company.papang.vo.ProductVO;

@Controller
public class MarketController {
	@Autowired EsMapper dao;
	@Autowired MarketService mk_service;

// 상품판매	
	// 판매상품 전체 리스트
	/*
	 * @RequestMapping("marketList/itemBoard") //url 예전 .do public ModelAndView
	 * test(HttpServletResponse response) throws IOException{ return new
	 * ModelAndView("marketList/itemBoard"); //jsp주소 }
	 */
	@RequestMapping("marketList/itemBoard") //url 예전 .do
	public ModelAndView test(ProductVO product) throws IOException{
		ModelAndView mav = new ModelAndView();
		mav.addObject("pro", dao.getItemList(product));
		mav.setViewName("marketList/itemBoard");
		return mav; //jsp주소
	}

	// 판매상품 상세
	@RequestMapping("market/itemDetail") //url 예전 .do
	public String getItem(ProductVO product, Model model) throws IOException{
		model.addAttribute("pro", mk_service.getItem(product));
		return "market/itemDetail"; //jsp주소
	}
//	@RequestMapping("market/itemDetail") //url 예전 .do
//	public ModelAndView test2(ProductVO product, HttpServletResponse response, HttpServletRequest request) throws IOException{
//		request.getParameter("pro_no");
//		ModelAndView mav = new ModelAndView();
//		//mav.addObject("pro", dao.getItem(product));
//		mav.setViewName("market/itemDetail");
//		return mav; //jsp주소
//	}
	
	// 판매상품 등록
	@RequestMapping("market/itemInsert") //url 예전 .do
	public String test9(ProductVO product) throws IOException{
		dao.insertItem(product);
//		return "marketList/itemBoard";
		return "redirect:/marketList/itemBoard"; //jsp주소
	}
	// 판매상품 등록 폼
	@RequestMapping("market/itemInsertForm") //url 예전 .do
	public ModelAndView test5(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/itemInsertForm"); //jsp주소
	}
	// 판매상품 수정
	@RequestMapping("market/itemUpdate") //url 예전 .do
	public String test6(HttpServletResponse response) throws IOException{
		return "redirect:/market/itemDetail"; //jsp주소
	}
	// 판매상품 수정 폼
	@RequestMapping("market/itemUpdateForm") //url 예전 .do
	public ModelAndView test12(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/itemUpdateForm"); //jsp주소
	}
	// 판매상품 삭제.. 이게 맞을려나...
	@RequestMapping("market/itemDelete") //url 예전 .do
	public String test14(ProductVO product) throws IOException{
		return "redirect:/marketList/itemBoard"; //jsp주소
	}


//	중고게시판
	// 중고게시판 리스트
	@RequestMapping("marketList/usedBoard") //url 예전 .do
	public ModelAndView test3(HttpServletResponse response) throws IOException{
		return new ModelAndView("redirect:/marketList/usedBoard"); //jsp주소
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
	// 중고게시판 수정
	@RequestMapping("market/usedUpdate") //url 예전 .do
	public ModelAndView test8(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/usedUpdate"); //jsp주소
	}
	// 중고게시판 수정 폼
	@RequestMapping("market/usedUpdateForm") //url 예전 .do
	public ModelAndView test13(HttpServletResponse response) throws IOException{
		return new ModelAndView("market/usedUpdateForm"); //jsp주소
	}
	// 장바구니
	@RequestMapping("marketList/cart") //url 예전 .do
	public ModelAndView test11(HttpServletResponse response) throws IOException{
		return new ModelAndView("marketList/cart"); //jsp주소
	}
}
