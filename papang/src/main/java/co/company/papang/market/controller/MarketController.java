package co.company.papang.market.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.impl.EsMapper;
import co.company.papang.market.service.MarketService;
import co.company.papang.vo.BagVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.Tran_infoVO;

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
	public String test9(HttpServletResponse response, HttpServletRequest request, ProductVO product)
			throws IllegalStateException, IOException{
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		
		//이미지파일(첨부파일 읽어내기)
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if(! multipartFile.isEmpty() && multipartFile.getSize()>0) {
			// 파일 경로 webapp 바로 밑이 최상위
			String path = request.getSession().getServletContext().getRealPath("/images");
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			product.setPro_pic(multipartFile.getOriginalFilename());
		}
		mk_service.insertItem(product);
//		dao.insertItem(product);
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
	// 장바구니 목록
	@RequestMapping("marketList/cart") //url 예전 .do
	public void test11(HttpSession session, Model model) throws IOException{
		MemberVO memberVo = (MemberVO)session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		List<BagVO> cartList = mk_service.getCartList(mbr_id);
		model.addAttribute("cart", cartList);
		//return new ModelAndView("marketList/cart"); //jsp주소
	}
	
	// 장바구니 등록
	@RequestMapping("market/cartInsert") //url 예전 .do
	@ResponseBody
	public int test14(HttpSession session, BagVO bag) throws IOException{
		int result = 0;
		
		MemberVO memberVo = (MemberVO)session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		bag.setMbr_id(mbr_id);
		mk_service.insertCart(bag);
		if (mbr_id != null) {
		// 회원아이디만 담아주고, 상품번호나 수량은 아작스로, 장바구니번호는 시퀀스로 담음
			result = 1;
		}
		return result;
	}
	// 장바구니 삭제
	@RequestMapping(value="/market/cartDelete", method=RequestMethod.POST) //url 예전 .do
	@ResponseBody
	public int test15(HttpSession session, @RequestParam(value="chBox[]") List<String> chArr, BagVO bag) throws IOException{
		MemberVO memberVo = (MemberVO)session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		int result = 0;
		int bag_no = 0;
		if(mbr_id != null) {
			bag.setMbr_id(mbr_id);
			System.out.println("chArr>>>>" + chArr);
			for(String i : chArr) {
				bag_no = Integer.parseInt(i);
				bag.setBag_no(bag_no);
				mk_service.deleteCart(bag);
			}
			result = 1;
		}
		return result; //jsp주소
	}
	
// 주문
	// 주문하기
	@RequestMapping(value="/market/order", method=RequestMethod.POST)
	public String test16(HttpSession session, Tran_infoVO tran, @RequestParam(value="chBox[]") List<String> chArr) throws IOException{
		MemberVO memberVo = (MemberVO)session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		return "";
	}
	
/*	@RequestMapping(value="/market/order", method=RequestMethod.POST) //url 예전 .do
	@ResponseBody
	public int test16(HttpSession session, @RequestParam(value="chBox[]") List<String> chArr, Tran_infoVO tran) throws IOException{
		MemberVO memberVo = (MemberVO)session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		int result = 0;
		int bag_no = 0;
		if(mbr_id != null) {
			for(String i : chArr) {
				bag_no = i;
				tran.setBag_no(bag_no);
				mk_service.orderInfo(tran);
			}
			result = 1;
		}
		return result; //jsp주소
	}

	// 주문하기 -> 목록생성
	@RequestMapping("market/order")
	public String test16(HttpSession session, Tran_infoVO tran, HttpServletRequest request) throws IOException {
// 선택상품주문 어렵네..
//		tran = new Tran_infoVO();
//		tran.setBag_no(request.getParameter("bag_no"));
//		tran = (Tran_infoVO) dao.orderInfo(tran);
//		request.setAttribute("tran", tran);
		// 전체상품 주문
		MemberVO memberVo = (MemberVO)session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		mk_service.orderInfo(tran);
		
		// 주문 후 장바구니 비우기
		mk_service.deleteAllCart(mbr_id);
		return "";// "redirect:/marketList/orderList";
	}*/
}

