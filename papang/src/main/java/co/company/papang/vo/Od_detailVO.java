package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Od_detailVO {
	private String od_detail_no;
	private String order_no;
	private String pro_no;
	private String bag_cnt;
	private String mbr_id;
}
