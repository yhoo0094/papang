package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
	private String pro_no; // 상품번호
	private String pro_name; // 상품명
	private String pro_price; // 가격
	private String pro_pic; // 메인사진
	private String pro_detail; // 본문(디테일)
	private String pro_cnt; // 재고..?
	private String pro_cc; // 기업코드
	private String pro_cn; // 기업명
}
