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

import co.company.papang.admin.service.AdminService;
import co.company.papang.vo.AlarmVO;
import co.company.papang.vo.BannerVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.NqVO;
import co.company.papang.vo.SitterVO;
import co.company.papang.vo.WarehousingVO;

@RestController
public class AdminRestController {
	@Autowired
	AdminService service;

	// 공지사항 전체조회
	@RequestMapping(value = "/nq", method = RequestMethod.GET)
	public List<NqVO> getNqList(Model model, NqVO vo) {
		return service.getListNq(vo);
	}

	// 공지사항 등록
	@RequestMapping(value = "/nq", method = RequestMethod.POST
	// ,produces="application/json"
	// ,consumes="application/json"
	// ,headers = {"Content-type=application/json" }
	)
	public Map insertNQ(NqVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");

		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("resources/images/nqfile");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));

			vo.setNq_file(multipartFile.getOriginalFilename());
		}
		service.insertNq(vo);
		return Collections.singletonMap("result", true);
	}

	// 공지사항 단건조회
	@RequestMapping(value = "/nq/{nq_no}", method = RequestMethod.GET)
	public NqVO getNq(@PathVariable String nq_no, NqVO vo, Model model) {
		vo.setNq_no(nq_no);
		return service.getNq(vo);
	}

	// 공지사항 삭제
	@RequestMapping(value = "/nq/{nq_no}", method = RequestMethod.DELETE)
	public Map<String, Object> getUserList(@PathVariable String nq_no, NqVO vo, Model model) {
		vo.setNq_no(nq_no);
		service.deleteNq(vo);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}

	// 공지사항 수정
	@RequestMapping(value = "/nq", method = RequestMethod.PUT
	// ,produces="application/json" //�쓳�떟�뿤�뜑
			, consumes = "application/json" // �슂泥��뿤�뜑
	// ,headers = {"Content-type=application/json" }
	)
	public NqVO updateNq(NqVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");

		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("resources/images/nqfile");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename())); // �삤由ъ��꼸�씠由� : �뾽濡쒕뱶�맂 �썑�쓽
																							// �씠由�
			vo.setNq_file(multipartFile.getOriginalFilename());
		}
		service.updateNq(vo);
		return vo;
	}

	// 멤버리스트 조회
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public List<MemberVO> getListMember(Model model, MemberVO vo) {
		return service.getListMember(vo);
	}

	// 셀렉트 옵션으로 권한 수정 + 알림
	@RequestMapping(value = "/member", method = RequestMethod.PUT
	// ,produces="application/json" //응답헤더
			, consumes = "application/json" // 요청헤더
	// ,headers = {"Content-type=application/json" }
	)
	public MemberVO updateMember(@RequestBody MemberVO vo, Model model) {
		service.updateMember(vo);
		service.insertSitterAlarm(vo);
		return vo;
	}

	// 시터 정보 등록 (아이디,나이 구해서 넣기)
	@RequestMapping(value = "/sitter", method = RequestMethod.POST
	// ,produces="application/json"
	// ,consumes="application/json"
	// ,headers = {"Content-type=application/json" }
	)
	public Map insertsitter(@RequestBody SitterVO vo, Model model, HttpServletResponse response) {
		service.insertSitter(vo);
		return Collections.singletonMap("result", true);
	}

	// 시터 -> 회원 변경
	@RequestMapping(value = "/sitter/{sit_mbr_id}", method = RequestMethod.DELETE)
	public Map<String, Object> getSitterList(@PathVariable String sit_mbr_id, SitterVO vo, Model model) {
		vo.setSit_mbr_id(sit_mbr_id);
		service.deleteSitter(vo);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}

	// 시터 단건조회
	@RequestMapping(value = "/sitter/{sit_mbr_id}", method = RequestMethod.GET)
	public SitterVO getSitter(@PathVariable String sit_mbr_id, SitterVO vo, Model model) {
		vo.setSit_mbr_id(sit_mbr_id);
		return service.getSitter(vo);
	}

	// 시터 정보 추가 등록 , 수정
	@RequestMapping(value = "/sitterUpdate"
	// ,produces="application/json" //�쓳�떟�뿤�뜑

	// ,headers = {"Content-type=application/json" }
	)
	public SitterVO updateSitter(SitterVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		MultipartFile multipartFile = multipartRequest.getFile("uploadFile2");

		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("resources/images/sitterProfile");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));

			vo.setSit_pic(multipartFile.getOriginalFilename());
			System.out.println(vo.getSit_pic());
		}
		String result3 = "";

		for (String str : vo.getArray()) {
			result3 += str + ' ';
		}
		vo.setSit_off(result3);
		service.updateSitter(vo);
		return vo;
	}

	// 회원탈퇴 => 회원 상태를 탈퇴로 바꾸는것
	@RequestMapping(value = "/memberdelete", method = RequestMethod.PUT
	// ,produces="application/json" //응답헤더
			, consumes = "application/json" // 요청헤더
	// ,headers = {"Content-type=application/json" }
	)
	public MemberVO deleteMember(@RequestBody MemberVO vo, Model model) {
		service.deleteMember(vo);
		return vo;
	}

	// 배너 등록
	@RequestMapping(value = "/banner", method = RequestMethod.POST
	// ,produces="application/json"
	// ,consumes="application/json"
	// ,headers = {"Content-type=application/json" }
	)
	public Map insertBanner(BannerVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// �씠誘몄��뙆�씪
		// request Multipart濡� 罹먯뒪�똿
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile2");

		// 泥⑤��뙆�씪
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("resources/images/Banner");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename())); // �삤由ъ��꼸�씠由� : �뾽濡쒕뱶�맂 �썑�쓽
																							// �씠由�
			vo.setBan_pic(multipartFile.getOriginalFilename());
		}
		service.insertBanner(vo);
		return Collections.singletonMap("result", true);
	}

	// 배너 조회
	@RequestMapping(value = "/banner", method = RequestMethod.GET)
	public List<BannerVO> getbannerList(Model model, BannerVO vo) {
		return service.getbannerlist(vo);
	}

	// 배너 단건조회
	@RequestMapping(value = "/banner/{ban_no}", method = RequestMethod.GET)
	public BannerVO getBanner(@PathVariable String ban_no, BannerVO vo, Model model) {
		vo.setBan_no(ban_no);
		return service.getBanner(vo);
	}

	// 공지사항 수정
	@RequestMapping(value = "/bannerUpdate")
	public BannerVO updateBanner(BannerVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
			throws IllegalStateException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		MultipartFile multipartFile = multipartRequest.getFile("uploadFile2");

		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("resources/images/Banner");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename())); // �삤由ъ��꼸�씠由� : �뾽濡쒕뱶�맂 �썑�쓽
																							// �씠由�
			vo.setBan_pic(multipartFile.getOriginalFilename());
		}
		service.updateBanner(vo);
		return vo;
	}

	// 배너 삭제
	@RequestMapping(value = "/banner/{ban_no}", method = RequestMethod.DELETE)
	public Map<String, Object> deletebanner(@PathVariable String ban_no, BannerVO vo, Model model) {
		vo.setBan_no(ban_no);
		service.deleteBanner(vo);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}

	// 배너 상태 수정
	@RequestMapping(value = "/banner", method = RequestMethod.PUT
	// ,produces="application/json" //응답헤더
			, consumes = "application/json" // 요청헤더
	// ,headers = {"Content-type=application/json" }
	)
	public BannerVO bannerstatus(@RequestBody BannerVO vo, Model model) {
		service.updateBannerstatus(vo);
		return vo;
	}

	// 등록
	@RequestMapping(value = "/warehousing", method = RequestMethod.POST)
	public WarehousingVO insertUser(@RequestBody WarehousingVO vo, Model model) {
		service.Wareinsert(vo);
		System.out.println(vo);
		service.updateprocnt(vo);

		return vo;
	}

	// 입고/출고 조회
	@RequestMapping(value = "/warehousing", method = RequestMethod.GET)
	public List<Map<String, Object>> warehousinglist(Model model, WarehousingVO vo) {
		return service.warehousinglist(vo);
	}

	// 알림 갯수 조회
	@RequestMapping(value = "/alarm", method = RequestMethod.GET)
	public List<AlarmVO> getalarmList(Model model,AlarmVO vo) {
		return service.getacount(vo);
	}
	
	// 배너 상태 수정
	@RequestMapping(value = "/alarm", method = RequestMethod.PUT
	// ,produces="application/json" //응답헤더
			, consumes = "application/json" // 요청헤더
	// ,headers = {"Content-type=application/json" }
	)
	public AlarmVO alarmstatus(@RequestBody AlarmVO vo, Model model) {
		service.updateAstatus(vo);
		return vo;
	}

}
