package co.company.papang.market.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Array;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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
import co.company.papang.vo.ReportVO;
import co.company.papang.vo.UsedVO;
import co.company.papang.vo.Used_comVO;
import co.company.papang.vo.WarehousingVO;

@Controller
public class MarketController {
	@Autowired
	EsMapper dao;
	@Autowired
	MarketService mk_service;
	@Autowired
	UsedService used_service;

// 상품판매	
	// 판매상품 전체 리스트 : 최신 등록순
	@RequestMapping("marketList/itemBoard") // url 예전 .do
	public ModelAndView test(ProductVO product) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pro", dao.getItemList(product));
		mav.setViewName("marketList/itemBoard");
		return mav; // jsp주소
	}

	// 가격높은순
	@RequestMapping("marketList/itemBoardPriceDesc") // url 예전 .do
	public ModelAndView test17(ProductVO product) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pro", dao.getItemListPriceDesc(product));
		mav.setViewName("marketList/itemBoard");
		return mav; // jsp주소
	}
	
	// 가격낮은순
	@RequestMapping("marketList/itemBoardPrice") // url 예전 .do
	public ModelAndView test19(ProductVO product) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pro", dao.getItemListPrice(product));
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
			String path = request.getSession().getServletContext().getRealPath("/resources/images/market");
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
	public String test6(HttpServletResponse response, HttpServletRequest request, ProductVO product)
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		// 이미지파일(첨부파일 읽어내기)
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			// 파일 경로 webapp 바로 밑이 최상위
			String path = request.getSession().getServletContext().getRealPath("/resources/images/market");
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			product.setPro_pic(multipartFile.getOriginalFilename());
		}
		mk_service.updateItem(product);
		return "redirect:/market/itemDetail?pro_no=" + product.getPro_no(); // jsp주소
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
	public ModelAndView test3(UsedVO used, HttpServletResponse response) throws IOException {
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
	public String getUsed(UsedVO used, Used_comVO used_com, @CookieValue(required = false) String usedCookie, Model model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws ClassNotFoundException, IOException {
		String usCookieVal = usedCookie==null?"":usedCookie;
		if(usedCookie == null || usedCookie.indexOf(used.getUsed_no() + "A") == -1) { // 쿠키 자체가 없거나, 쿠키 안에 값이 없을 때
			usCookieVal = usCookieVal + used.getUsed_no() + "A";
			used_service.hitPlus(used);
			Cookie cookie = new Cookie("usedCookie", usCookieVal);
			cookie.setMaxAge(60 * 60 * 24);
			response.addCookie(cookie);
		}
		model.addAttribute("used", used_service.getUsed(used)); // 지역선택에 따른 변화(셀렉트)
		model.addAttribute("used_comList", used_service.getUsedCommList(used_com)); // 댓글조회
		return "market/usedDetail"; // jsp주소
	}

	// 중고게시판 등록
	@RequestMapping("market/usedInsert") // url 예전 .do
	public String test10(HttpServletRequest request, UsedVO used, HttpSession session)
			throws IllegalStateException, IOException {
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVO.getMbr_id();
		used.setMbr_id(mbr_id);

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		// 이미지파일(첨부파일 읽어내기)
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			// 파일 경로 webapp 바로 밑이 최상위
			String path = request.getSession().getServletContext().getRealPath("/resources/images/used");
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			used.setUsed_pic(multipartFile.getOriginalFilename());
		}
		used_service.insertUsed(used);
		return "redirect:/marketList/usedBoard"; // jsp주소
	}

	// 중고게시판 등록 폼
	@RequestMapping("market/usedInsertForm") // url 예전 .do
	public ModelAndView test7(HttpServletResponse response) throws IllegalStateException, IOException {
		return new ModelAndView("market/usedInsertForm"); // jsp주소
	}

	// 중고게시판 수정
	@RequestMapping("market/usedUpdate") // url 예전 .do
	public String test8(UsedVO used, HttpServletRequest request, HttpServletResponse response)
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		// 이미지파일(첨부파일 읽어내기)
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			// 파일 경로 webapp 바로 밑이 최상위
			String path = request.getSession().getServletContext().getRealPath("/resources/images/used");
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			used.setUsed_pic(multipartFile.getOriginalFilename());
		}
		used_service.updateUsed(used);
		return "redirect:/market/usedDetail?used_no=" + used.getUsed_no();
	}

	// 중고게시판 수정 폼
	@RequestMapping("market/usedUpdateForm") // url 예전 .do
	public String test13(UsedVO used, Model model) throws IOException {
		model.addAttribute("used", used_service.getUsed(used));
		return "market/usedUpdateForm"; // jsp주소
	}

	// 중고게시판 삭제
	@RequestMapping("market/usedDelete") // url 예전 .do
	public String test17(UsedVO used) throws IOException {
		used_service.deleteUsed(used);
		return "redirect:/marketList/usedOnSaleBoard";
	}

// 댓글
	// 댓글 등록
	@ResponseBody
	@RequestMapping("used/usedComm") 
	public Used_comVO usedCommInsert(Used_comVO usedCom, HttpServletRequest request, HttpSession session) {
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVO.getMbr_id();
		usedCom.setMbr_id(mbr_id);
		used_service.usedCommInsert(usedCom);
		return usedCom;
	}

	// 댓글 수정
	@ResponseBody
	@RequestMapping("used/usedCommUpdate")
	public Used_comVO test19(Used_comVO usedCom) {
		used_service.usedCommUpdate(usedCom);
		return usedCom;
	}

	// 댓글 삭제
	@ResponseBody
	@RequestMapping("used/usedCommDelete")
	public int test20(Used_comVO usedCom) {
		return used_service.usedCommDelete(usedCom);
	}
	
	//신고하기
	@RequestMapping("used/report")
	public String commentReport(ReportVO reportVO) {
		return "report/report";
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

	// 장바구니중복체크
	@RequestMapping(value = "/ajax/cartCnt", method = RequestMethod.GET) // url 예전 .do
	@ResponseBody
	public int cartCnt(@RequestParam("pro_no") String pro_no, HttpSession session) throws IOException {
		MemberVO memberVo = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		return mk_service.countCart(pro_no, mbr_id); // jsp주소
	}

	// 장바구니 수정
	@RequestMapping("market/cartUpdate") // url 예전 .do
	@ResponseBody
	public int test18(HttpSession session, BagVO bag, HttpServletRequest request) throws IOException {
		int result = 0;

		String bag_cnt = request.getParameter("bag_cnt");
		int bag_no = Integer.parseInt(request.getParameter("bag_no"));
		bag.setBag_cnt(bag_cnt);
		bag.setBag_no(bag_no);
		
		mk_service.updateCart(bag);
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
	// 상품재고 update, 재고내역 insert
	@RequestMapping(value = "/market/changeWare", method = RequestMethod.POST)
	@ResponseBody
	public boolean test18(HttpSession session, @RequestParam(value = "proArr[]") List<String> proArr,
			@RequestParam(value = "bagArr[]") List<String> bagArr, BagVO bag, HttpServletRequest request) throws IOException {
		MemberVO memberVo = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		for(int i=0;i<proArr.size();i++) {
			bag.setPro_no(proArr.get(i));
			bag.setBag_cnt(bagArr.get(i));
			mk_service.updateProCnt(bag);
		}
		mk_service.minusWareCnt(mbr_id); // 출고내역
		return true;
	}

	// 전체 주문하기
	@RequestMapping(value = "/market/order", method = RequestMethod.POST)
	@ResponseBody
	public boolean test16(HttpSession session, Order_infoVO order, Od_detailVO detail, HttpServletRequest request)
			throws IOException {
		String order_sum = request.getParameter("order_sum");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String addressee = request.getParameter("addressee");
		MemberVO memberVo = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		order.setMbr_id(mbr_id);
		order.setOrder_sum(order_sum);
		order.setAddressee(addressee);
		order.setPost(post);
		order.setAddr1(addr1);
		order.setAddr2(addr2);
		order.setAddr3(addr3);

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

		detail.setOrder_no(order_no);
		detail.setMbr_id(mbr_id);

		mk_service.orderInsert(order, detail, mbr_id);// 주문완료시 3개 작동
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
