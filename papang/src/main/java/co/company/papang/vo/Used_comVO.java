package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Used_comVO {
	private String used_no; // 중고상품 글번호
	private String uc_no; // 댓글번호
	private String uc_date; // 작성일 sysdate
	private String uc_content; // 본문
	private String mbr_id; // 댓글작성자 아이디 = 세션아이디
}
