package co.company.papang.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.vo.MemberVO;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false); // 새로 세션 생성하지 말라는거
		MemberVO memberVo = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVo.getMbr_id();
		if (mbr_id != null) {
			return true; // 프리핸들러 실행해서 true면 해당하는 컨트롤러 불러오고
		}
		response.sendRedirect("login");
		return false; // false면 실행안하고 멈춘다
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("post interceptor 실행");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
