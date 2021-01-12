package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	private String mbr_id; // 중복체크
	private String mbr_pw; // 비번확인
	private String mbr_name;
//	private String mbr_nick; // 유니크
	private String mbr_birth;
	private String mbr_email; // 필수아님
	private String mbr_phone;
	private String mbr_post;
	private String mbr_addr1;
	private String mbr_addr2;
	private String mbr_addr3;
	private String mbr_bank; // 필수아님
	private String mbr_account; // 필수아님
	private String mbr_author; // 디폴트 user
	private String mbr_date; // 디폴트 sysdate
	private String mbr_status; // 디폴트 활동중
	private String mbr_gender;	
	private String rcnt; // 재영아..
	private String mbr_pic;
	private int authstatus; // 이메일인증(완료시 1)
	private String authkey; // 권한키
}