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
	private String mbr_id;
	private String mbr_pw;
	private String mbr_name;
	private String mbr_nick;
	private String mbr_birth;
	private String mbr_email;
	private String mbr_phone;
	private String mbr_post;
	private String mbr_addr1;
	private String mbr_addr2;
	private String mbr_bank;
	private String mbr_account;
	private String mbr_author;
	private String mbr_date;
	private String mbr_status;
	private String mbr_gender;	
	private String rcnt;
}