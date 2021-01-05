package co.company.papang.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.company.papang.impl.SmMapper;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.MemberVO;

@RestController
public class CommunityRestController {
	
	@Autowired SmMapper dao;
	@RequestMapping("/community/commentInsert")
	public Community_comVO communityCommentInsert(Community_comVO community_comVO, HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVO.getMbr_id();
		community_comVO.setMbr_id(mbr_id);
		int r = dao.communityCommentInsert(community_comVO);
		return community_comVO;
	}
}
