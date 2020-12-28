package co.company.papang.community.controller;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.company.papang.impl.SmMapper;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;

@RestController
public class CommunityRestController {
	
	@Autowired SmMapper dao;
	@RequestMapping("/community/commentInsert")
	public Community_comVO communityCommentInsert(Community_comVO community_comVO){
		community_comVO.setMbr_id("test");
		dao.communityCommentInsert(community_comVO);
		return community_comVO;
	}
}
