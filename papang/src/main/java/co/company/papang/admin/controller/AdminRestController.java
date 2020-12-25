package co.company.papang.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.company.papang.impl.JyMapper;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.NqVO;

@RestController
public class AdminRestController {
	@Autowired
	JyMapper jyMapper;

	// �쟾泥댁“�쉶
	@RequestMapping(value = "/nq", method = RequestMethod.GET)
	public List<NqVO> getNqList(Model model, NqVO vo) {
		return jyMapper.getListNq(vo);
	}

	// �벑濡�
	@RequestMapping(value = "/nq", method = RequestMethod.POST
	// ,produces="application/json"
	// ,consumes="application/json"
	// ,headers = {"Content-type=application/json" }
	)
	public Map insertNQ(NqVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// �씠誘몄��뙆�씪
		// request Multipart濡� 罹먯뒪�똿
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");

		// 泥⑤��뙆�씪
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/images");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename())); // �삤由ъ��꼸�씠由� : �뾽濡쒕뱶�맂 �썑�쓽
																							// �씠由�
			vo.setNq_file(multipartFile.getOriginalFilename());
		}
		jyMapper.insertNq(vo);
		return Collections.singletonMap("result", true);
	}

	// �떒嫄댁“�쉶
	@RequestMapping(value = "/nq/{nq_no}", method = RequestMethod.GET)
	public NqVO getNq(@PathVariable String nq_no, NqVO vo, Model model) {
		vo.setNq_no(nq_no);
		return jyMapper.getNq(vo);
	}

	// �궘�젣
	@RequestMapping(value = "/nq/{nq_no}", method = RequestMethod.DELETE)
	public Map getUserList(@PathVariable String nq_no, NqVO vo, Model model) {
		vo.setNq_no(nq_no);
		jyMapper.deleteNq(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}

	// �닔�젙
	@RequestMapping(value = "/nq", method = RequestMethod.PUT
	// ,produces="application/json" //�쓳�떟�뿤�뜑
			, consumes = "application/json" // �슂泥��뿤�뜑
	// ,headers = {"Content-type=application/json" }
	)
	public NqVO updateNq(NqVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// �씠誘몄��뙆�씪
		// request Multipart濡� 罹먯뒪�똿
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");

		// 泥⑤��뙆�씪
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/images");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename())); // �삤由ъ��꼸�씠由� : �뾽濡쒕뱶�맂 �썑�쓽
																							// �씠由�
			vo.setNq_file(multipartFile.getOriginalFilename());
		}
		jyMapper.updateNq(vo);
		return vo;
	}

	// 멤버리스트 조회

	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public List<MemberVO> getListMember(Model model, MemberVO vo) {
		return jyMapper.getListMember(vo);
	}
}
