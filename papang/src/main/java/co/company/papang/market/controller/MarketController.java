package co.company.papang.market.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.Cookie;
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
import co.company.papang.market.service.UsedService;
import co.company.papang.vo.BagVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.Od_detailVO;
import co.company.papang.vo.Order_infoVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.UsedVO;
import co.company.papang.vo.Used_comVO;

@Controller
public class MarketController {
	@Autowired EsMapper dao;
	@Autowired MarketService mk_service;
	@Autowired UsedService used_service;

// 상품판매	
	// 판매상품 전체 리스트
	@RequestMapping("marketList/itemBoard") // url 예전 .do
	public ModelAndView test(ProductVO product) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pro", dao.getItemList(product));
		mav.setViewName("marketList/itemBoard");
		return mav; // jsp주소
	}

	// 판매상품 상세
	@RequestMapping("market/itemDetail") // url 예전 .do
	public String getItem(ProductVO product, Model model) throws IOException {
		model.addAttribute("pro", mk_service.getItem(product));
		return "market/itemDetail"; // jsp주소
	}
	
	// 판매상품 등록
	@RequestMapping("market/itemInsert") // url 예전 .do
	public String test9(HttpServletResponse response, HttpServletRequest request, ProductVO product)
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		// 이미지파일(첨부파일 읽어내기)
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			// 파일 경로 webapp 바로 밑이 최상위
			String path = request.getSession().getServletContext().getRealPath("/images");
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			product.setPro_pic(multipartFile.getOriginalFilename());
		}
		mk_service.insertItem(product);
//		dao.insertItem(product);
		return "redirect:/marketList/itemBoard"; // jsp주소
	}

	// 판매상품 등록 폼
	@RequestMapping("market/itemInsertForm") // url 예전 .do
	public ModelAndView test5(HttpServletResponse response) throws IOException {
		return new ModelAndView("market/itemInsertForm"); // jsp주소
	}

	// 판매상품 수정
	@RequestMapping("market/itemUpdate") // url 예전 .do
	public String test6(HttpServletResponse response, HttpServletRequest request, ProductVO product) throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//		String pro_no = request.getParameter("pro_no");
//		product.setPro_no(pro_no);
		
		// 이미지파일(첨부파일 읽어내기)
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			// 파일 경로 webapp 바로 밑이 최상위
			String path = request.getSession().getServletContext().getRealPath("/images");
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			product.setPro_pic(multipartFile.getOriginalFilename());
		}
		mk_service.updateItem(product);
		return "redirect:/market/itemDetail"; // jsp주소
	}

	// 판매상품 수정 폼
	@RequestMapping("market/itemUpdateForm") // url 예전 .do
	public String test12(HttpServletRequest request, ProductVO product, Model model) throws IOException {
		model.addAttribute("pro", mk_service.getItem(product));
		return "market/itemUpdateForm"; // jsp주소
	}

	// 판매상품 삭제
	@RequestMapping("market/itemDelete") // url 예전 .do
	public String test14(ProductVO product) throws IOException {
		mk_service.deleteItem(product);
		return "redirect:/marketList/itemBoard"; // jsp주소
	}

//	중고게시판
	// 중고게시판 리스트
	@RequestMapping("marketList/usedBoard") // url 예전 .do
	public ModelAndView test3(UsedVO used) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("usedList", used_service.getUsedList(used));
		mav.setViewName("marketList/usedBoard");
		return mav; // jsp주소
	}
	// 중고게시판 판매중 리스트
	@RequestMapping("marketList/usedOnSaleBoard") // url 예전 .do
	public ModelAndView test16(UsedVO used) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("usedList", used_service.onSaleUsedList(used));
		mav.setViewName("marketList/usedOnSaleBoard");
		return mav; // jsp주소
	}

	// 중고게시판 상세
	@RequestMapping("market/usedDetail") // url 예전 .do
	public String getUsed(UsedVO used, Used_comVO used_com, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 조회수 올리기
		if(used.getUsed_no() != null) {
			boolean existCookie = false;
			Cookie[] cookieList = request.getCookies();
			for(Cookie co : cookieList) {
				if(co.getValue().equals(used.getUsed_no())) {
					existCookie = true;
				}
			}
			//쿠키생성
			if(!existCookie) {
				//쿠키가 없는 경우
				System.out.println("쿠키생성");
				Cookie cookie = new Cookie("cookieCode", used.getUsed_no());
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
				used_service.hitPlus(used);
			}
			model.addAttribute("used",used_service.getUsed(used)); // 지역선택에 따른 변화(셀렉트)
			// model.addAttribute("used_comList",used_service.getUsedComList(used_com)); // 댓글조회
		}
		// model.addAttribute("used", used_service.getUsed(used));
		return "market/usedDetail"; // jsp주소
	}

	// 중고게시판 등록
	@RequestMapping("market/usedInsert") // url 예전 .do
	public String test10(HttpServletRequest request, UsedVO used, HttpSession session) throws IllegalStateException, IOException {
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVO.getMbr_id();
		used.setMbr_id(mbr_id);
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		// 이미지파일(첨부파일 읽어내기)
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			// 파일 경로 webapp 바로 밑이 최상위
			String path = request.getSession().getServletContext().getRealPath("/images");
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			used.setUsed_pic(multipartFile.getOriginalFilename());
		}
		used_service.insertUsed(used);
		return "redirect:/marketList/usedBoard"; //jsp주소
	}

	// 중고게시판 등록 폼
	@RequestMapping("market/usedInsertForm") // url 예전 .do
	public ModelAndView test7(HttpServletResponse response) throws IOException {
		return new ModelAndView("market/usedInsertForm"); // jsp주소
	}

	// 중고게시판 수정
	@RequestMapping("market/usedUpdate") // url 예전 .do
	public ModelAndView test8(HttpServletResponse response) throws IllegalStateException, IOException {
		return new ModelAndView("market/usedUpdate"); // jsp주소
	}

	// 중고게시판 수정 폼
	@RequestMapping("market/usedUpdateForm") // url 예전 .do
	public ModelAndView test13(HttpServletResponse response) throws IOException {
		return new ModelAndView("market/usedUpdateForm"); // jsp주소
	}

// 장바구니
	// 장바구니 목록
	@RequestMapping("marketList/cart") // url 예전 .do
	public void test11(HttpSession session, Model model) throws IOException {
		MemberVO memberVo = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		List<BagVO> cartList = mk_service.getCartList(mbr_id);
		model.addAttribute("cart", cartList);
		// return new ModelAndView("marketList/cart"); //jsp주소
	}

	// 장바구니 등록
	@RequestMapping("market/cartInsert") // url 예전 .do
	@ResponseBody
	public int test14(HttpSession session, BagVO bag) throws IOException {
		int result = 0;

		MemberVO memberVo = (MemberVO) session.getAttribute("user");
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
	@RequestMapping(value = "/market/cartDelete", method = RequestMethod.POST) // url 예전 .do
	@ResponseBody
	public int test15(HttpSession session, @RequestParam(value = "chBox[]") List<String> chArr, BagVO bag)
			throws IOException {
		MemberVO memberVo = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		int result = 0;
		int bag_no = 0;
		if (mbr_id != null) {
			bag.setMbr_id(mbr_id);
			System.out.println("chArr>>>>" + chArr);
			for (String i : chArr) {
				bag_no = Integer.parseInt(i);
				bag.setBag_no(bag_no);
				mk_service.deleteCart(bag);
			}
			result = 1;
		}
		return result; // jsp주소
	}

// 주문
	
	// 전체 주문하기
	@RequestMapping(value = "/market/order", method = RequestMethod.POST)
	@ResponseBody
	public boolean test16(HttpSession session, Order_infoVO order, Od_detailVO detail, HttpServletRequest request) throws IOException {
		String order_sum = request.getParameter("order_sum");
		MemberVO memberVo = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		order.setMbr_id(mbr_id);
		order.setOrder_sum(order_sum);
		
		// 주문번호 무작위 생성
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String order_no = ymd + subNum;
		order.setOrder_no(order_no);
		mk_service.orderInfo(order);
		
		detail.setOrder_no(order_no);
		detail.setMbr_id(mbr_id);
		mk_service.orderDetail(detail);
		
		mk_service.deleteAllCart(mbr_id); // 전체주문이니까 주문끝나면 카트 완전히 비우기
		return true;
	}
	// 선택 주문하기
//	@RequestMapping(value="/market/order", method=RequestMethod.POST)
//	public String test17(HttpSession session, Order_infoVO tran, @RequestParam(value="chBox[]") List<String> chArr) throws IOException{
//		MemberVO memberVo = (MemberVO)session.getAttribute("user");
//		String mbr_id = memberVo.getMbr_id();
//		return "";
//	}

	/*
	 * @RequestMapping(value="/market/order", method=RequestMethod.POST) //url 예전
	 * .do
	 * 
	 * @ResponseBody public int test16(HttpSession
	 * session, @RequestParam(value="chBox[]") List<String> chArr, Tran_infoVO tran)
	 * throws IOException{ MemberVO memberVo =
	 * (MemberVO)session.getAttribute("user"); String mbr_id = memberVo.getMbr_id();
	 * int result = 0; int bag_no = 0; if(mbr_id != null) { for(String i : chArr) {
	 * bag_no = i; tran.setBag_no(bag_no); mk_service.orderInfo(tran); } result = 1;
	 * } return result; //jsp주소 }
	 */
}
