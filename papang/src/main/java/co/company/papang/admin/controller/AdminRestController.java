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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.company.papang.impl.JyMapper;
import co.company.papang.vo.NqVO;

@RestController
public class AdminRestController {
	@Autowired
	JyMapper jyMapper;

	// 전체조회
	@RequestMapping(value = "/nq", method = RequestMethod.GET)
	public List<NqVO> getNqList(Model model, NqVO vo) {
		return jyMapper.getListNq(vo);
	}

	// 등록
	@RequestMapping(value = "/nq", method = RequestMethod.POST
	// ,produces="application/json"
	// ,consumes="application/json"
	// ,headers = {"Content-type=application/json" }
	)
	public Map insertNQ(NqVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 이미지파일
		// request Multipart로 캐스팅
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");

		// 첨부파일
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/images");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename())); // 오리지널이름 : 업로드된 후의 이름
			vo.setNq_file(multipartFile.getOriginalFilename());
		}
		jyMapper.insertNq(vo);
		return Collections.singletonMap("result", true);
	}

	// 단건조회
	@RequestMapping(value = "/nq/{nq_no}", method = RequestMethod.GET)
	public NqVO getNq(@PathVariable String nq_no, NqVO vo, Model model) {
		vo.setNq_no(nq_no);
		return jyMapper.getNq(vo);
	}

	// 삭제
	@RequestMapping(value = "/nq/{nq_no}", method = RequestMethod.DELETE)
	public Map getUserList(@PathVariable String nq_no, NqVO vo, Model model) {
		vo.setNq_no(nq_no);
		jyMapper.deleteNq(vo);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}

	// 수정
	@RequestMapping(value = "/nq", method = RequestMethod.PUT
	// ,produces="application/json" //응답헤더
			, consumes = "application/json" // 요청헤더
	// ,headers = {"Content-type=application/json" }
	)
	public NqVO updateUser(@RequestBody NqVO vo, Model model) {
		jyMapper.updateNq(vo);
		return vo;
	}
}
