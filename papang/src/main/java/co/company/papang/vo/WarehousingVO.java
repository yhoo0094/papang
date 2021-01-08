package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class WarehousingVO {
	private String ware_no;
	private String pro_no;
	private String ware_cnt;
	private String ware_date;
	private String ware_note;
	private String ware_category;
}
