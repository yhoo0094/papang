package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BagVO {
	private String mbr_id; // 장바구니 담는 회원의 아이디 = 세션아이디
	private String pro_no; // 상품번호
	private String bag_cnt; // 수량
}
