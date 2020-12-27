package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsedVO {
	private String used_no; // 글번호
	private String mbr_id; // 작성자 아이디 = 세션아이디
	private String used_title; // 글제목
	private String used_date; // 작성일 디폴트 sysdate
	private String used_category; // 디폴트 판매중
	private String used_loc; // 지역 : 택배, 등등
	private String used_pic; // 사진
	private String used_hit; // 조회수
	private String used_price; // 가격
	private String used_content; // 본문
}
